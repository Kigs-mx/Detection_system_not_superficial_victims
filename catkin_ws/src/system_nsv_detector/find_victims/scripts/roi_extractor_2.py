#!/usr/bin/env python
from imutils.object_detection import non_max_suppression
import imutils
import roslib
import copy
import numpy as np
import sys
import rospy
import cv2
import time
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

min_th = 230
max_th = 255

min_area = 100                                          
max_area = 1000

def rois_extraction (cv_image):
    pre_rois = []
    boundingBoxing = []

#    cv_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
    clone = copy.copy(cv_image)
    clone_2 = copy.copy(cv_image)
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(3,3))
    grayimg = clahe.apply(clone)
    
    grayimg = cv2.GaussianBlur(grayimg,(5,5),0)

    ret1,th1 = cv2.threshold(grayimg, min_th, 255,cv2.THRESH_BINARY)
    re2,th2 = cv2.threshold(grayimg, max_th, 255, cv2.THRESH_BINARY_INV)

    band_thresh = cv2.bitwise_and(th1, th2)
#    print "i make a threshold band"
    contours, hierarchy = cv2.findContours(band_thresh,cv2.RETR_TREE,cv2.CHAIN_APPROX_NONE)
    mask = np.zeros(clone.shape, dtype=np.uint8)
    cv2.drawContours(mask,contours,-1,255,-1)
#    print "contours done"

    for c in contours:
        #if the contour is to small, ignore it
#        print "search contours"
        if cv2.contourArea(c) > min_area and cv2.contourArea(c) < max_area: 
            boundingBoxing.append(cv2.boundingRect(c))
            #print "I found a ROI"
        else:
            #print "Is not ROI"
            continue

    for (x, y, w, h) in boundingBoxing:
        cv2.rectangle(cv_image, (x, y), (x + w, y + h), 0, 1)

    rects = np.array([[x, y, x + w, y + h] for (x, y, w, h) in boundingBoxing])
    pick = non_max_suppression(rects, probs=None, overlapThresh=0.65)

    for (xA, yA, xB, yB) in pick:
       aux_roi = clone[yA:yB,xA:xB]
       pre_rois.append(aux_roi)
       cv2.rectangle(clone_2, (xA, yA), (xB, yB), 0, 1)
    
    print len(pre_rois)

    return pre_rois;


def callback(data):
  bridge = CvBridge()
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
#  gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
  cv_image = cv2.flip(cv_image,1)
  rois = rois_extraction(cv_image)
  if len(rois) != 0:
    print "we've rois"
    #cv2.imshow("Result", rois[0])
    #time.sleep(0.25)
    #cv2.waitKey(1)
    try:
      
      image_pub = rospy.Publisher("/rois_detected/rois", Image, queue_size=1)
      image_pub.publish(bridge.cv2_to_imgmsg(rois[0],"mono8"))

    except CvBridgeError as e:
      print (e)
  else:
    print ":("

def main(args):

  rospy.init_node('roi_extractor', anonymous=False)
  image_sub = rospy.Subscriber("camera/image",Image,callback)
#  image_sub = rospy.Subscriber("thermal/image_raw",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
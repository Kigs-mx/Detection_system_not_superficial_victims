#!/usr/bin/env python
from imutils.object_detection import non_max_suppression
import imutils
import roslib
import copy
import numpy as np
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

min_th = 240
max_th = 255

min_area = 100                                          
max_area = 2500

max_r = 255
min_r = 250

def roi_extractor(pre_rois):
    final_rois = []
    boundingBoxing_2 = []
    
    print "pre-rois encontradas"
    print len(pre_rois)

    for j in range(0, len(pre_rois)):
        band_thresh_2 = cv2.inRange(pre_rois[j], min_r, max_r)
        cont, hierar = cv2.findContours(band_thresh_2, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
        cont = sorted(cont, key=cv2.contourArea, reverse=True)[:3]
        print "contornos_finales"  
        print len(cont)

        for k in cont:
            if cv2.contourArea(k) > 30 and cv2.contourArea(k) < 1000: 
                boundingBoxing_2.append(cv2.boundingRect(k))
     #           print "found final roi"

                rects_2 = np.array([[x, y, x + w, y + h] for (x, y, w, h) in boundingBoxing_2])
                pick_2 = non_max_suppression(rects_2, probs=None, overlapThresh=0.65)
                clone_t = copy.copy(pre_rois[j])
                
                for (x1A, y1A, x1B, y1B) in pick_2:
                    cv2.rectangle(clone_t, (x1A, y1A), (x1B, y1B), 0, 1)  
                    final_rois.append(pre_rois[j][y1A:y1B,x1A:x1B])
    #        else:
    #            print "nothing to do"

    if len(final_rois) != 0:
        cv2.imshow("final_roi_0", final_rois[0])
        print "rois finales"
        print len(final_rois)
        #cv2.waitKey()
        return final_rois
    else:
        print "overdefinition"
        return pre_rois


def roi_finder (cv_image):
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
    contours = sorted(contours, key=cv2.contourArea, reverse=True)[:3]
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

    if len(pre_rois) != 0:
        cv2.imshow("pre_roi_0", pre_rois[0])        
        #cv2.waitKey()
        final_rois = roi_extractor(pre_rois)
        return final_rois
    else:
        return pre_rois    


def callback(data):
  bridge = CvBridge()
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
#  gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
  cv_image = cv2.flip(cv_image,1)
  rois = roi_finder(cv_image)
  print "Rois encontradas"
  print len(rois)
  if len(rois) != 0:
    cv2.imshow("find_roi", cv_image)
    cv2.waitKey(1)
    print "we have rois"
    if len(rois) == 1:
      try:
        rois[0] = imutils.resize(rois[0], width=min(20, rois[0].shape[1]))
        image_pub = rospy.Publisher("/rois_detected/rois_1", Image, queue_size=1)
        image_pub.publish(bridge.cv2_to_imgmsg(rois[0],"mono8"))

      except CvBridgeError as e:
        print (e)
      
    elif len(rois) == 2:
      try:
        rois[0] = imutils.resize(rois[0], width=min(20, rois[0].shape[1]))
        rois[1] = imutils.resize(rois[1], width=min(20, rois[1].shape[1]))

        image_pub = rospy.Publisher("/rois_detected/rois_1", Image, queue_size=1)
        image_pub.publish(bridge.cv2_to_imgmsg(rois[0],"mono8"))

        image_pub_2 = rospy.Publisher("/rois_detected/rois_2", Image, queue_size=1)
        image_pub_2.publish(bridge.cv2_to_imgmsg(rois[1],"mono8"))

      except CvBridgeError as e:
        print (e)

    elif len(rois) == 3:
      try:

        rois[0] = imutils.resize(rois[0], width=min(20, rois[0].shape[1]))
        rois[1] = imutils.resize(rois[1], width=min(20, rois[1].shape[1]))
        rois[2] = imutils.resize(rois[2], width=min(20, rois[2].shape[1]))

        image_pub = rospy.Publisher("/rois_detected/rois_1", Image, queue_size=1)
        image_pub.publish(bridge.cv2_to_imgmsg(rois[0],"mono8"))

        image_pub_2 = rospy.Publisher("/rois_detected/rois_2", Image, queue_size=1)
        image_pub_2.publish(bridge.cv2_to_imgmsg(rois[1],"mono8"))

        image_pub_3 = rospy.Publisher("/rois_detected/rois_3", Image, queue_size=1)
        image_pub_3.publish(bridge.cv2_to_imgmsg(rois[2],"mono8"))

      except CvBridgeError as e:
        print (e)
  else:
    print ":("

def main(args):

  rospy.init_node('roi_extractor', anonymous=False)
  #image_sub = rospy.Subscriber("camera/image",Image,callback)
  image_sub = rospy.Subscriber("thermal/image_raw",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
#!/usr/bin/env python
import roslib
import copy
import numpy as np
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

min_th = 245
max_th = 255

w_width = 60
w_height = 40

def roi_finder (cv_image):
    pre_rois = []

#    cv_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
    clone = copy.copy(cv_image)
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(3,3))
    grayimg = clahe.apply(clone)
    
    grayimg = cv2.GaussianBlur(grayimg,(5,5),0)

    ret1,th1 = cv2.threshold(grayimg, min_th, 255,cv2.THRESH_BINARY)
    re2,th2 = cv2.threshold(grayimg, max_th, 255, cv2.THRESH_BINARY_INV)

    band_thresh = cv2.bitwise_and(th1, th2)
#    print "i make a threshold band"
    contours, hierarchy = cv2.findContours(band_thresh,cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)
    contours = sorted(contours, key=cv2.contourArea, reverse=True)[:3]
#    print "contours done"
    
    i = 0
    cv_image = cv2.cvtColor(cv_image, cv2.COLOR_GRAY2RGB)

    for c in contours:
      
      i=i+1
      M = cv2.moments(c)

      if M["m00"] != 0:
        cX = int(M["m10"]/ M["m00"])
        cY = int(M["m01"]/ M["m00"])
          
        xA = cX - w_width/2
        yA = cY - w_height/2

        xB = cX + w_width/2
        yB = cY + w_height/2

        cv2.rectangle(cv_image, (xA,yA),(xB,yB),(0,0,255),2)
        aux_roi = clone[yA:yB,xA:xB]
        pre_rois.append(aux_roi)

        cv2.putText(cv_image,"ROI_%i"%i,(int(xA - 5), int(yA-5)),cv2.FONT_HERSHEY_SIMPLEX,0.43,(0,0,255),2)
        #cv2.drawContours(clone, [c], -1, (0, 255, 0), 2)
        #cv2.circle(cv_image, (cX, cY), 7, 0, 2)
        #print "iteracion"
        #print i
    #print "rois detectadas"
    #print len(pre_rois)
    if len(pre_rois) != 0:
      cv2.imshow("find_roi", cv_image)        
      #final_rois = roi_extractor(pre_rois)
      #return final_rois
    #else:
      return pre_rois


def callback(data):
  bridge = CvBridge()
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
#  gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
  cv_image = cv2.flip(cv_image,1)
  rois = roi_finder(cv_image)
  #print "Rois encontradas"
  #print len(rois)
  if len(rois) != 0:
    #cv2.imshow("find_roi", cv_image)
    cv2.waitKey(1)
    #print "we have rois"
    if len(rois) == 1:
      try:    
        image_pub = rospy.Publisher("/rois_detected/rois_1", Image, queue_size=10)
        image_pub.publish(bridge.cv2_to_imgmsg(rois[0],"mono8"))

      except CvBridgeError as e:
        print (e)

    elif len(rois) == 2:
      try:

        image_pub = rospy.Publisher("/rois_detected/rois_1", Image, queue_size=10)
        image_pub.publish(bridge.cv2_to_imgmsg(rois[0],"mono8"))

        image_pub_2 = rospy.Publisher("/rois_detected/rois_2", Image, queue_size=10)
        image_pub_2.publish(bridge.cv2_to_imgmsg(rois[1],"mono8"))

      except CvBridgeError as e:
        print (e)

    elif len(rois) == 3:
      try:

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
  image_sub = rospy.Subscriber("thermal_camera/image_raw",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
import time
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

min_area = 5000
max_area = 18000

min_th = 220
max_th = 255

def find_hottest_points(cv_image):
  
  clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(3,3))
  #gray = clahe.apply(img)
  gray = clahe.apply(cv_image)
  gray = cv2.GaussianBlur (gray, (21,21), 0)

  min_thresh = cv2.threshold(gray, min_th, 255, cv2.THRESH_BINARY)[1]
  max_thresh = cv2.threshold(gray, max_th, 255, cv2.THRESH_BINARY_INV)[1]

  thresh = cv2.bitwise_and(min_thresh, max_thresh)

  thresh = cv2.dilate(thresh, None, iterations = 2)
  (cnts, _) = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL,
    cv2.CHAIN_APPROX_SIMPLE)

  for c in cnts:
    if cv2.contourArea(c) > min_area and cv2.contourArea(c) < max_area:
      
      (x,y,w,h) = cv2.boundingRect(c)
#      cv2.rectangle(cv_image, (x, y), (x+w, y+h), (0, 255, 0), 2)
      cv2.rectangle(cv_image, (x, y), (x+w, y+h), 0, 2)
      continue


  cv2.imshow("region_detector", cv_image)
  cv2.moveWindow("region_detector",900,0)
  cv2.imshow("band_threshold_image", thresh)
  cv2.moveWindow("band_threshold_image",900,400)
  cv2.waitKey(1)

def callback(data):
  bridge = CvBridge()
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
  cv_image = cv2.flip(cv_image,1)
  find_hottest_points(cv_image)

def main(args):

  rospy.init_node('find_keypoints', anonymous=False)
  #image_sub = rospy.Subscriber("camera/image",Image,callback)
  image_sub = rospy.Subscriber("thermal_camera/image_raw",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
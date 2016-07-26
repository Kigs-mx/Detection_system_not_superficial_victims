#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
import numpy as np
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

zero = True

def draw_flow(img, flow, step=8):
  
  h, w = img.shape[:2]
  y, x = np.mgrid[step/2:h:step, step/2:w:step].reshape(2,-1)
  fx, fy = flow[y,x].T
  lines = np.vstack([x, y, x+fx, y+fy]).T.reshape(-1, 2, 2)
  lines = np.int32(lines + 0.5)
  vis = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)
  cv2.polylines(img, lines, 0, (0,0,255))
  #for (x1, y1), (x2, y2) in lines:
    #cv2.circle(vis, (x1, y1), 1, (0, 255, 0), -1)
  return img

def motion_detector(cv_image, prev):

  #prevgray = cv2.cvtColor(prev, cv2.COLOR_BGR2GRAY)
  gray = cv_image
  flow = cv2.calcOpticalFlowFarneback(prev, gray, 0.5, 1, 23, 3, 3, 1.2, 1)
  prevgray = gray

  cv2.imshow('flow', draw_flow(gray, flow))
  cv2.waitKey(1)  


def callback(data):
  global zero, prev

  #cv2.namedWindow("flow",1)
  #cv2.moveWindow("flow",500,00)

  #cv2.namedWindow("zero_image",1)
  #cv2.moveWindow("zero_image",600,0)

  bridge = CvBridge()

  if zero:
    prev = bridge.imgmsg_to_cv2(data, "mono8")
    cv_image = cv2.flip(prev,1)
    #ret1,prev = cv2.threshold(prev, 0, 0,cv2.THRESH_BINARY)
    zero = False
  
  #cv2.imshow("zero_image", prev)
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
  #gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
  
  cv_image = cv2.flip(cv_image,1)
  #cv2.imshow("motion_detector", cv_image)
  
  motion_detector(cv_image, prev)
#  cv2.imshow("Gray Image window", gray)
  
def main(args):

  rospy.init_node('motion_detector', anonymous=False)
  #image_sub = rospy.Subscriber("camera/image",Image,callback)
  image_sub = rospy.Subscriber("thermal_camera/image_raw",Image,callback)
  #image_sub = rospy.Subscriber("rois_detected/rois_1",Image,callback)
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
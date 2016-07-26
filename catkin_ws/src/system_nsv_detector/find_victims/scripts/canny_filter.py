#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
from std_msgs.msg import String
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


def canny_detector(image, sigma):
  # compute the median of the single channel pixel intensities
    v = np.median(image)
 
# apply automatic Canny edge detection using the computed median
    lower = int(max(0, (1.0 - sigma) * v))
    upper = int(min(255, (1.0 + sigma) * v))
    edged = cv2.Canny(image, lower, upper*3, image, 3, True)
 
# return the edged image
    return edged

def callback(data):
  bridge = CvBridge()
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
  #gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
  #cv_image = cv2.flip(cv_image,1)
  clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8,8))
  equ = clahe.apply(cv_image)
  grayimg = cv2.GaussianBlur(equ,(5,5),0)
  et1,th1 = cv2.threshold(grayimg,245,255,cv2.THRESH_TOZERO)
  #th3 = cv2.adaptiveThreshold(grayimg,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY,11,2)  

  result = canny_detector(th1,0.33)

  gray = cv2.addWeighted(result,1,grayimg,0.75,1)


  cv2.imshow("Original_Image", cv_image)
  cv2.moveWindow("Original_Image",450,0)
  cv2.imshow("Canny_filter", gray)
  cv2.moveWindow("Canny_filter",450,200)
  cv2.waitKey(1)


def main(args):

  rospy.init_node('canny_filter', anonymous=False)
  #image_sub = rospy.Subscriber("camera/image",Image,callback)
  #image_sub = rospy.Subscriber("thermal/image_raw"cv2.moveWindow("band",450,0),Image,callback)
  image_sub = rospy.Subscriber("/rois_detected/rois_1",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
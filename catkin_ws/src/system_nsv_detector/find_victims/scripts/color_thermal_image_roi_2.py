#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
import numpy as np
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

def color_presentation (cv_image):
  
  cv_image = cv2.flip(cv_image, 1)
  im = cv2.cvtColor(cv_image, cv2.COLOR_GRAY2BGR)
  
  lut = np.zeros((256, 1, 3), dtype=np.uint8)

  lee_val=[]                          
  #readFile=open("/home/kigs/catkin_ws/src/find_victims/scripts/flir_2_invert_256_rgb.txt","r")
  #readFile=open("/home/kigs/catkin_ws/src/find_victims/scripts/paleta_9_inv.txt","r")
  readFile=open("/home/kigs/catkin_ws/src/system_nsv_detector/find_victims/scripts/palette_d.txt","r")

  for line in readFile:               
      line=line.split()               
      line=map(int,line)          
      lee_val.append((line))  
    
  readFile.close()

  a=np.array([lee_val])

  lut[:,0,2] = a[0,:,0]
  lut[:,0,1] = a[0,:,1]
  lut[:,0,0] = a[0,:,2]
    
  im_color = cv2.LUT(im, lut)

  cv2.imshow("Color_thermal_roi_2_image", im_color)
#  cv2.waitKey(1)
  if cv2.waitKey(10) == 32:
    cv2.imwrite('screenshot_thermal_image_color.bmp', im_color)

  return im_color;

def callback(data):
  
  bridge = CvBridge()
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
  color_presentation(cv_image)


def main(args):

  rospy.init_node('color_roi_2_representation', anonymous=False)
#  image_sub = rospy.Subscriber("camera/image",Image,callback)
  image_sub = rospy.Subscriber("rois_detected/rois_2",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
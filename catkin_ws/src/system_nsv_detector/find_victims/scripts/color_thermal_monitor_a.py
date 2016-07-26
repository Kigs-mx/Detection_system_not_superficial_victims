#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
import imutils
import numpy as np
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

offset_w = 5
offset_h = 35

w = 320
h = 256

scale = cv2.imread('/home/kigs/Pictures/img_thermal_tesis/color_palette/palette_a.png')
scale = imutils.resize(scale, width=min(20, scale.shape[1]))
(sc_h, sc_w) = scale.shape[:2]

overlay = np.zeros((h, w, 3), dtype="uint8")
overlay[h - sc_h - offset_h:h - offset_h, w - sc_w - offset_w:w - offset_w] = scale

def color_presentation (cv_image):
  global i

  cv_image = cv2.flip(cv_image, 1)
  im = cv2.cvtColor(cv_image, cv2.COLOR_GRAY2BGR)
  
  lut = np.zeros((256, 1, 3), dtype=np.uint8)

  lee_val=[]                          
  readFile=open("/home/kigs/catkin_ws/src/system_nsv_detector/find_victims/scripts/palette_a.txt","r")

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

  output = im_color.copy()
  #print "video"
  #print output.shape
  #print "scale"
  #print overlay.shape
  output = cv2.addWeighted(overlay, 1, output, 0.7, 0)

  #cv_image = imutils.resize(cv_image, width = 640)
  cv2.imshow("Color_thermal_image_a", output)
  key = cv2.waitKey(1)

  if key == ord("s"):
    i=i+1
    cv2.imwrite('/home/kigs/Pictures/img_thermal_tesis/thermal_image_color_a_%i.bmp'%i, output)
    print "screenshot captured"
    print i


  return im_color;

def callback(data):

  bridge = CvBridge()
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
  cv2.flip(cv_image,1)
  color_presentation(cv_image)


def main(args):
  global i

  i = 0
  rospy.init_node('color_monitor_a', anonymous=False)
  image_sub = rospy.Subscriber("thermal_camera/image_raw",Image,callback)
  #image_sub = rospy.Subscriber("camera/image",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
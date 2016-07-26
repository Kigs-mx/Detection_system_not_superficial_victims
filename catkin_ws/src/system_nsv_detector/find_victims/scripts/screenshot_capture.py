#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

def callback(data):
  global i
  
  bridge = CvBridge()
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
  
  cv_image = cv2.flip(cv_image,1)
  cv2.imshow("Original_Image", cv_image)
  key = cv2.waitKey(1)
  
  if key == ord("s"):
    i=i+1
    cv2.imwrite('/home/kigs/Pictures/img_thermal_for_robocup/hand_up_full_body/hu_fb_%i.jpg'%i, cv_image)
    print "screenshot captured"
    print i

def main(args):
  global i
  
  i = 0
  rospy.init_node('screenshot_capture', anonymous=False)
  #image_sub = rospy.Subscriber("camera/image",Image,callback)
  image_sub = rospy.Subscriber("thermal_camera/image_raw",Image,callback)

  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
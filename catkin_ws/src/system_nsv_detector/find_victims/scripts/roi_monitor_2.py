#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

def callback(data):
  bridge = CvBridge()
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
#  gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
  #cv_image = cv2.flip(cv_image,1)
  cv2.imshow("Original_Image", cv_image)
  print "suscrito a roi 2"
#  cv2.imshow("Gray Image window", gray)
  cv2.waitKey(1)


def main(args):

  rospy.init_node('roi_monitor_2', anonymous=False)
#  image_sub = rospy.Subscriber("camera/image_2",Image,callback)
#  image_sub = rospy.Subscriber("thermal/image_raw",Image,callback)
  image_sub = rospy.Subscriber("rois_detected/rois_2",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
import time
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class video_record:

  def __init__(self):

    self.bridge = CvBridge()
#    self.image_sub = rospy.Subscriber("thermal/image_raw",Image,self.callback)
    self.image_sub = rospy.Subscriber("camera/image",Image,self.callback)
    self.image = None

  def callback(self,data):
    try:
      self.cv_image = self.bridge.imgmsg_to_cv2(data, "mono8")
    except CvBridgeError as e:
      print(e)
    cv2.imshow("video", self.cv_image)
    cv2.waitKey(1)
    
    while self.image_sub:
      fourcc = cv2.cv.CV_FOURCC('M','P','4','V')
      out = cv2.VideoWriter('video.avi', fourcc, 30.0, (320,250))
      out.write(self.cv_image)

    return self.cv_image


def main(args):
  ic = video_record()
  rospy.init_node('record_video', anonymous=False)
  
  try:  
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
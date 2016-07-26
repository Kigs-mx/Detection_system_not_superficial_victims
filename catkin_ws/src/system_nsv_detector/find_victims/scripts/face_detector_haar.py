#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
import numpy as np
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

face_cascade = cv2.CascadeClassifier('cascades/haarcascade_frontalface_default.xml')
#face_cascade = cv2.CascadeClassifier('cascades/haarcascade_upperbody.xml')
eye_cascade = cv2.CascadeClassifier('cascades/haarcascade_eye.xml')

def face_detection (cv_image):

	cv_image = cv2.flip(cv_image, 1)
#	gray_vid = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
	
	clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8,8))
	#gray_vid = clahe.apply(gray_vid)
	gray_vid = clahe.apply(cv_image)

	faces = face_cascade.detectMultiScale(gray_vid, 1.2, 5)

	print "entro a funcion"
	print faces

	for (x, y, w, h) in faces:
		cv2.rectangle(cv_image, (x,y), (x+w, y+h), (255, 0, 0), 2)
		roi_gray = gray_vid[y:y+h, x:x+w]
		roi_color = cv_image[y:y+h, x:x+w]

#		eyes = eye_cascade.detectMultiScale(roi_gray)

#		print "entro a caras"

#		for(ex, ey, ew, eh) in eyes:
#			cv2.rectangle(roi_color, (ex, ey), (ex+ew, ey+eh), (0, 255, 0), 2)
#			print "entro a ojos"	  	

	#cv2.imshow("video_stream", cv_image)
  	#cv2.waitKey(1)

	return cv_image

def callback(data):
  
  bridge = CvBridge()
#  cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
  img = face_detection(cv_image)

def main(args):

  rospy.init_node('face_detector', anonymous=False)
  #image_sub = rospy.Subscriber("camera/image",Image,callback)
  image_sub = rospy.Subscriber("thermal/image_raw",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
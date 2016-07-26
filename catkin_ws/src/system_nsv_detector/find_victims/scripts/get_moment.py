#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
import copy
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

min_th = 240
max_th = 255

w_width = 60
w_height = 40

def human_scaner(image):
    centers = []

    clone = copy.copy(image)
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(3,3))
    grayimg = clahe.apply(clone)

    grayimg = cv2.GaussianBlur(grayimg,(5,5),0)

    ret1,th1 = cv2.threshold(grayimg, min_th, 255,cv2.THRESH_BINARY)
    re2,th2 = cv2.threshold(grayimg, max_th, 255, cv2.THRESH_BINARY_INV)

    band_thresh = cv2.bitwise_and(th1, th2)

    #cv2.imshow("band", band_thresh)

    contours, hierarchy = cv2.findContours(band_thresh,cv2.RETR_TREE,cv2.CHAIN_APPROX_NONE)
    contours = sorted(contours, key=cv2.contourArea, reverse = True)[:5]

    print 'Contornos encontrados'
    print len(contours)
    i = 0

    for c in contours:
        i=i+1
        M = cv2.moments(c)

        if M["m00"] != 0:
            cX = int(M["m10"]/ M["m00"])
            cY = int(M["m01"]/ M["m00"])

            centers.append((cX,cY))
          
            xA = cX - w_width/2
            yA = cY - w_height/2

            xB = cX + w_width/2
            yB = cY + w_height/2

            cv2.rectangle(image, (xA,yA),(xB,yB),0,1)

            cv2.drawContours(clone, [c], -1, 0, 2)
            cv2.circle(image, (cX, cY), 7, 0, 2)

            if i >= 4:
              print centers
            
            print "iteracion"
            print i

    cv2.imshow("result", image)
    #cv2.imshow("test", clone)

    centers = sorted(centers, key=lambda x:x[0], reverse = True)

    if len(centers) != 0:
      print "centros encontrados"
      print len(centers)
      return centers

def callback(data):

  bridge = CvBridge()
  #cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
  cv_image = bridge.imgmsg_to_cv2(data, "mono8")
  cv_image = cv2.flip(cv_image,1)
  
  cv2.imshow("Original_Image", cv_image)
  centers = human_scaner(cv_image)
  cv2.waitKey(1)


def main(args):

  rospy.init_node('get_centers', anonymous=False)
  #image_sub = rospy.Subscriber("camera/image",Image,callback)
  image_sub = rospy.Subscriber("thermal_camera/image_raw",Image,callback)
  
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
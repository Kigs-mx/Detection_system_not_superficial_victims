#!/usr/bin/env python
import roslib
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import fft
import mlpy.wavelet as wave
import time
import os



class image_converter:
    def __init__(self):
        self.flag = True
        self.bridge = CvBridge()
        
        self.image_sub = rospy.Subscriber("thermal/image_raw",Image,self.callback)  
        
        #self.image_sub = rospy.Subscriber("camera/image",Image, self.callback)
	   
        self.cuenta=0
        self.selection = None
        #self.drag_start = None
        #self.tracking_state = 0
        self.show_backproj = False
        self.t0=time.time()

        self.f=open('datosA.txt','w')
        self.cv_image=None
    
        self.trackers = []
        self.flag=True
        self.datos=[]

        self.proceso=False

               
    def callback(self,data):
        
        try:
	       self.cv_image = self.bridge.imgmsg_to_cv2(data, "mono8")
        except CvBridgeError as e:
          print(e)

        #self.cv_image = cv2.blur(self.cv_image, (5,5))  
        #gray = cv2.cvtColor(self.cv_image, cv2.COLOR_BGR2GRAY)
        gray= self.cv_image.copy()

        cv2.imshow("Image window", gray)
        #cv2.setMouseCallback("Image window", self.onmouse)

        if not self.flag and self.proceso:
            self.trackers.append(gray)
            if self.cuenta<1500:   #612 :     256:
                self.cuenta+=1
                if self.cuenta==1:
                    self.t0=time.time()    

            else:
                print self.selection
                self.t0=time.time()-self.t0 
                print self.t0
                self.proceso=False
                self.flag=True
                self.cuenta=0
                i=0.0
                xe=[]
                x=[]

                dirname = 'Completo8'
                os.mkdir(dirname)
                os.chdir(dirname)
                #plt.figure()
                #plt.imshow(self.trackers[1])

                for tracker in self.trackers:
                    i+=1
                                 
                    cv2.imwrite('Completo8_%i.bmp'%i,tracker)
                    
                    '''
                    x=np.mean(tracker)
                    self.datos.append(x)
                    
                    self.f.write(str(x))
                    self.f.write(' ')
                    '''                    
                    equ = cv2.equalizeHist(tracker)   
                    promequ=np.mean(equ)
                    xe.append(promequ)
                    prom=np.mean(tracker)
                    x.append(prom)
                    

        ch =cv2.waitKey(1) 

        if ch== 27:
        # Number of sample points

            #Nd = len(self.datos)
            #print type(self.datos)
            print 'N'
            #print self.datos.shape
 

        if ch == ord ('c'):
            
            self.selection = None       
            self.flag= True
            self.trackers = []
            self.datos=[]


        if ch == ord ('i'):    
            self.proceso=True
            self.flag= False
            print 'i'
            print self.selection
            

    
                   
                     	

def main(args):
  ic = image_converter()
  rospy.init_node('image_converter', anonymous=True)
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()


if __name__ == '__main__':
    main(sys.argv)


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


class image_converter:
    def __init__(self):
        self.flag = True
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("thermal/image_raw",Image,self.callback)  
        #self.image_sub = rospy.Subscriber("camera/image",Image, self.callback)
        
        self.f = open('Pulso2w', 'w')


        self.cuenta=0
        self.selection = None
        self.drag_start = None
        self.tracking_state = 0
        self.show_backproj = False
        self.t0=time.time()


        self.cv_image=None
        
#        self.thrs1 = 500
#        self.thrs2 = 1200
        self.thrs1 = 70
        self.thrs2 = 80
        
        self.trackers = []

        self.datos=[]

        self.proceso=False

    def onmouse(self, event, x, y, flags, param):
        x, y = np.int16([x, y]) # BUG        
        if event == cv2.EVENT_LBUTTONDOWN:
            self.drag_start = (x, y)
            self.tracking_state = 0
        if self.drag_start:
            if flags & cv2.EVENT_FLAG_LBUTTON:
                h, w = self.cv_image.shape[:2]
                xo, yo = self.drag_start
                x0, y0 = np.maximum(0, np.minimum([xo, yo], [x, y]))
                x1, y1 = np.minimum([w, h], np.maximum([xo, yo], [x, y]))
                self.selection = None
                if x1-x0 > 0 and y1-y0 > 0:
                    self.selection = (x0, y0, x1, y1)
            else:
                self.drag_start = None
                if self.selection is not None:
                    self.tracking_state = 1

    def show_hist(self):
        bin_count = self.hist.shape[0]
        bin_w = 24
        img = np.zeros((256, bin_count*bin_w, 1), np.uint8)
        for i in xrange(bin_count):
            h = int(self.hist[i])
            cv2.rectangle(img, (i*bin_w+2, 255), ((i+1)*bin_w-2, 255-h), (int(180.0*i/bin_count), 255, 255), -1)
        img = cv2.cvtColor(img, cv2.COLOR_HSV2BGR)
        cv2.imshow('hist', img)
    
               
    def callback(self,data):
        
        try:
           #self.cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
           self.cv_image = self.bridge.imgmsg_to_cv2(data, "mono8")
        except CvBridgeError as e:
          print(e)

        self.cv_image = cv2.blur(self.cv_image, (5,5))  
        #gray = cv2.cvtColor(self.cv_image, cv2.COLOR_BGR2GRAY)
        gray= self.cv_image.copy()
    
                #vise = self.cv_image.copy()
        #self.t0=time.time()-self.t0
        #print self.t0
        #print self.flag
        #print self.proceso
        #print '___'    


        if self.selection and self.flag:
            x0, y0, x1, y1 = self.selection
            x1=x0+30
            y1=y0+30
            self.selection=x0,y0,x1,y1
            
            print x0
            print x1
            print y0
            print y1

            #self.track_window = (x0-30, y0-30, x1-x0+30, y1-y0+30)
            self.track_window = (x0, y0, x1, y1)
            self.flag=False

            vis_roi = gray[y0:y1, x0:x1]
            cv2.bitwise_not(vis_roi, vis_roi)
            cv2.rectangle(gray,(x0,y0),(x1,y1),75,1)
            self.trackers.append(vis_roi)
            cv2.imshow("Image window", gray)
            cv2.setMouseCallback("Image window", self.onmouse)
            

        #    edge = cv2.Canny(self.cv_image[y0:y1, x0:x1], self.thrs1, self.thrs2, apertureSize=3)
        #    vise = vise[y0:y1, x0:x1]
        #    vise[edge != 0] = (255self.trackers.append(tracker)        #    cv2.imshow('edge', vise)
    
        #    x=np.mean(gray[y0:y1, x0:x1])
        #    self.datos.append(x)

        
 #       self.cv_image = cv2.blur(self.cv_image, (5,5))
        #if not self.flag:
        
        if self.flag:
            cv2.imshow("Image window", gray)
            cv2.setMouseCallback("Image window", self.onmouse)
           
        # cv2.waitKey(1)
        if not self.flag and self.proceso:
            x0, y0, x1, y1 = self.selection
            #if self.cuenta<2148 :     #256:
            if self.cuenta<1124 :     #256:
                self.trackers.append(gray[y0:y1, x0:x1])
                self.cuenta+=1

                if self.cuenta==1:
                    self.t0=time.time()    
                #print self.cuenta
            else:

                print x0
                print x1
                print y0 
                print y1
                self.t0=time.time()-self.t0 
                print self.t0
                self.proceso=False
                self.flag=True
                self.cuenta=0
                i=0.0
                for tracker in self.trackers:
                    i+=1
                    
                    cv2.imwrite('Pulso2_%i.bmp'%i,tracker)
                    x=np.mean(tracker)
                    self.datos.append(x)
                    self.f.write(str(x))
                    self.f.write(' ')
                    #print x
                
                ndatos=np.array(self.datos)
                N=float(len(ndatos))
                
                ndatos=ndatos[51:N-50]
                #ndatos=ndatos[:N-1]
                #[1:]
                
                print len(ndatos)
                print '___'
                #print ndatos

                scales = wave.autoscales(N=ndatos.shape[0], dt=1, dj=0.25, wf='dog', p=2)
                X = wave.cwt(x=ndatos, dt=1, scales=scales, wf='dog', p=2)
                #Xf=X[15:,:]   #quita las bajas frecuencias

                #scales=scales[15:]
                #Xf=X[:15,:]   #quita las altas frecuencias 

                #scales=scales[:15]

                #Xf=X[15:18,:]   #quita las altas frecuencias 

                #scales=scales[15:18]    
                #Xf=X[15:25,:]   #quita las altas frecuencias 
                #scales=scales[15:25]    
                Xf=X[18:25,:]   #quita las altas frecuencias 
                scales=scales[18:25]    


                X2=wave.icwt(Xf, dt=1, scales=scales, wf='dog', p=2)



                fig = plt.figure(1)
                ax1 = plt.subplot(2,2,1)
                p1 = ax1.plot(ndatos)
                #ax1.autoscale_view(tight=True)

                ax2 = plt.subplot(2,2,2)
                p2 = ax2.imshow(np.abs(X), origin='lower', extent=[-4,4,-1,1], aspect=4)                
                #p2 = ax2.imshow(np.abs(X), interpolation='nearest')                
                #ax2.autoscale_view(tight=True)            
        

                ax3 = plt.subplot(2,2,3)
                p3 = ax3.imshow(np.abs(Xf),origin='lower', extent=[-4,4,-1,1], aspect=4)
                #p3 = ax3.imshow(np.abs(Xf), interpolation='nearest')
                #ax3.autoscale_view(tight=True)

                ax4 = plt.subplot(2,2,4)
                p4 = ax4.plot(np.abs(X2))
                #ax4.autoscale_view(tight=True)
                #plt.show()
                #self.datos=[]
                #ndatos=[]
                self.trackers = []
                self.datos=[]    
                #print len(ndatos)


                # Number of sample points
                nN = len(X2)
                # sample spacing
                #T = 1.0 / 60.0
                T=.01862
                x = np.linspace(0.0, nN*T, nN)
                yf = fft(X2)
                xf = np.linspace(0.0, 1.0/(2.0*T), nN/2)

                plt.figure(2)
                plt.subplot(211)
                plt.plot(X2)

                plt.subplot(212)
                plt.plot(xf*60, 2.0/nN * np.abs(yf[0:nN/2]))
                plt.show()

                
                #print self.trackers.shape
        
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
            

    

'''
            ndatos=np.array(self.datos)
            x=ndatos[5:]
            #[1:]
            N=float(len(ndatos))
            print N

            scales = wave.autoscales(N=x.shape[0], dt=1, dj=0.25, wf='dog', p=2)
            X = wave.cwt(x=x, dt=1, scales=scales, wf='dog', p=2)
        
            scales=scales[15:]
        

            X2=wave.icwt(Xf, dt=1, scales=scales, wf='dog', p=2)



            fig = plt.figure(1)
            ax1 = plt.subplot(2,2,1)
            p1 = ax1.plot(x)
            ax1.autoscale_view(tight=True)

            ax2 = plt.subplot(2,2,2)
            p2 = ax2.imshow(np.abs(X), interpolation='nearest')
            
    

            ax3 = plt.subplot(2,2,4)
            p3 = ax3.imshow(np.abs(Xf), interpolation='nearest')

            ax4 = plt.subplot(2,2,3)
            p4 = ax4.plot(np.abs(X2))
            plt.show()
            self.datos=[]


            # Number of sample points
            N = len(X2)
            # sample spacing
            T = 1.0 / 60.0
            x = np.linspace(0.0, N*T, N)
            yf = fft(X2)
            xf = np.linspace(0.0, 1.0/(2.0*T), N/2)

            plt.figure(2)
            plt.subplot(211)
            plt.plot(X2)

            plt.subplot(212)
            plt.plot(xf, 2.0/N * np.abs(yf[0:N/2]))
            plt.show()
'''



'''
            N = len(self.datos)
            #print type(self.datos)
            #print N
            #print self.datos.shape
            ndatos=np.array(self.datos)
            ndatos=ndatos[5:]
            #[1:]
            N=float(len(ndatos))
    # sample spacing
            T = 1.0 / 60.0
            x = np.linspace(0.0, N*T, N)
            yf = fft(self.datos)
            xf = np.linspace(0.0, 1.0/(2.0*T), N/2)

            plt.figure()
            plt.subplot(211)
            plt.plot(self.datos)

            plt.subplot(212)
            plt.plot(xf, 2.0/N * np.abs(yf[0:N/2]))
            plt.show()
            self.datos=[]
#            plt.grid()
'''     
            
            
           
            
       
                        

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


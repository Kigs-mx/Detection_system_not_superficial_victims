
(cl:in-package :asdf)

(defsystem "video_web-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "ResizedImage" :depends-on ("_package_ResizedImage"))
    (:file "_package_ResizedImage" :depends-on ("_package"))
  ))
;;;; my-app.lisp

(in-package #:my-app)

;;; "my-app" goes here. Hacks and glory await!

(load-plugins)

(defroute (:get "/") (req res)
  (send-response res :body "Thanks for stopping by!"))

(defun start ()
  (as:with-event-loop ()
    (start-server (make-instance 'listener :port 8000))))

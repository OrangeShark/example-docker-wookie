;;;; my-app.lisp

(in-package #:my-app)

;;; "my-app" goes here. Hacks and glory await!

(load-plugins)

(defroute (:get "/") (req res)
  (send-response res :body "Thanks for stopping by!"))

(defroute (:* ".+") (req res)
  (send-response res :body "Page not found." :status 404))

(defun my-app-error-handler (ev &optional sock)
  (let* ((sockdata (when sock (as:socket-data sock)))
         (response (getf sockdata :response))
         (request (when response (response-request response))))
    (vom:error "app: ~a" ev)

    (when response
       (wookie:send-response response :key 500 :body "error"))))

(defun start ()
  (as:with-event-loop (:catch-app-errors 'my-app-error-handler)
    (start-server (make-instance 'wookie:listener
                                 :port 8000
                                 :event-cb 'my-app-error-handler))))

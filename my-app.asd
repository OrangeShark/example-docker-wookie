;;;; my-app.asd

(asdf:defsystem #:my-app
  :description "Describe my-app here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:wookie)
  :serial t
  :components ((:file "package")
               (:file "my-app")))


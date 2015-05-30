FROM orangeshark/wookie
ENV APP my-app
ENV SRC /root/.local/share/common-lisp/source/$APP
WORKDIR $SRC
ADD . $SRC
CMD sbcl --non-interactive --eval '(ql:quickload "my-app")' --eval '(my-app:start)'

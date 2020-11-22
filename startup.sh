#!/bin/bash

cleanup(){
  vncserver -Kill
}

trap "cleanup" INT

rm -rfv /tmp/.X*-lock /tmp/.X11-unix

vncserver $DISPLAY -SecurityTypes None

read -n 1 -r -s -p $'Press any key to exit\n'

cleanup

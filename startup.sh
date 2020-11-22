#!/bin/bash

cleanup(){
  vncserver -Kill
}

trap "cleanup" INT

rm -rfv /tmp/.X*-lock /tmp/.X11-unix

vncserver $DISPLAY -SecurityTypes None -noxstartup

fluxbox

cleanup

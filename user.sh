#!/bin/bash

function add_users(){
  for name in {1..100}
  do
        if grep -q "^$name:" /etc/passwd ; then
          echo "$name exists"
        else
          adduser user$name --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --force-badname
          echo "user$name:1q2w3e4r" | chpasswd
          echo "user$name created"
        fi
  done
}

add_users &
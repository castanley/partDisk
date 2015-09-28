#!/bin/bash
drives="a b c d e f g h i j k l m n o p q r s t u v w x y z"

for i in $drives
do
  parted -a optimal --script /dev/sd${i} -- mktable gpt
  parted -a optimal --script /dev/sd${i} -- mkpart primaty 0 -1
  mkfs.ext4 -m 0 /dev/sd${i}1 &
done

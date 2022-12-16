#!/bin/zsh
#FILES="/home/sid/Desktop/images/*.png"
COUNT=0
for f in *.png
do
  #echo "Processing $f file..."
  # take action on each file. $f store current file name
  f="${f%.*}"
  echo "& .$f::before { content: url(\"https://qtznz4zvmu4mnzyjzbj5ug.on.drv.tw/cdn/vi/images/$f.png\")}" | tee -a ./test.scss
  ((COUNT=COUNT+1))
  echo $COUNT
done

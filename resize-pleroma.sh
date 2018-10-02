#!/bin/bash

DIR=/home/pleroma/pleroma/uploads

for file in ${DIR}/*/*
do
  if [ ! -f "${file}.done" ];
  then
    TYPE=`file -b "${file}" | grep 'image data'`
    if [[ $TYPE = *"image data"* ]];
    then
      echo "converting ${file}"
      convert "${file}" -quality 70% -resize 800x800 "${file}.new"
      mv "${file}.new" "${file}"
      touch "${file}.done"
    fi
  fi
done

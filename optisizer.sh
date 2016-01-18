#!/bin/zsh

# Optisizer.sh

# The MIT License (MIT)
#
# Copyright (c) 2016 Ben Stevinson
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

if [ $# -eq 0 ]
then
   echo "Usage: [-hw] Specify height/width [-e] Specify File Extension"
   exit
fi

while getopts ":h:w:e:" opt; do
  case ${opt} in
    h)
      height=$OPTARG
      ;;

    w )
      width=$OPTARG
      ;;

    e )
      extension=$OPTARG
      ;;

    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;

    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

if [ ! $extension ]
then
   echo "Please specify a file extension with -e"
   exit
fi

if [ $height ] && [ $width ]
then
   echo "Height and width both specified, resizing, but this will probably break image aspect ratio."
   echo "If you'd like to retain image aspect ratio, specify only height or width."

   echo "Resizing..."
   mogrify *.$extension -resize "$width"x"$height" *.$extension
   echo "Optimizing..."
   /Applications/ImageOptim.app/Contents/MacOS/ImageOptim *.$extension
   exit
fi

if [ $height ] && [ ! $width ]
then
  echo "Resizing..."
  mogrify *.$extension -resize x"$height" *.$extension
  echo "Optimizing..."
  /Applications/ImageOptim.app/Contents/MacOS/ImageOptim *.$extension

else
  echo "Resizing..."
  mogrify *.$extension -resize "$width"x *.$extension
  echo "Optimizing..."
  /Applications/ImageOptim.app/Contents/MacOS/ImageOptim *.$extension
fi

# Optisizer
The Optisizer is a simple shell script that batch resizes and optimizes images. It accepts width, height, or both width and height for resizing, and will retain aspect ratio if only one edge is selected.

## Dependencies
The Optisizer should be run on OSX with [ImageMagick](http://www.imagemagick.org/script/index.php) and [ImageOptim](https://imageoptim.com) installed.

If you use Brew, just run `brew install imagemagick` to install the ImageMagick dependencies.

## Install & Use
I suggest putting this in a hidden folder in your home directory and making an alias to it. Personally, I call my bash scripts folder `.scripts`.

From there, alias Optisizer by executing `alias optisizer='bash ~/.scripts/optisizer.sh'` if you're using Bash, or `alias optisizer='zsh ~/.scripts/optisizer.sh'` if you use zsh as your default shell.

Once installed, navigate into the directory of images you want to optimize.

Optisizer takes three arguments:
- -w - Width to resize to
- -h - Height to resize to
- -e - Extension of images in directory (such as jpg or png)

To resize all jpg files in a directory to 800 pixels wide while retaining proportional height/aspect ratio, execute:
`optisizer -w 800 -e jpg`

That's it!


----------
I created this because I've been blogging more of my photography lately and I needed an easy way to batch resize and optimize hundreds of photos. I have a lot of photos that I exported at a high quality that would wreck user experience if they were uploaded unoptimized.

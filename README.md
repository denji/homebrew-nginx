# Nginx Homebrew Tap

This tap is designed specifically for a custom build of Nginx with more module options.


## Installation

    brew tap marcqualie/nginx
    brew install nginx-full


## Why submit modules here?

Rather than submitting modules to the core Homebrew Nginx Forumla this repo will serve as a place where any module can be added and configured for custom purposes.


## What about conflicts?

You are free to install this version alongside a current install of Nginx from `mxcl/homebrew` if you wish. However, they cannot be linked at the same time. To switch between them use brew's built in linking system.

    brew unlink nginx
    brew link nginx-full


## Credits

Credit for the original base formula comes from https://github.com/mxcl/homebrew/blob/master/Library/Formula/nginx.rb and I will keep this formula up to date with any changes made there.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/marcqualie/homebrew-nginx/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


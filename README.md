# NGINX Homebrew Tap

This tap is designed specifically for a custom build of NGINX with more module options.

## How do I install these formule (NGINX Modules)?
Once the tap is installed, you can install `nginx-full`
with optional [additional modules](https://brew.sh/homebrew-nginx/#modules):

    brew tap denji/nginx
    brew install nginx-full --with-upload-module

For a list of available configuration options run:

    brew options nginx-full
    brew info nginx-full

## What about conflicts?
You are free to install this version alongside a current install of NGINX from `Homebrew/homebrew` if you wish. However, they cannot be linked at the same time. To switch between them use brew's built in linking system.

    brew unlink nginx
    brew link nginx-full

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://github.com/Homebrew/brew/blob/master/docs/README.md).

## Contributing
Please see the [contributing guide](https://github.com/denji/homebrew-nginx/blob/master/.github/CONTRIBUTING.md).

## How to submit a new formula
* Fork this repository on GitHub.
* Clone to your Mac.
* Read and look at the other formule here.
* In your locally cloned `homebrew-nginx` repo, create a new branch: `git checkout --branch my_new_formula`
* Write/edit your formula (ruby file). Check [Homebrew's documentation](https://github.com/Homebrew/brew/blob/master/docs/README.md) for details.
* Test it locally! `brew install ./my-new-formula.rb`. Does it install? Note, `./<formula>.rb` will target the local file.
* `git push --set-upstream origin my-new-formula` to get it into your GitHub fork as a new branch.
* If you have to change something, add a commit and `git push`.
* On GitHub, select your new branch and then click the "Pull Request" button.

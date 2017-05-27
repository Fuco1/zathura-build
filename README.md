# Dockerized zathura

This repository contains the complete setup for dockerizing [zathura](https://pwmt.org/projects/zathura/), the most awesomest pdf browser ever.

Available on the [hub](https://hub.docker.com/r/fuco1/zathura/).

This project uses [build-base](https://github.com/Fuco1/build-base) structure.

# Why?

Various Linux distributions often update their packages slowly and so you end up running some old version.  With this setup I can build new version in matter of minutes (basically just run one command and wait).

# How do I run it?

Use the `zathura.sh` shell wrapper to run zathura.  You can make a symlink with better name, such as `zathura` in some directory in your `$PATH`, for example (assuming `~/bin` is in `$PATH`):

    ln -s $(pwd)/zathura.sh ~/bin/zathura

then use `zathura` as you normally would.  Passing the file as the second argument automatically opens it in a new instance.

# How do I build it?

Assuming you `git clone`d this repository, run `git submodule update --init`.

Then run `build.sh`.

# The setup

The setup is separated into two environments: build and runtime.

## Dockerfile.build

Build environment with all the build-time dependencies.  The local repositories are mounted as volumes, so the output of the build is stored on the host machine.  These files are then copied into the distribution runtime image.

The advantage is that during the runtime you don't need 500 megabytes of extra dependencies.

## Dockerfile

This is the runtime image.

# Contribute

Due to the dependency hell of gtk, the image is quite big.  I was not able to bring it down much.  If you know how to install just the essentials of gtk without all the bloat or how to purge the image of this, please tell me!  I would love to make this image lighter.

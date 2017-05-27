#!/bin/bash

__DIR__=$(dirname $(readlink -f "$0"))
[[ ! -s ~/bin/zathura ]] && ln -s ${__DIR__}/zathura.sh ~/bin/zathura

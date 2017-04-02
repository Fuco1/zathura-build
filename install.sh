#!/bin/bash

export TERM="xterm"

cd /girara && make install && make install
cd /zathura && make install
cd /zathura-pdf-poppler && make install
cd /zathura-djvu && make install
cd /zathura-ps && make install
cd /zathura-cb && make install

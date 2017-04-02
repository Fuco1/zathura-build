FROM debian:jessie

RUN apt-get update && apt-get install -y \
    djvulibre-bin \
    libarchive13 \
    libcairo2 \
    libgtk-3-0 \
    libmagic1 \
    libpoppler-glib8 \
    libspectre1 \
    libsynctex-dev \
    make

COPY ./girara /girara
COPY ./zathura /zathura
COPY ./zathura-cb /zathura-cb
COPY ./zathura-djvu /zathura-djvu
COPY ./zathura-pdf-poppler /zathura-pdf-poppler
COPY ./zathura-ps /zathura-ps

# Do not rebuild the application, it was build in the build step
RUN sed -i -E -e 's/(install-.*?:).*?/\1/' /girara/Makefile && \
    sed -i -E -e 's/(install-.*?:).*?/\1/' /zathura/Makefile && \
    sed -i -E -e 's/^(install:.*?)\ball\b(.*?)/\1 \2/' /zathura/Makefile && \
    sed -i -E -e 's/(install:).*?/\1/' /zathura-cb/Makefile && \
    sed -i -E -e 's/(install:).*?/\1/' /zathura-djvu/Makefile && \
    sed -i -E -e 's/(install:).*?/\1/' /zathura-pdf-poppler/Makefile && \
    sed -i -E -e 's/(install:).*?/\1/' /zathura-ps/Makefile

ENV TERM "xterm"

RUN cd /girara && make install && \
    cd /zathura && make install && \
    cd /zathura-cb && make install && \
    cd /zathura-djvu && make install && \
    cd /zathura-pdf-poppler && make install && \
    cd /zathura-ps && make install

ENTRYPOINT ["/usr/bin/zathura"]
CMD []

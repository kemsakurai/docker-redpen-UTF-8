#
# Java 1.8 & RedPen Dockerfile
# https://github.com/kemsakurai/docker-redpen-UTF-8
#

# Pull base image.
FROM enonic/java8

# maintainer details
MAINTAINER Ken Sakurai "sakurai.kem@gmail.com"

# DownLoad Redpen
WORKDIR /tmp
RUN wget -q https://github.com/redpen-cc/redpen/releases/download/redpen-1.5.2/redpen-1.5.5.tar.gz -O - | tar xz && \
    cp -av redpen-distribution-1.5.5/* /usr/local/ && \
    rm -rf redpen-distribution-1.5.5

RUN export PATH=$PATH:/usr/local/bin
WORKDIR /data

CMD ["/usr/local/bin/redpen"]

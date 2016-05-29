#
# Java 1.8 & RedPen Dockerfile
# https://github.com/kemsakurai/docker-redpen-UTF-8
#

# pull base image.
FROM java:8

# maintainer details
MAINTAINER Ken Sakurai "sakurai.kem@gmail.com"

# Set Locale
RUN apt-get install -y --no-install-recommends apt-utils locales
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# DownLoad Redpen
WORKDIR /tmp
RUN wget -q https://github.com/redpen-cc/redpen/releases/download/v1.5.0/redpen-1.5.0.tar.gz -O - | tar xz && \
    cp -av redpen-distribution-1.5/* /usr/local/ && \
    rm -rf redpen-distribution-1.5

RUN export PATH=$PATH:/usr/local/bin
WORKDIR /data

CMD ["/usr/local/bin/redpen"]

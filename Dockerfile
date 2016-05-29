#
# Java 1.8 & RedPen Dockerfile
# https://github.com/kemsakurai/docker-redpen-UTF-8
#

# pull base image.
FROM java:8

# maintainer details
MAINTAINER Ken Sakurai "sakurai.kem@gmail.com"

# Set Locale
# RUN apt-get install -y --no-install-recommends apt-utils locales
# RUN locale-gen en_US.UTF-8  
# ENV LANG en_US.UTF-8  
# ENV LANGUAGE en_US:en  
# ENV LC_ALL en_US.UTF-8
RUN yum -y reinstall glibc-common
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";

env LANG=ja_JP.UTF-8
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# DownLoad Redpen
WORKDIR /tmp
RUN wget -q https://github.com/redpen-cc/redpen/releases/download/v1.5.0/redpen-1.5.0.tar.gz -O - | tar xz && \
    cp -av redpen-distribution-1.5/* /usr/local/ && \
    rm -rf redpen-distribution-1.5

RUN export PATH=$PATH:/usr/local/bin
WORKDIR /data

CMD ["/usr/local/bin/redpen"]

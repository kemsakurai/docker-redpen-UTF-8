#
# Java 1.8 & RedPen Dockerfile
# https://github.com/kemsakurai/docker-redpen-UTF-8
#

# Pull base image.
FROM dockerfile/ubuntu:14.04

# maintainer details
MAINTAINER Ken Sakurai "sakurai.kem@gmail.com"

# Set locale
RUN apt-get install -y --no-install-recommends apt-utils locales
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]

# DownLoad Redpen
WORKDIR /tmp
RUN wget -q https://github.com/redpen-cc/redpen/releases/download/v1.5.0/redpen-1.5.0.tar.gz -O - | tar xz && \
    cp -av redpen-distribution-1.5/* /usr/local/ && \
    rm -rf redpen-distribution-1.5

RUN export PATH=$PATH:/usr/local/bin
WORKDIR /data

CMD ["/usr/local/bin/redpen"]

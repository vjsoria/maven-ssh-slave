FROM jenkinsci/ssh-slave
LABEL MAINTAINER="Victor Soria <vjsoria@gmail.com>"

# setup maven
WORKDIR /opt
RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
    && tar -xvzf apache-maven-3.3.9-bin.tar.gz \
        && mv apache-maven-3.3.9 maven 
COPY maven.sh /etc/profile.d/maven.sh
COPY setup-all /usr/local/bin/setup-all
ENTRYPOINT ["setup-all"]

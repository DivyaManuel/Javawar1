FROM java:8

# Install maven to build project
RUN wget --no-verbose -O /tmp/apache-maven.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN echo "516923b3955b6035ba6b0a5b031fbd8b /tmp/apache-maven.tar.gz" | md5sum -c
RUN tar xzf /tmp/apache-maven.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.9 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven.tar.gz
ENV MAVEN_HOME /opt/maven
ENV PATH $MAVEN_HOME/bin:$PATH

RUN apt-get update -y
RUN apt-get install wget -y  
WORKDIR /opt
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.3/bin/apache-tomcat-8.5.3.tar.gz
RUN tar -xvf apache-tomcat-8.5.3.tar.gz
EXPOSE 8080
CMD [ "/opt/apache-tomcat-8.5.3/bin/catalina.sh","run"]
RUN mkdir /app
WORKDIR /app
ADD pom.xml /app/pom.xml
ADD src /app/src


RUN ["mvn", "clean", "package"]
RUN cp -R /app/target/myApp.war /opt/apache-tomcat-8.5.3/webapps

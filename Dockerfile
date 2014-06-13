FROM e1337h4xx/saltwheezy
MAINTAINER 31337 +3r0rr "ochach@gmail.com"
RUN apt-get -qq update
RUN apt-get install -y wget
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN apt-get -qq update
RUN apt-get upgrade -y
RUN apt-get install -y jenkins
EXPOSE 8080
CMD (/etc/init.d/jenkins start && sleep 5 && tailf /var/log/jenkins/jenkins.log)

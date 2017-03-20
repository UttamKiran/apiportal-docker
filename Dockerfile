FROM centos:7

MAINTAINER axway@axway.com

#Defining env variables for the apiportal_install.sh
#ENV  answer=${answer}
#ENV  mysqlSSLModeAnswer=${mysqlSSLModeAnswer}
#ENV  mysqlHost=${mysqlHost}
#ENV  mysqlPort=${mysqlPort}
#ENV  mysqlUsername=${mysqlUsername}
#ENV  mysqlPassword=${mysqlPassword}

#Updating YUM 
RUN yum update -y

#installing epel-release wget and httpd 
RUN yum install -y epel-release wget httpd
#installing mysql client 
RUN yum install mysql -y
#installing sudo in docker contianer 
RUN yum install sudo -y
#Expose the port 
#EXPOSE 443 80
#COPY the apiportal_install.sh file into /tmp
COPY rhel-package.tgz /tmp/
#Extractingtgz file 
RUN tar -xzvf /tmp/rhel-package.tgz
#Set working directory
WORKDIR /package
#Change the file permission 
RUN chmod 755 /package/apiportal_install.sh
#Running the script from ENRTYPOINT
ENTRYPOINT ["/package/apiportal_install.sh"]

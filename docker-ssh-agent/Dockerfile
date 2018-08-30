FROM centos:centos7

LABEL MAINTAINER=andreyko

#configure user profile
RUN mkdir -p /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod -R 700 /root/.ssh
RUN chmod 600 /root/.ssh/authorized_keys

#install ssh server and configure it
RUN yum install -y openssh-server
RUN sed -i 's/#RSAAuthentication.*/RSAAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN sed -i 's/#SyslogFacility.*/SyslogFacility AUTH/' /etc/ssh/sshd_config
RUN sed -i 's/#LogLevel.*/LogLevel INFO/' /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

EXPOSE 22

COPY ./scripts/start-slave /usr/local/bin/start-slave
RUN chmod 700 /usr/local/bin/start-slave

WORKDIR /root/
RUN echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
RUN echo $PATH

ENTRYPOINT start-slave

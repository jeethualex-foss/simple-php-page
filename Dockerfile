FROM redhat/ubi10

USER root

# Install the application dependencies
RUN yum update -y
RUN yum install yum-utils httpd httpd-tools -y
RUN yum install php php-cli php-common php-fpm php-gd php-curl php-zip php-mbstring php-mysqlnd -y

# Copy in the source code
RUN mkdir /deployments
RUN mkdir -p /run/php-fpm/
COPY src /var/www/html
COPY bin /deployments
RUN echo 'ServerName 127.0.0.1' >> /etc/httpd/conf/httpd.conf

WORKDIR /deployments

EXPOSE 80

CMD ["sh","startup.sh"]
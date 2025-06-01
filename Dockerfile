FROM redhat/ubi10-minimal

USER root

# Install the application dependencies
RUN microdnf update -y
RUN microdnf install httpd httpd-tools -y
RUN microdnf install mariadb mariadb-server -y
RUN microdnf install php php-cli php-gd php-curl php-zip php-mbstring php-mysqlnd -y

# Copy in the source code
RUN mkdir /deployments
COPY src /var/www/html
COPY bin /deployments
RUN echo 'ServerName 127.0.0.1' >> /etc/httpd/conf/httpd.conf

WORKDIR /deployments

EXPOSE 80

CMD ["sh","startup.sh"]
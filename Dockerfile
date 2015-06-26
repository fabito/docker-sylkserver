FROM ubuntu:14.04

RUN apt-get install -y wget

RUN wget http://download.ag-projects.com/agp-debian-gpg.key -P /tmp/ && \
    apt-key add /tmp/agp-debian-gpg.key && \
	echo "deb    http://ag-projects.com/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/ag-projects.list    

RUN apt-get update && apt-get install -y sylkserver

ADD /etc/default/sylkserver /etc/default/sylkserver

EXPOSE 5060 5061 50000-50500 2855 5269 8088

# Define default command.
CMD ["/etc/init.d/sylkserver","start"] 
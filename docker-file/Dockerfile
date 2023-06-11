# this is the official image of centos 7
# https://wiki.centos.org/FAQ/CentOSStream
FROM quay.io/centos/centos:centos7

RUN yum clean all -y
RUN yum update -y

RUN yum upgrade yum kernel -y
RUN yum upgrade -y

RUN yum install epel-release -y

RUN yum install -y tzdata
RUN yum install -y wget
RUN yum install -y procps

# ini aapanel install
RUN wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh 
RUN echo 'echo -e "y\nn\n" | bash install.sh aapanel' > inst.sh
RUN bash inst.sh
RUN /www/server/panel/pyenv/bin/python3.7 -m pip install --upgrade pip
# end aapanel install

# fix to slow bt 1 
RUN yum remove -y lsof 

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
COPY restart.sh /restart.sh
RUN ["chmod", "+x", "/restart.sh"]
COPY tail.sh /tail.sh
RUN ["chmod", "+x", "/tail.sh"]

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

EXPOSE 7800 21 22 443 80 888

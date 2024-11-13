FROM quay.io/centos/centos:stream9

WORKDIR /zebraGui

# Update and enable additional repositories
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install dnf-plugins-core
RUN dnf config-manager --set-enabled crb

# Install EPICS dependencies
RUN yum -y groupinstall 'Development Tools'
RUN yum -y install perl rpcgen libtirpc-devel re2c libX11-devel libXtst-devel libxml2-devel libXt-devel libXmu-devel motif-devel giflib-devel

# Install EPICS case
RUN yum -y install git
RUN git clone --recursive https://github.com/epics-base/epics-base.git /epics-base
WORKDIR /epics-base
RUN make -j 4
RUN make install

# zebraGUI dependencies
RUN yum -y install qt5-*
RUN yum -y install readline-devel

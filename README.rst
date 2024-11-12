Zebra GUI
---------

QT5 GUI for the Zebra signal processing unit.


Dependencies to build
---------------------

For CentOS 9:

- qt5 developer tools (qt5-qttools-devel)
- qt5 quick (qt5-qtquick*)
- EPICS base


EPICS base
----------

- sudo yum -y install epel-release
- sudo dnf config-manager --set-enabled crb
- sudo yum -y install perl rpcgen libtirpc-devel re2c libX11-devel libXtst-devel libxml2-devel libXt-devel libXmu-devel motif-devel giflib-devel
- git clone --recursive https://github.com/epics-base/epics-base.git
- cd epics-base
- make -j 4
- make install


Building
--------

Assuming EPICS base is installed at /epics-base.

- ln -s /usr/lib64/libreadline.so.8 /usr/lib64/libreadline.so
- export EPICS_BASE=/epics-base
- mkdir prefix
- cd prefix
- export TARGET_PREFIX=/zebraGui/prefix
- qmake-qt5 ../zebraGui
- make

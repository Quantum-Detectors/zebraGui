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
- export TARGET_PREFIX=/zebraGui/prefix
- export QT_INSTALL_PREFIX=/usr/lib64/qt5
- mkdir prefix
- cd prefix
- qmake-qt5 ../zebraGui
- make -j 4
- make install



Using a Docker container
------------------------

Run an interactive container based on the CentOS Stream 9 image:

.. code::

    docker run -it --rm -v $PWD/:/zebraGui quay.io/centos/centos:stream9

Zebra GUI
---------

QT5 GUI for controlling the Zebra via the EPICS IOC.


Dependencies to build
---------------------

For CentOS 9:

- qt5 developer tools (qt5-qttools-devel)
- qt5 quick (qt5-qtquick*)
- EPICS base
- readline


Building the application
------------------------

Assuming EPICS base is installed at /epics-base. It may be more
convenient to use a Docker container with the dependencies set up. See below.

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

You can build the image with all required dependencies from the Dockerfile in
this repository:

.. code::

    $ docker build -t zebragui:latest .


And then run it:

.. code::

    $ docker run -it --rm -v $PWD/:/zebraGui zebragui:latest


Then we can build the deployment package for the application:

.. code::

    $ ./scripts/deploy.sh


This creates a deployment package in ./deploy based on the
version in `VERSION.txt`.


Installing from the deployment package
--------------------------------------

Installing the package is pretty simple. The same instructions are used if
updating an existing install (you will be prompted to update when running
the install script):

- Copy the package archive to the target server
- Extract using `tar -xzf <tar_file>`
- Run `install.sh`

The application will be installed at the following location:

- /opt/QD/ZebraGUI


Running the installed application
---------------------------------

There is a README included in the package for more information. Otherwise
after installing just run the following script to launch the GUI:

.. code::

    $ /opt/QD/zebraGui/launch_zebra_gui.sh <ZEBRA_PV_PREFIX>

Where the <ZEBRA_PV_PREFIX> is the PV prefix used for the Zebra EPICS IOC.

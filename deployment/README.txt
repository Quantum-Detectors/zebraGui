=============================
Zebra GUI
=============================

This package contains the Zebra GUI written using Qt5. It uses Channel Access to
communicate with the Zebra IOC.

This package was built on CentOS Stream 9.


Dependencies
------------

The following dependencies are required:

- Qt 5 runtime libraries (including QtQuick)
- readline

Others will likely be pulled in from installing Qt5. You can check by using ldd
on the binary to see if all libraries are found on your system:

[root@da8b915e780f zebraGui]# ldd /opt/QD/ZebraGUI/app/zebraGui
        linux-vdso.so.1 (0x00007fffc54e9000)
        libreadline.so.8 => /lib64/libreadline.so.8 (0x00007f9e535d7000)
        libwidgetsplugin.so => not found
        libQt5Quick.so.5 => /lib64/libQt5Quick.so.5 (0x00007f9e5301e000)
        libQt5Widgets.so.5 => /lib64/libQt5Widgets.so.5 (0x00007f9e5290a000)
        libQt5Gui.so.5 => /lib64/libQt5Gui.so.5 (0x00007f9e522c8000)
        libQt5QmlModels.so.5 => /lib64/libQt5QmlModels.so.5 (0x00007f9e52239000)
        libQt5Qml.so.5 => /lib64/libQt5Qml.so.5 (0x00007f9e51d8d000)
        libQt5Network.so.5 => /lib64/libQt5Network.so.5 (0x00007f9e51bd1000)
        libQt5Core.so.5 => /lib64/libQt5Core.so.5 (0x00007f9e51654000)
        libGL.so.1 => /lib64/libGL.so.1 (0x00007f9e515cd000)
        libstdc++.so.6 => /lib64/libstdc++.so.6 (0x00007f9e513a4000)
        libm.so.6 => /lib64/libm.so.6 (0x00007f9e512c9000)
        libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f9e512ac000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f9e510a4000)
        libtinfo.so.6 => /lib64/libtinfo.so.6 (0x00007f9e51074000)
        libpng16.so.16 => /lib64/libpng16.so.16 (0x00007f9e5103d000)
        libz.so.1 => /lib64/libz.so.1 (0x00007f9e51023000)
        libharfbuzz.so.0 => /lib64/libharfbuzz.so.0 (0x00007f9e50f54000)
        libgssapi_krb5.so.2 => /lib64/libgssapi_krb5.so.2 (0x00007f9e50efb000)
        libproxy.so.1 => /lib64/libproxy.so.1 (0x00007f9e50eda000)
        libssl.so.3 => /lib64/libssl.so.3 (0x00007f9e50df4000)
        libcrypto.so.3 => /lib64/libcrypto.so.3 (0x00007f9e508db000)
        libsystemd.so.0 => /lib64/libsystemd.so.0 (0x00007f9e507fe000)
        libicui18n.so.67 => /lib64/libicui18n.so.67 (0x00007f9e504f8000)
        libicuuc.so.67 => /lib64/libicuuc.so.67 (0x00007f9e5030b000)
        libpcre2-16.so.0 => /lib64/libpcre2-16.so.0 (0x00007f9e5027b000)
        libzstd.so.1 => /lib64/libzstd.so.1 (0x00007f9e501a4000)
        libglib-2.0.so.0 => /lib64/libglib-2.0.so.0 (0x00007f9e5006a000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f9e5363d000)
        libGLX.so.0 => /lib64/libGLX.so.0 (0x00007f9e50038000)
        libX11.so.6 => /lib64/libX11.so.6 (0x00007f9e4fef0000)
        libXext.so.6 => /lib64/libXext.so.6 (0x00007f9e4fed9000)
        libGLdispatch.so.0 => /lib64/libGLdispatch.so.0 (0x00007f9e4fe21000)
        libfreetype.so.6 => /lib64/libfreetype.so.6 (0x00007f9e4fd5d000)
        libgraphite2.so.3 => /lib64/libgraphite2.so.3 (0x00007f9e4fd3c000)
        libkrb5.so.3 => /lib64/libkrb5.so.3 (0x00007f9e4fc61000)
        libk5crypto.so.3 => /lib64/libk5crypto.so.3 (0x00007f9e4fc46000)
        libcom_err.so.2 => /lib64/libcom_err.so.2 (0x00007f9e4fc3f000)
        libkrb5support.so.0 => /lib64/libkrb5support.so.0 (0x00007f9e4fc2e000)
        libkeyutils.so.1 => /lib64/libkeyutils.so.1 (0x00007f9e4fc27000)
        libresolv.so.2 => /lib64/libresolv.so.2 (0x00007f9e4fc13000)
        libcap.so.2 => /lib64/libcap.so.2 (0x00007f9e4fc09000)
        libgcrypt.so.20 => /lib64/libgcrypt.so.20 (0x00007f9e4faca000)
        liblzma.so.5 => /lib64/liblzma.so.5 (0x00007f9e4fa9e000)
        liblz4.so.1 => /lib64/liblz4.so.1 (0x00007f9e4fa7a000)
        libicudata.so.67 => /lib64/libicudata.so.67 (0x00007f9e4df61000)
        libpcre.so.1 => /lib64/libpcre.so.1 (0x00007f9e4dee9000)
        libxcb.so.1 => /lib64/libxcb.so.1 (0x00007f9e4debc000)
        libbz2.so.1 => /lib64/libbz2.so.1 (0x00007f9e4dea9000)
        libbrotlidec.so.1 => /lib64/libbrotlidec.so.1 (0x00007f9e4de9b000)
        libselinux.so.1 => /lib64/libselinux.so.1 (0x00007f9e4de6e000)
        libgpg-error.so.0 => /lib64/libgpg-error.so.0 (0x00007f9e4de48000)
        libXau.so.6 => /lib64/libXau.so.6 (0x00007f9e4de40000)
        libbrotlicommon.so.1 => /lib64/libbrotlicommon.so.1 (0x00007f9e4de1d000)
        libpcre2-8.so.0 => /lib64/libpcre2-8.so.0 (0x00007f9e4dd81000)


You can see in this example libwidgetsplugin.so was not found. See Running the
Application below for more information.


Installation
------------

Included is an installation script to install the application. This copies the built
application files to the following directory:

- /opt/QD/ZebraGUI


Uninstallation
--------------

To uninstall just delete the installation directory:

- /opt/QD/ZebraGUI

Optionally also delete the parent /opt/QD directory if empty (this root is also
used by some of our other software).


Running the application
-----------------------

The GUI application binary is installed at:

- /opt/QD/ZebraGUI/app/zebraGui <PV_NAME>

For CentOS Stream 9 the following LD_LIBRARY_PATH also had to be set in order
for a specific runtime library (libwidgetsplugin.so) to be found when launching
the application:

- export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/qt5/qml/QtQuick/PrivateWidgets


Alternatively you may use the launch script which sets the path above automatically:

- /opt/QD/ZebraGUI/launch_zebra_gui.sh <PV_NAME>

<PV_NAME> should be the PV prefix used by the Zebra IOC so the GUI connects to the
IOC's PVs.


These can be added to the user's PATH so they are more accessible.

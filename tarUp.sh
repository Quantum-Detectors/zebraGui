HERE="$(dirname "$0")"
cp -rf /dls_sw/work/tools/RHEL6-x86_64/qt_static/prefix/qml/* "${HERE}/prefix"
tar --transform='s/prefix/zebraGui/' -zcf  zebraGui.tar.gz prefix
cp zebraGui.tar.gz /dls_sw/cs-publish/downloads/other/files


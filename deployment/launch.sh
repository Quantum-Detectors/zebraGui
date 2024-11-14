#!/usr/bin/bash

script_dir="$( cd "$( dirname "$0" )" && pwd )"

# Update paths first
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/qt5/qml/QtQuick/PrivateWidgets

# Now launch and pass first argument as PV
$script_dir/app/zebraGui $1

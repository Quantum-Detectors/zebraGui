#!/usr/bin/bash

# ============================================================
# DEPLOY SCRIPT
# ============================================================
#
# This script builds the Zebra GUI application and creates
# a deployment package
#

# Colours
CYAN="\033[0;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
NOCOL="\033[0m"


#================================================
# Script options
#================================================

script_dir="$( cd "$( dirname "$0" )" && pwd )"

debug_flag=0

options=":dh"

while getopts ${options} flag
do
    case ${flag} in
        d)
            debug_flag=1
            ;;
        h)
            echo ""
            echo -e "==========================================================="
            echo "Motion control GUI deploy script"
            echo -e "==========================================================="
            echo ""
            echo "This script is used to build the deployment package."
            echo ""
            echo "Choose from the following options:"
            echo ""
            echo "    -d : build with debug output"
            echo "    -h : print this help message and exit"
            echo ""
            echo -e "==========================================================="
            echo ""
            exit 0
            ;;
        ?)
            echo "ERROR: Invalid option '${OPTARG}'. Type -h for help"
            exit 1
            ;;
    esac
done

# Redirection for debug or minimal output
if [ $debug_flag -eq 1 ]; then
    echo -e "${GREEN}[INFO]${NOCOL} Enabling debug output"
    echo ""
    REDIRECT=/dev/stdout
else
    REDIRECT=/dev/null
fi


echo "==========================================================="
echo "Creating Zebra GUI deployment package"
echo "==========================================================="
echo ""


#================================================
# Packaging configuration
#================================================

package_name="zebraGUI"
package_directory="$script_dir/../deploy"
app_directory="$package_directory/zebraGUI"
package_archive="$package_name.tar.gz"

echo -e "Package name: ${CYAN}$package_name${NOCOL}\n"

source_deployment_directory="$script_dir/../deployment"

build_directory="./build"


#================================================
# Create package structure
#================================================

echo -e "${CYAN} - Creating package structure${NOCOL}"

# Directories
mkdir -p $package_directory

# Copy pre-made files
cp $source_deployment_directory/*.sh $package_directory


#================================================
# Build application
#================================================

echo -e "${CYAN} - Building application${NOCOL}"

# Recreate build directory
rm -rf $build_directory
mkdir -p $build_directory

# Set up paths
export EPICS_BASE=/epics-base
export TARGET_PREFIX=$app_directory
export QT_INSTALL_PREFIX=/usr/lib64/qt5

# Build application
cd $build_directory
qmake-qt5 ../zebraGUI
make -j 4
make install

# Copy targets

#!/usr/bin/bash

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

# Store options from user
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
            echo "Zebra GUI install script"
            echo -e "==========================================================="
            echo ""
            echo "This script is used to install the Zebra GUI software."
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


echo ""
echo "==========================================================="
echo "Installing Zebra GUI"
echo "==========================================================="
echo ""
echo -e "Package version: ${CYAN}$(basename ${script_dir})${NOCOL}"
echo ""

# Redirection for debug or minimal output
if [ $debug_flag -eq 1 ]; then
    echo -e "${GREEN}[INFO]${NOCOL} Enabling debug output"
    echo ""
    REDIRECT=/dev/stdout
else
    REDIRECT=/dev/null
fi


#================================================
# Package configuration
#================================================

# Source files
source_app_dir=$script_dir/app
launch_gui_script=$script_dir/launch_zebra_gui.sh

# Install paths
root_install_dir=/opt/QD
install_dir=$root_install_dir/ZebraGUI


#================================================
# Check for existing version
#================================================

if [ -d $install_dir ]; then
    echo -e "${YELLOW}[WARNING]${NOCOL} Existing install detected"
    while true; do
        read -p "$(echo -e 'Do you wish to replace the existing install?\n> ')" yn
        case $yn in
            [Yy]* )
                # Should replace all directories except for config
                echo -e "${CYAN} - Removing existing version${NOCOL}"
                rm -rf $install_dir
                break
                ;;
            [Nn]* )
                echo -e "${YELLOW}[WARNING]${NOCOL} User aborted installation"
                exit 1
                ;;
            * )
                echo "Invalid input - please answer yes or no.";;
        esac
    done
fi


#================================================
# Create install paths
#================================================

echo -e "${CYAN} - Creating install paths${NOCOL}"

# Create top-level directory
sudo mkdir -p $root_install_dir

# Make current user own the root diretory
sudo chown -R $USER $root_install_dir
sudo chgrp -R $USER $root_install_dir

# Create install directory
mkdir -p $install_dir

#================================================
# Copy files
#================================================

echo -e "${CYAN} - Copying package files${NOCOL}"

cp $launch_gui_script $install_dir
cp -r $source_app_dir $install_dir


#================================================
# Creating binary links and desktop shortcut
#================================================

echo -e "${CYAN} - Creating application shortcut${NOCOL}"

clear
echo "Your current gcc compiler is:"
echo
gcc --version
read -p "Press [enter] to continue"
clear
echo "Installing build essentials"
sudo apt-get install build-essential
echo
echo
read -p "Press [enter] to install required repositry"
clear
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
echo
echo "Updating..........."
sudo apt-get update
clear
echo "______________________________________________________"
sudo apt-cache search "g\+\+"
echo "______________________________________________________"
echo
echo
echo "^^^^^^ Look above and find cross compiler you want "
echo " to install, your list will look similar to this -"
echo
echo "
g++ - GNU C++ compiler 
g++-multilib - GNU C++ compiler (multilib files) 
g++-4.4 - GNU C++ compiler 
g++-4.4-multilib - GNU C++ compiler (multilib files) 
g++-4.5 - The GNU C++ compiler 
g++-4.5-multilib - The GNU C++ compiler (multilib files) 
g++-4.6 - GNU C++ compiler 
g++-4.6-multilib - GNU C++ compiler (multilib files) 
g++-4.7 - GNU C++ compiler 
g++-4.7-multilib - GNU C++ compiler (multilib files) ... "
echo
echo
echo
echo "Type version you want now eg '4.7' or '4.6' or '4.4' "
read VERSION
sudo apt-get install gcc-$VERSION g++-$VERSION
echo
echo
read -p "Press [enter] to check directory of g++"
clear
echo "Current directory of g++ is:"
which g++ 
echo
echo
echo "Copy and paste your directory below in the terminal"
read DIR
ls -lh $DIR
echo
echo
echo
ls -lh $DIR*
echo 
echo
echo
echo
read -p "We need to let update-alternatives know we have more then 1 gcc, press [enter] to continue"
clear
echo "Enter previous version eg '4.4' or '4.6';"
read PREV
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$PREV 60 --slave /usr/bin/g++ g++ /usr/bin/g++-$PREV
echo
echo
echo "Enter new version eg 4.4 4.6 or 4.7"
read NEW
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$NEW 40 --slave /usr/bin/g++ g++ /usr/bin/g++-$NEW
echo
echo
read -p "Done Now press enter to change compilers"
sudo update-alternatives --config gcc
clear
echo "Compiler changed to;"
echo
gcc --version


# Install software which chef does not install properly.

## Install hub command

mkdir -p tmp
cd tmp
wget https://github.com/github/hub/releases/download/v2.2.1/hub-linux-amd64-2.2.1.tar.gz
tar zxvf hub-linux-amd64-2.2.1.tar.gz
cd hub-linux-amd64-2.2.1
sudo cp ./hub /usr/local/bin
cd ../..
rm -rf tmp

## Install ruby gems in rbenv. The rbenv receipe installs them as root.
gem install bundler rails travis sinatra
rbenv rehash

## Good bye
echo "Please re-login"

apt update
apt upgrade
apt install libncurses5-dev python-dev python3-dev git openvpn
apt remove vim vim-runtime gvim
apt autoremove

chsh -s /bin/bash ip
chsh -s /bin/bash root

if ! [ -d "/opt/vim-src" ] ; then
mkdir /opt/vim-src
fi

cd /opt/vim-src 

if ! [ -d "/opt/vim-src/vim" ] ; then
sudo git clone https://github.com/vim/vim.git 
fi 

cd /opt/vim-src/vim

# double check python lib paths
./configure --with-features=huge --enable-multibyte --prefix=/usr/ --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-arm-linux-gnueabihf/

make

make install

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim


if ! [ -d "/root/.vim" ] ; then
mkdir /root/.vim
fi

if ! [ -d "/home/ip/.vim" ] ; then
mkdir /home/ip/.vim
fi

git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git /home/ip/.vim/bundle/Vundle.vim

/opt/vimbash-install/copyfiles.sh

cd /opt
git clone https://github.com/powerline/fonts.git
cd /opt/fonts
./install.sh

vim +PluginInstall +qall


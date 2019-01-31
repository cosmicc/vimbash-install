sudo apt install libncurses5-dev python-dev python3-dev git

sudo apt remove vim vim-runtime gvim

sudo chsh -s /bin/bash ip
sudo chsh -s /bin/bash root

mkdir /opt/vim-src

cd /opt/vim-src && sudo git clone https://github.com/vim/vim.git && cd vim

# double check python lib paths
./configure --with-features=huge --enable-multibyte --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-arm-linux-gnueabihf/ --prefix=/usr/ --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-arm-linux-gnueabihf/

make

make install

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

mkdir /root/.vim
mkdir /home/ip/.vim

git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git /home/ip/.vim/bundle/Vundle.vim

cp /opt/vim-installer/colors /root/.vim
cp /opt/vim-installer/colors /home/ip/.vim

cp /opt/vim-installer/vimrc /root/.vimrc
cp /opt/vim-installer/vimrc /home/ip/.vimrc

cp /opt/vim-installer/dircolors /root/.dircolors
cp /opt/vim-installer/dircolors /home/ip/.dircolors

cp /opt/vim-installer/promptline.sh /root/.promptline.sh
cp /opt/vim-installer/promptline.sh /home/ip/.promptline.sh

cp /opt/vim-installer/bashrc /root/.bashrc
cp /opt/vim-installer/bashrc /home/ip/.bashrc


cd /opt
git clone git@github.com:powerline/fonts.git
cd /opt/fonts
./install.sh

vim +PluginInstall +qall


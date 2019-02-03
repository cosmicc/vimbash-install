sudo apt install libncurses5-dev git zlib1g-dev build-essential libgdbm-dev libc6-dev libsqlite3-dev tk-dev libssl-dev openssl libffi-dev

sudo apt remove vim vim-runtime gvim

sudo chsh -s /bin/bash ip
sudo chsh -s /bin/bash root

mkdir /opt/vim-src

cd /opt/vim-src 
sudo git clone https://github.com/vim/vim.git 
cd /opt/vim-src/vim

# double check python lib paths
./configure --with-features=huge --enable-multibyte --prefix=/usr/ --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-arm-linux-gnueabihf/

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


cp /opt/vimbash-install/colors /root/.vim -r
cp /opt/vimbash-install/colors /home/ip/.vim -r

cp /opt/vimbash-install/vimrc /root/.vimrc
cp /opt/vimbash-install/vimrc /home/ip/.vimrc

cp /opt/vimbash-install/dircolors /root/.dircolors
cp /opt/vimbash-install/dircolors /home/ip/.dircolors

cp /opt/vimbash-install/promptline.sh /root/.promptline.sh
cp /opt/vimbash-install/promptline.sh /home/ip/.promptline.sh

cp /opt/vimbash-install/bashrc /root/.bashrc
cp /opt/vimbash-install/bashrc /home/ip/.bashrc

chown ip.ip /home/ip -R

cd /opt
git clone git@github.com:powerline/fonts.git
cd /opt/fonts
./install.sh

vim +PluginInstall +qall


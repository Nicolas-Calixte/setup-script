#!/bin/sh


apt-get install curl wget tree snap shellcheck python3 python3-dev git vim python3-pip python3-setuptools -y && 
	echo '------------- PHASE 1 DONE.'

mkdir -pv ~/.config/zsh/plugins ~/.vim/plugged ~/.cache ~/.scripts &&
	mv ~/.zsh*  ~/.config/zsh/ ; mv ~/.vim* ~/.vim/ 
ln -s ~/.config/zsh/.zshrc ~/ ; ln -s ~/.vim/.vimrc ~/ &&
	echo '------------- PHASE 2 DONE.'

#----------- curl config zsh > ~/.config/zsh/.zshrc
curl https://raw.githubusercontent.com/Nicolas-Calixte/zsh-config/master/zshconfig.txt > ~/.config/zsh/.zshrc &&
       	echo '------------- ZSH CONFIG INSTALLED.' 
# ---------- curl config vim > ~/.vim/.vimrc
curl https://raw.githubusercontent.com/Nicolas-Calixte/vimconfig/master/vimconf.txt > ~/.vim/.vimrc && 
	echo '------------- VIM CONFIG INSTALLED.' 

# cloning and sourcing zsh plugins
mkdir ~/.config/zsh/plugins/zsh-syntax-highlighting &&
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  ~/.config/zsh/plugins/zsh-syntax-highlighting && 
	echo '----------- ZSH SYNTAX HIGHLIGHTING CLONED.'
mkdir ~/.config/zsh/plugins/zsh-autosuggestions && 
	git clone https://github.com/zsh-users/zsh-autosuggestions.git  ~/.config/zsh/plugins/zsh-autosuggestions && 
	echo '------------ PHASE 3 DONE.'

# ----- Installing vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
		echo '------------- vim-plug installed.' && echo '------------ PHASE 4 DONE.'
chmod 777 -R ~/.vim/ && echo 'Rights on .vim/ dir are now 777.'

# ------- Installing bat & thefuck
apt-get install bat -y ||
	wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-musl_0.23.0_amd64.deb && 
	dpkg -i ~/bat-musl_0.23.0_amd64.deb && rm ~/bat-musl_0.23.0_amd64.deb 

pip3 install thefuck --user && echo 'TheFuck successfully installed.' || echo 'TheFuck installation failed.'
setxkbmap -option caps:escape && echo '------------- Capslock remaped to Escape.' ||
	echo '------------- Remaping Capslock to Escape failed.'
xset r rate 300 30 && echo '------------- Keyboard movement accelerated.' ||
	echo '------------- Keyboard ms acceleration failed.'

echo '-------------------------- DONE ------------------------------'

#!/bin/sh


apt-get install curl wget tree snap shellcheck python3 python3-dev git vim python3-pip python3-setuptools -y && 
	echo -e '------------- \e[1;32m PHASE 1 DONE. \e[0m -----------'

mkdir -pv $HOME/.config/zsh/plugins $HOME/.vim/plugged $HOME/.cache $HOME/.scripts &&
	mv $HOME/.zsh*  $HOME/.config/zsh/ ; mv $HOME/.vim* $HOME/.vim/ &&
	ln -s $HOME/.config/zsh/.zshrc $HOME/ ; ln -s $HOME/.vim/.vimrc $HOME/ &&
	echo -e '------------- \e[1;32m PHASE 2 DONE. \e[0m -----------'

#----------- curl config zsh > $HOME/.config/zsh/.zshrc
curl https://raw.githubusercontent.com/Nicolas-Calixte/zsh-config/master/zshconfig.txt > $HOME/.config/zsh/.zshrc &&
       	echo -e '------------- \e[1;32m ZSH CONFIG INSTALLED. \e[0m ----------' 
# ---------- curl config vim > $HOME/.vim/.vimrc
curl https://raw.githubusercontent.com/Nicolas-Calixte/vimconfig/master/vimconf.txt > $HOME/.vim/.vimrc && 
	echo -e '------------- \e[1;32m VIM CONFIG INSTALLED. \e[0m ----------' 

# cloning and sourcing zsh plugins
mkdir $HOME/.config/zsh/plugins/zsh-syntax-highlighting &&
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  $HOME/.config/zsh/plugins/zsh-syntax-highlighting && 
	echo -e '----------- \e[1;32m ZSH SYNTAX HIGHLIGHTING CLONED. \e[0m -----------'
mkdir $HOME/.config/zsh/plugins/zsh-autosuggestions && 
	git clone https://github.com/zsh-users/zsh-autosuggestions.git  $HOME/.config/zsh/plugins/zsh-autosuggestions && 
	echo -e '------------ \e[1;32m PHASE 3 DONE. \e[0m -----------'

# ----- Installing vim-plug for vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
		echo -e '------------- \e[1;32m vim-plug installed.\e[0m ----------' &&
		vim -c ':PlugInstall | quit' &&
		sed "/'default')$/d" $HOME/.config/.vim/plugins/plugged/goyo.vim/autoload/goyo.vim &&
		echo -e '------------ \e[1;32m PlugInstall command executed. \e[0m -----------'  ||
		echo -e '------------ \e[1;31m PlugInstall command failed. \e[0m ---------------'

		chmod 775 -R $HOME/.vim/ && 
		echo -e '------------ \e[1;32m Rights on .vim/ dir are now 775. \e[0m -----------' &&
		echo -e '------------ \e[1;32m PHASE 4 DONE. \e[0m -----------'

# ------- Installing bat 
apt-get install bat -y ||
	wget https://github.com/sharkdp/bat/releases/download/v0.\23.0/bat-musl_0.\23.0_amd64.deb && 
	dpkg -i $HOME/bat-musl_0.\23.0_amd64.deb && rm $HOME/bat-musl_0.\23.0_amd64.deb 

# -------- Remapping capslock to escape & upgrading cursor speed
setxkbmap -option caps:escape && 
	echo -e '------------- \e[1;32m Capslock remaped to Escape. \e[0m -----------' ||
	echo -e '------------- \e[1;31m Remaping Capslock to Escape failed. \e[0m -----------'
xset r rate 300 30 && 
	echo -e '------------- \e[1;32m Keyboard movement accelerated. \e[0m-----------' ||
	echo -e '------------- \e[1;31m Keyboard ms acceleration failed. \e[0m -----------'

echo -e '-------------------------- \e[1;32m DONE \e[0m -----------------------------'

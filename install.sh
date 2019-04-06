#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#######################################################################

echo -e "\n> Setting up Bash\n"

if [[ -f $HOME/.bashrc ]]; then
	echo -e "Bash settings file already exists. Skipping..."
else
	echo -e "Creating Bash settings file."
	ln -s $CURRENT_DIR/bashrc $HOME/.bashrc
fi

if [[ -f $HOME/.bash_aliases ]]; then
	echo -e "Bash aliases file already exists. Skipping..."
else
	echo -e "Creating Bash aliases file."
	ln -s $CURRENT_DIR/bash_aliases $HOME/.bash_aliases
fi

# Cria o arquivo .todo, usado nos alias como lista de tarefas
if [[ ! -f $HOME/.todo ]]; then
	touch $HOME/.todo
fi

#######################################################################

echo -e "\n> Setting up ZSH\n"

if [[ -f $HOME/.zshrc || -L $HOME/.zshrc ]]; then
	echo -e "ZSH settings file already exists. Skipping..."
else
	echo -e "Creating ZSH settings file."
	ln -s $CURRENT_DIR/zshrc $HOME/.zshrc

	if [[ -d $HOME/.oh-my-zsh/custom/plugins ]]; then
		rm -fr $HOME/.oh-my-zsh/custom/plugins
	fi

	ln -s $CURRENT_DIR/oh-my-zsh/custom/plugins $HOME/.oh-my-zsh/custom/plugins

	if [[ -d $HOME/.oh-my-zsh/custom/themes ]]; then
		rm -fr $HOME/.oh-my-zsh/custom/themes
	fi

	ln -s $CURRENT_DIR/oh-my-zsh/custom/themes $HOME/.oh-my-zsh/custom/themes
fi

#######################################################################

echo -e "\n> Setting up home folders\n"

# Arquivo de configurações dos diretórios principais
if [[ -f $HOME/.config/user-dirs.dirs || -L $HOME/.config/user-dirs.dirs ]]; then
	rm -f $HOME/.config/user-dirs.dirs
fi

ln -s $CURRENT_DIR/config/user-dirs.dirs $HOME/.config/user-dirs.dirs

# Diretórios principais
declare -a DIRS=("Desktop" "Documents" "Downloads" "Music" "Pictures" "Public" "Videos")

for FOLDER in "${DIRS[@]}"; do
	if [[ -d $HOME/$FOLDER ]]; then
		echo -e "${FOLDER} directory already exists. Skipping..."
	else
		echo -e "Creating ${FOLDER} directory."
		mkdir -p $HOME/$FOLDER
	fi
done

# Diretório de templates no Ubuntu
if [[ ! -d $HOME/.config/Templates ]]; then
	if [[ -d $HOME/Templates ]]; then
		echo -e "Templates directory already exists. Moving it to correct location."
		mv $HOME/Templates $HOME/.config/Templates
	else
		echo -e "Creating Templates directory."
		mkdir -p $HOME/.config/Templates
	fi
fi

#######################################################################

echo -e "\n> Setting up .gitconfig\n"

if [[ -f $HOME/.gitconfig || -L $HOME/.gitconfig ]]; then
	echo -e ".gitconfig file already exists. Skipping..."
else
	echo -e "Creating .gitconfig file."
	ln -s $CURRENT_DIR/gitconfig $HOME/.gitconfig
fi

#######################################################################

echo -e "\n> Setting up NPM\n"

if [[ -f $HOME/.npmrc || -L $HOME/.npmrc ]]; then
	echo -e "NPM settings file already exists. Skipping..."
else
	echo -e "Creating NPM settings file."
	ln -s $CURRENT_DIR/npmrc $HOME/.npmrc
fi

#######################################################################

echo -e "\n> Setting up VueJS\n"

if [[ -f $HOME/.vuerc || -L $HOME/.vuerc ]]; then
	echo -e "VueJS settings file already exists. Skipping..."
else
	echo -e "Creating VueJS settings file."
	ln -s $CURRENT_DIR/vuerc $HOME/.vuerc
fi

#######################################################################

echo -e "\n> Setting up ELinks\n"

if [[ ! -d $HOME/.elinks ]]; then
	mkdir -p $HOME/.elinks
fi

if [[ -f $HOME/.elinks/elinks.conf || -L $HOME/.elinks/elinks.conf ]]; then
	echo -e "ELinks settings file already exists. Skipping..."
else
	echo -e "Creating ELinks settings file."
	ln -s $CURRENT_DIR/elinks/elinks.conf $HOME/.elinks/elinks.conf
fi

#######################################################################

echo -e "\n> Setting up WakaTime\n"

if [[ -f $HOME/.wakatime.cfg || -L $HOME/.wakatime.cfg ]]; then
	echo -e "WakaTime settings file already exists. Skipping..."
else
	echo -e "Creating WakaTime settings file."
	ln -s $CURRENT_DIR/wakatime.cfg $HOME/.wakatime.cfg
fi

#######################################################################

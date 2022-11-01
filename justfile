alias sym := install-symbolic
alias usym := uninstall-symbolic

install:
    cp -R nvim $HOME/.config

install-symbolic:
    ln -s $(pwd)/nvim $HOME/.config/nvim

# unistall must be done manually
install-to DIR:
    echo {{DIR}} 

uninstall:
    rm -r $HOME/.config/nvim/

uninstall-symbolic:
    rm $HOME/.config/nvim

# Nerd Font install
nerd-font:
    git clone --depth 1 git@github.com:ryanoasis/nerd-fonts

nerd-font-specify FONT: nerd-font
    ./install.sh {{FONT}}

nerd-font-list: nerd-font
    ./install.sh --list


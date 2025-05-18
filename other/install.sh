#bash conf 
cp other/.bashrc other/.bash_profile other/.inputrc other/.hi other/.bashrc_colors $HOME

cp * $HOME/.config
rm $HOME/other

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


nvim -c :PlugInstall :q
nvim -c :CocInstall coc-json coc-tsserver coc-pairs coc-clangd coc-pyright :q


git clone https://github.com/futurityverb/dotfiles.git ~/.futurityverb-dotfiles
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp ~/.futurityverb-dotfiles/.vimrc-slim ~/.vimrc
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/Lokaltog/vim-easymotion.git ~/.vim/bundle/vim-easymotion

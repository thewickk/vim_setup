This set-up requires the following external resources to work properly:

Clone the Vundle.vim repo to your ~/.vim/bundle dir:
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Clone the following repo into a dir in your home directory or convenient location. Move the vimbrains.vim file into your ~/.vim/colors dir (create the dir if you don't have one present: 
git clone https://github.com/sherifkandeel/vim-colors.git 

Create the .vimrc file in your ~/ dir if you haven't done so already. Ex. (touch ~/.vimrc) Now copy and paste the .vimrc file from this repo and paste it in your blank .vimrc file. Use the :set paste command in vim/vi so it formats properly. 

Exit vim/vi and issue the following command via the command line to install the plug-ins listed in the .vimrc file:
vim +PluginInstall +qall

Thats it, plug-ins will install and you will have a custom vim with my personal favorite plug-in of all time, NERDTree. 

Many thanks to: \n
https://github.com/VundleVim \n
https://github.com/sherifkandeel \n
https://github.com/scrooloose (creator of The NERDTree) \n

 #vimrc                                                                          
 cp ./.vimrc ~/

 #oh-my-zsh                                                                      
 sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

 #pathogen                                                                       
 mkdir -p ~/.vim/autoload ~/.vim/bundle && \                                     
 curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim             

 #gruvbox - vimtheme                                                             
 git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox          

#NERDTree                                                                       
 git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree      

 #vim-fugitive                                                                   
 mkdir -p ~/.vim/pack/tpope/start                                                
 cd ~/.vim/pack/tpope/start                                                      
 git clone https://tpope.io/vim/fugitive.git                                     
 vim -u NONE -c "helptags fugitive/doc" -c q                                     
 cd ~/.vim/bundle
 git clone https://github.com/dense-analysis/ale.git
 git clone https://github.com/scrooloose/syntastic

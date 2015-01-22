#!/bin/bash - 
#===============================================================================
#
#          FILE: install.sh
# 
#         USAGE: ./install.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05/27/2013 07:47:27 PM CEST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# Clone repo
cd $HOME
git clone git://github.com/bend/vim-files.git

# Backup old vim files if exists

if [ -f $HOME/.vim ];then
    mv $HOME/.vim vim.backup
fi

if [ -f $HOME/.vimrc ];then
    mv $HOME/.vimrc vimrc.backup
fi

mv vim-files/ $HOME/.vim/
ln -s $HOME/.vim/vimrc/.vimrc $HOME
ln -s $HOME/.vim/vimrc/.ycm_extra_conf.py $HOME





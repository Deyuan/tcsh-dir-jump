#!/bin/tcsh
# A handy directory-jump utility in tcsh
# Deyuan Guo. May 8, 2018

# Add the following to .cshrc and enjoy
set dunique
set pushdsilent
set pushdtohome
alias cd 'pushd'
alias j  'if (`expr "\!*"` == "") dirs -v | sort -k 2; if (`expr "\!*"` > 0) pushd +\!*'


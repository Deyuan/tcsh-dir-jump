# tcsh-dir-jump
A handy directory-jump utility in tcsh

## Description
Tcsh is an improved version of C shell, which is available in Mac OS X
and Red Hat Linux. The source code of tcsh can be found at:
> TCSH github repo: https://github.com/tcsh-org/tcsh

It is known that C shell has some drawbacks. But it is still being used
in some production environment.
> Top Ten Reasons not to use the C shell: http://www.grymoire.com/unix/CshTop10.txt

This directory-jump utility is implemented with aliases based on pushd and
dirs commands. It provides a shortcut 'j' to show cd history and 'j #id' to
jump among history directories. This is helpful to boost productivity while
working on multiple directories simultaneously.

## Alias-based Implementation
TCSH does not support single line if-else statement. However, we can
achieve this by chaining multiple if statements separated by semicolons.
Directories are sorted by absolute path for ease of use.
```
# Add the following to .cshrc and enjoy
set dunique
set pushdsilent
set pushdtohome
alias cd 'pushd'
alias j  'if (`expr "\!*"` == "") dirs -v | sort -k 2; if (`expr "\!*"` > 0) pushd +\!*'
```

## Usage
```
cd      : Use as usual
j       : Show the list of currently remembered directories
j #id   : Jump to a directory by #id
dirs -c : Clear the directory list
```

## Example
```
% cd ~/dir1
% cd ~/dir2
% cd ~/dir3
% j
2	~/dir1
1	~/dir2
0	~/dir3
% j 2
% pwd
~/dir1
```


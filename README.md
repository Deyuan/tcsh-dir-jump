# tcsh-dir-jump
A handy directory-jump utility in tcsh

Tcsh is an improved version of C shell, which is still available in Mac OS X
and Red Hat Linux. The source code of tcsh can be found at:
> https://github.com/tcsh-org/tcsh

This directory-jump utility is implemented with aliases based on pushd and
dirs commands. It provides a shortcut 'j' to show cd history and 'j #id' to
jump among history directories. This is helpful to boost productivity while
working on multiple directories simultaneously.

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


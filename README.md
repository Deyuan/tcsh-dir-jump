# tcsh-dir-jump
A handy directory-jump utility in tcsh

## Description
Tcsh is an improved version of C shell, which is available in Mac OS X
and Red Hat Linux. Tcsh might not be as popular as other shells such as bash,
but it is still being used in some production environments. 

This directory-jump utility is implemented with aliases based on `pushd` and
`dirs` commands. It provides a shortcut `j` to show cd history and `j #id` to
jump among history directories. This is helpful to boost productivity while
working on multiple directories simultaneously and jumping among them frequently.

## Alias-based Implementation
TCSH does not support single line if-else statement. However, we can
achieve this by chaining multiple if statements separated by semicolons.

The `dunique`, `pushdsilent` and `pushdtohome` are built-in shell variables
in tcsh to make `pushd` act more like `cd`.
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
The general use model is to use `j` to show a list of directories, and use `j #id` to jump to one of them.
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

## References
* Tcsh github repo
  > https://github.com/tcsh-org/tcsh
* Special shell variables for tcsh
  > https://nature.berkeley.edu/~casterln/tcsh/Special_shell_variables.html
* Tcsh Wikipedia
  > https://en.wikipedia.org/wiki/Tcsh
* Top ten reasons not to use the C shell
  > http://www.grymoire.com/unix/CshTop10.txt

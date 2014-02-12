Sventimir's vim configuration. Feel free to copy and share wherever you want.

DEPENDENCIES:
    * Vim compiled with Python (in Debian delivered by vim-nox package).
    * Python module jedi.
    * Pylint - for checking Python syntax.
    * GHC - if you intend to work with Haskell source code.

To make it work just download all files to /etc/vim or to ~/.vim. It may also
be necessary to make a symbolic link from /usr/share/vim/vim74/syntax (or
similar) to the repository's syntax/ directory.

To utilize custom pylint settings place them in ~/.pylintrc. You may also use
pylintrc included with this package by copying it to your $HOME or - better -
making a symbolic link from $HOME to this file, which thus remains under
version control and gains regulars updates.

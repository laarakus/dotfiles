CABAL_PREFIX="$HOME/.cabal"
export CABAL_PREFIX

pathappend $CABAL_PREFIX/bin             PATH
pathappend $CABAL_PREFIX/lib             PKG_CONFIG_PATH
pathappend $CABAL_PREFIX/share           PKG_CONFIG_PATH

pathappend $CABAL_PREFIX/lib             LIBRARY_PATH

ACLOCAL='aclocal -I $PKGSRC_PREFIX/share/aclocal'

export PATH PKG_CONFIG_PATH ACLOCAL LIBRARY_PATH 

VANILLA_PREFIX="/usr"
export VANILLA_PREFIX

pathappend $VANILLA_PREFIX/bin             PATH
pathappend $VANILLA_PREFIX/lib/pkgconfig   PKG_CONFIG_PATH
pathappend $VANILLA_PREFIX/share/pkgconfig PKG_CONFIG_PATH

pathappend $VANILLA_PREFIX/lib             LIBRARY_PATH
pathappend $VANILLA_PREFIX/include         C_INCLUDE_PATH
pathappend $VANILLA_PREFIX/include         CPLUS_INCLUDE_PATH

ACLOCAL='aclocal -I $VANILLA_PREFIX/share/aclocal'

export PATH PKG_CONFIG_PATH ACLOCAL LIBRARY_PATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH

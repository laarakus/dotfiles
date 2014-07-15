PKGSRC_PREFIX="/usr/local"
PKGSRC_CONFIG="--prefix=$PKGSRC_PREFIX \
             --pkgdbdir=/usr/local/db/pkg \
             --ignore-user-check"
export PKGSRC_PREFIX

pathappend $PKGSRC_PREFIX/bin             PATH
pathappend $PKGSRC_PREFIX/lib/pkgconfig   PKG_CONFIG_PATH
pathappend $PKGSRC_PREFIX/share/pkgconfig PKG_CONFIG_PATH

pathappend $PKGSRC_PREFIX/lib             LIBRARY_PATH
pathappend $PKGSRC_PREFIX/include         C_INCLUDE_PATH
pathappend $PKGSRC_PREFIX/include         CPLUS_INCLUDE_PATH

ACLOCAL='aclocal -I $PKGSRC_PREFIX/share/aclocal'

export PATH PKG_CONFIG_PATH ACLOCAL LIBRARY_PATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH

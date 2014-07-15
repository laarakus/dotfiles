if [ -d /usr/local/lib/pkgconfig ] ; then
        pathappend /usr/local/lib/pkgconfig PKG_CONFIG_PATH
fi
if [ -d /usr/local/bin ]; then
        pathprepend /usr/local/bin
fi
if [ -d /usr/local/sbin -a $EUID -eq 0 ]; then
        pathprepend /usr/local/sbin
fi

if [ -d ~/bin ]; then
        pathprepend ~/bin
fi
#if [ $EUID -gt 99 ]; then
#        pathappend .
#fi
pathappend /usr/share/man                        MANPATH
pathappend /opt/texlive/2014/texmf-dist/doc/man  MANPATH
pathappend /usr/share/info                       INFOPATH
pathappend /opt/texlive/2014/texmf-dist/doc/info INFOPATH
pathappend /opt/texlive/2014/bin/x86_64-linux

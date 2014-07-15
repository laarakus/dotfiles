VIRTUALGL_PREFIX="/opt/VirtualGL"
export VIRTUALGL_PREFIX

pathappend $VIRTUALGL_PREFIX/bin             PATH

pathappend $VIRTUALGL_PREFIX/lib64           LIBRARY_PATH
pathappend $VIRTUALGL_PREFIX/include         C_INCLUDE_PATH
pathappend $VIRTUALGL_PREFIX/include         CPLUS_INCLUDE_PATH

export PATH LIBRARY_PATH 

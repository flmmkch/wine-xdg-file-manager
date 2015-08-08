#!/bin/sh

CURRENTDIR=`pwd`
INSTALLDIR=$CURRENTDIR
SCRIPTNAME=$INSTALLDIR/winedir.sh
REGFILENAME=$INSTALLDIR/winedir.reg

echo "#!/bin/sh

xdg-open \"\`winepath -u \"\$1\"\`\"" > $SCRIPTNAME

chmod +x $SCRIPTNAME

echo "[HKEY_CLASSES_ROOT\\Folder\\shell] 
@=\"xdg-open\" 
[HKEY_CLASSES_ROOT\\Folder\\shell\\xdg-open] 
[HKEY_CLASSES_ROOT\\Folder\\shell\\xdg-open\command] 
@=\"$SCRIPTNAME \\\"%1\\\"\" 

[HKEY_CLASSES_ROOT\Drive\shell] 
@=\"xdg-open\"
[HKEY_CLASSES_ROOT\Drive\shell\xdg-open] 
[HKEY_CLASSES_ROOT\Drive\shell\xdg-open\command] 
@=\"$SCRIPTNAME \\\"%1\\\"\" 

[HKEY_CLASSES_ROOT\Directory\shell] 
@=\"xdg-open\"
[HKEY_CLASSES_ROOT\Directory\shell\xdg-open] 
[HKEY_CLASSES_ROOT\Directory\shell\xdg-open\command] 
@=\"$SCRIPTNAME \\\"%1\\\"\" 

" > $REGFILENAME

wine regedit $REGFILENAME

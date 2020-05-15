#!/bin/sh

# -------------------------------------------------
#  Installation script for the hi-theme by SLywnow
# -------------------------------------------------
clear

INSTALLER_DIR="$(dirname $(readlink -f $0))"
REFIND_DIR="$1"
DEST_DIR="${REFIND_DIR}/themes/hi-theme"

echo "Wlcome to hi-themes for rEFInd Installation script!"

# Exit when an error
set -e
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT


if [ ! -d "$1" ]; then
    echo "ERROR: Give a path to the rEFInd directory"
    exit 2
fi

# Check
if [ -d "$DEST_DIR" ]; then
    echo "hi-theme is already installed, would you like to resetup it (old hi-theme will be deleted) [Y/n]?"
    read -p "" answer
    if [ "$answer" = "Y" -o "$answer" = "y" ]; then
        rm -r "$DEST_DIR"
    else
        echo "Installation cancelled"
        exit 0
    fi
fi

#Presets
echo "Do you want use preset or run custom theme setup?"
echo "0 - Custom setup, 1 - Dark preset, 2 - Light preset, 3 - Red preset, 4 - Green preset, 5 - Blue preset, 6 - Purple preset"
read -p "№ " instaltype

#Presets
if [ $instaltype = 1 ]; then 
    echo "Dark selected, generating the theme..."
    slcurbgs=1
    slcuricons=2
    slcurseltpe=1
    slcurselcol=2
    slconfshd=1
    slconfrb=0
    slconfext=0
elif [ $instaltype = 2 ]; then 
    echo "Light selected, generating the theme..."
    slcurbgs=2
    slcuricons=1
    slcurseltpe=2
    slcurselcol=1
    slconfshd=1
    slconfrb=0
    slconfext=0
elif [ $instaltype = 3 ]; then 
    echo "Red selected, generating the theme..."
    slcurbgs=3
    slcuricons=3
    slcurseltpe=3
    slcurselcol=3
    slconfshd=1
    slconfrb=0
    slconfext=0
elif [ $instaltype = 4 ]; then 
    echo "Green selected, generating the theme..."
    slcurbgs=4
    slcuricons=4
    slcurseltpe=4
    slcurselcol=4
    slconfshd=1
    slconfrb=0
    slconfext=0
elif [ $instaltype = 5 ]; then 
    echo "Blue selected, generating the theme..."
    slcurbgs=5
    slcuricons=5
    slcurseltpe=4
    slcurselcol=5
    slconfshd=1
    slconfrb=0
    slconfext=0
elif [ $instaltype = 6 ]; then 
    echo "Purple selected, generating the theme..."
    slcurbgs=6
    slcuricons=6
    slcurseltpe=2
    slcurselcol=6
    slconfshd=1
    slconfrb=0
    slconfext=0
fi 

#Custom
if [ $instaltype = 0 ]; then 
    echo "Custom selected, waiting the options..."
    echo "----Files----"
    echo "What background do you want?"
    echo "1 - Dark (Spruce forest), 2 - Light (Forest), 3 - Red (Bloody), 4 - Green (Vines), 5 - Blue (Rain in ocean), 6 - Purple (Retro)"
    read -p "№ " bgs 

    echo "--------"
    echo "What icons do you want?"
    echo "1 - Dark icons, 2 - Light icons, 3 - Red icons, 4 - Green icons, 5 - Blue icons, 6 - Purple icons"
    read -p "№ " icn 

    echo "--------"
    echo "What type of selectors do you want?"
    echo "1 - Neon frame, 2 - Line and point, 3 - Background frames, 4 - Background light"
    read -p "№ " seltpe 

    echo "--------"
    echo "What color of selectors do you want?"
    echo "1 - Dark, 2 - Light, 3 - Red, 4 - Green, 5 - Blue, 6 - Purple"
    read -p "№ " selcl 
    
    echo "----Congig----"mkdir -p $DEST_DIR
    echo "Do you want shutdown button? [y/n]"
    read -p "" shd 
    if [ "$shd" = "Y" -o "$shd" = "y" ]; then
        slconfshd=1
    fi

    echo "----Congig----"
    echo "Do you want reboot button? [y/n]"
    read -p "" rb 
    if [ "$rb" = "Y" -o "$rb" = "y" ]; then
        slconfrb=1
    fi

    echo "----Congig----"
    echo "Do you want exit button? [y/n]"
    read -p "" ext 
    if [ "$ext" = "Y" -o "$ext" = "y" ]; then
        slconfext=1
    fi

    slcurbgs=$bgs
    slcuricons=$icn
    slcurseltpe=$seltpe
    slcurselcol=$selcl
    
    echo "Options accepted, generating the theme..."
fi


#Setuptheme
rm -Rf $INSTALLER_DIR/hi-theme

mkdir -p $INSTALLER_DIR/hi-theme

if [ $slcurbgs = 1 ]; then
    cp $INSTALLER_DIR/main/bgs/1background.png $INSTALLER_DIR/hi-theme/background.png
elif [ $slcurbgs = 2 ]; then 
    cp $INSTALLER_DIR/main/bgs/2background.png $INSTALLER_DIR/hi-theme/background.png
elif [ $slcurbgs = 3 ]; then 
    cp $INSTALLER_DIR/main/bgs/3background.png $INSTALLER_DIR/hi-theme/background.png
elif [ $slcurbgs = 4 ]; then 
    cp $INSTALLER_DIR/main/bgs/4background.png $INSTALLER_DIR/hi-theme/background.png
elif [ $slcurbgs = 5 ]; then 
    cp $INSTALLER_DIR/main/bgs/5background.png $INSTALLER_DIR/hi-theme/background.png
elif [ $slcurbgs = 6 ]; then 
    cp $INSTALLER_DIR/main/bgs/6background.png $INSTALLER_DIR/hi-theme/background.png
else 
    echo "ERROR: Setup failed on getting background, if you select right numbers or select preset, contact with me in github"
    exit 2
fi

if [ $slcuricons = 1 ]; then
    cp -r $INSTALLER_DIR/main/icons/1dark $INSTALLER_DIR/hi-theme/icons
elif [ $slcuricons = 2 ]; then 
    cp -r $INSTALLER_DIR/main/icons/2light $INSTALLER_DIR/hi-theme/icons
elif [ $slcuricons = 3 ]; then 
    cp -r $INSTALLER_DIR/main/icons/3red $INSTALLER_DIR/hi-theme/icons
elif [ $slcuricons = 4 ]; then 
    cp -r $INSTALLER_DIR/main/icons/4green $INSTALLER_DIR/hi-theme/icons
elif [ $slcuricons = 5 ]; then 
    cp -r $INSTALLER_DIR/main/icons/5blue $INSTALLER_DIR/hi-theme/icons
elif [ $slcuricons = 6 ]; then 
    cp -r $INSTALLER_DIR/main/icons/6purple $INSTALLER_DIR/hi-theme/icons
else 
    echo "ERROR: Setup failed on getting icons, if you select right numbers or select preset, contact with me in github"
    exit 2
fi

if [ $slcurseltpe = 1 ]; then
    selpath="1neon-frame"
elif [ $slcurseltpe = 2 ]; then 
    selpath="2line"
elif [ $slcurseltpe = 3 ]; then 
    selpath="3frame"
elif [ $slcurseltpe = 4 ]; then 
    selpath="4background-light"
else 
    echo "ERROR: Setup failed on setting selector's type, if you select right numbers or select preset, contact with me in github"
    exit 2
fi

if [ $slcurselcol = 1 ]; then
    cp $INSTALLER_DIR/main/selects/$selpath/dark/selection_big.png $INSTALLER_DIR/hi-theme/selection_big.png
    cp $INSTALLER_DIR/main/selects/$selpath/dark/selection_small.png $INSTALLER_DIR/hi-theme/selection_small.png
elif [ $slcurselcol = 2 ]; then 
    cp $INSTALLER_DIR/main/selects/$selpath/light/selection_big.png $INSTALLER_DIR/hi-theme/selection_big.png
    cp $INSTALLER_DIR/main/selects/$selpath/light/selection_small.png $INSTALLER_DIR/hi-theme/selection_small.png
elif [ $slcurselcol = 3 ]; then 
    cp $INSTALLER_DIR/main/selects/$selpath/red/selection_big.png $INSTALLER_DIR/hi-theme/selection_big.png
    cp $INSTALLER_DIR/main/selects/$selpath/red/selection_small.png $INSTALLER_DIR/hi-theme/selection_small.png
elif [ $slcurselcol = 4 ]; then 
    cp $INSTALLER_DIR/main/selects/$selpath/green/selection_big.png $INSTALLER_DIR/hi-theme/selection_big.png
    cp $INSTALLER_DIR/main/selects/$selpath/green/selection_small.png $INSTALLER_DIR/hi-theme/selection_small.png
elif [ $slcurselcol = 5 ]; then 
    cp $INSTALLER_DIR/main/selects/$selpath/blue/selection_big.png $INSTALLER_DIR/hi-theme/selection_big.png
    cp $INSTALLER_DIR/main/selects/$selpath/blue/selection_small.png $INSTALLER_DIR/hi-theme/selection_small.png
elif [ $slcurselcol = 6 ]; then 
    cp $INSTALLER_DIR/main/selects/$selpath/purple/selection_big.png $INSTALLER_DIR/hi-theme/selection_big.png
    cp $INSTALLER_DIR/main/selects/$selpath/purple/selection_small.png $INSTALLER_DIR/hi-theme/selection_small.png
else 
    echo "ERROR: Setup failed on getting selectors, if you select right numbers or select preset, contact with me in github"
    exit 2
fi

cp $INSTALLER_DIR/main/theme.conf $INSTALLER_DIR/hi-theme/theme.conf

#Setup .config
echo "Setting up theme config..."
outputopt=""
if [ $slconfshd = 1 ]; then
    outputopt="showtools shutdown"
fi
if [ $slconfrb = 1 ]; then
    if [ -n $outputopt ]; then
        outputopt="showtools reboot"
    else
        outputopt=$outputopt",reboot"
    fi
fi
if [ $slconfext = 1 ]; then
   if [ -n $outputopt]; then
        outputopt="showtools exit"
    else
        outputopt=$outputopt",exit"
    fi
fi

echo $outputopt >> $INSTALLER_DIR/hi-theme/theme.conf


#Check files 
echo "Theme created! Check the files..."
errorfl=0
if [ ! -f $INSTALLER_DIR/hi-theme/background.png ]; then errorfl=1; fi
if [ ! -e $INSTALLER_DIR/hi-theme/icons ]; then errorfl=1; fi
if [ ! -f $INSTALLER_DIR/hi-theme/selection_big.png ]; then errorfl=1; fi
if [ ! -f $INSTALLER_DIR/hi-theme/selection_small.png ]; then errorfl=1; fi
if [ ! -f $INSTALLER_DIR/hi-theme/theme.conf ]; then errorfl=1; fi

if [ $errorfl = 1 ]; then
    echo "ERROR: Some files not found! Theme not installed. Try again, if this error will repeat, contact with me in github"
    exit 2
else 
    echo "Files founded! Moving theme to refind/themes and add hi-theme to config..."
fi 

#Move to refind
mkdir -p $DEST_DIR
cp -r $INSTALLER_DIR/hi-theme/* $DEST_DIR
rm -Rf $INSTALLER_DIR/hi-theme

# Disable other themes
if [ -f "${REFIND_DIR}/refind.conf" ]; then
    sed -i -r "/^[[:space:]]*include[[:space:]]themes\/refind-dreary\/theme\.conf/!s/^([[:space:]]*)(include[[:space:]]themes\/)/\1# \2/g" "${REFIND_DIR}/refind.conf"
else
    touch "${REFIND_DIR}/refind.conf"
fi

# Include the hi-theme theme
if ! grep -q -e "^[[:space:]]*include[[:space:]]themes/refind-dreary/theme.conf" "$REFIND_DIR/refind.conf"; then
cat >> "${REFIND_DIR}/refind.conf" << EOF

#Run hi-theme
include themes/hi-theme/theme.conf
EOF
fi

#Exit
echo "Succesfully installed hi-theme!"
exit 0

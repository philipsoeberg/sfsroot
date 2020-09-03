SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
if [ ! -d "$SCRIPTPATH/ipxe.git" ]; then
  cd $SCRIPTPATH
  git clone https://github.com/ipxe/ipxe/ ipxe.git
fi
cd $SCRIPTPATH/ipxe.git
git fetch
cd src
make bin-i386-pcbios/undionly.kpxe EMBED=$SCRIPTPATH/ipxe.embed.script
cp -f bin-i386-pcbios/undionly.kpxe ../../ipxe.c32
make bin-x86_64-efi/snponly.efi EMBED=$SCRIPTPATH/ipxe.embed.script
cp -f bin-x86_64-efi/snponly.efi ../../ipxe.efi

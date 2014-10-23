#/bin/sh

# mount example for ntfs-3g
#mount -t ntfs-3g /dev/sd2 /samu/sd2/

echo "install fuse ..."
wget http://nchc.dl.sourceforge.net/project/fuse/fuse-2.X/2.9.2/fuse-2.9.2.tar.gz
tar -zxvf tar -zxvf fuse-2.9.2.tar.gz
cd fuse-2.9.2
./configure
make
sudo make install
sudo modprobe fuse

echo "install ntfs-3g ..."
wget http://tuxera.com/opensource/ntfs-3g_ntfsprogs-2013.1.13.tgz
tar -zxvf tar ntfs-3g_ntfsprogs-2013.1.13.tgz 
cd ntfs-3g_ntfsprogs-2013.1.13
./configure
make
sudo make install

for kmod in $(find /lib/modules/$1/ -name *.ko.xz); do
	modinfo "$kmod" | grep "^name: " | sed "s/.* //" >> kernels/$1.txt;
done
sort -u -o kernels/$1.txt kernels/$1.txt;

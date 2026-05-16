#!/bin/sh
#Copyright (c) 2026 Divested Computing Group
#
#License: CC0
cat kernels/*.txt | grep -v "^#" | sed 's/ #.*$//' | sort -u > index.tmp.txt;
cat allowed-static*.txt systems/*.txt | grep -v "^#" | sed 's/ #.*$//' | sort -u > allowed.tmp.txt;

rm result.conf;

while IFS= read -r line
do
	echo "blacklist $line" >> result.conf;
done < index.tmp.txt;

while IFS= read -r line
do
	sed -i "/ $line$/ s/^/# /" result.conf;
done < allowed.tmp.txt;

echo "Total modules:"
wc -l result.conf
echo "Expected allowed modules:"
wc -l allowed.tmp.txt;
echo "Actual allowed modules:"
grep -c "^#" result.conf;
echo "Blocked modules:"
grep -c -v "^#" result.conf;

rm allowed.tmp.txt;
rm index.tmp.txt;

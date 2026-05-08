sort -u kernels/*.txt > index.txt
sort -u systems/*.txt > allowed.txt;

rm result.conf;

while IFS= read -r line
do
	echo "blacklist $line" >> result.conf;
done < index.txt;

while IFS= read -r line
do
	sed -i "/ $line$/ s/^/# /" result.conf;
done < allowed.txt;

echo "Total modules:"
wc -l result.conf
echo "Expected allowed modules:"
wc -l allowed.txt;
echo "Actual allowed modules:"
grep -c "^#" result.conf;
echo "Blocked modules:"
grep -c -v "^#" result.conf;

rm allowed.txt;
rm index.txt

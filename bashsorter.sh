SIZE=50
FOLDERNAME='music'
SAFETYMODE=true

while :
do
    echo -n "Max folder size: "
    read size
    len=${#size}
    testvar=$(echo "$size" | tr -dc '[:digit:]')
    if [[ $len -ne ${#testvar} ]] ; then
        echo "$size is not a number"
    else
        break
    fi
done 

echo -n "Folder name: "
read ans
$FOLDERNAME = $ans

echo -n "Safety mode? [y/N]: "
read ans
$SAFETYMODE = $ans

createFolder() {
    if[]
}
TAG="$1.$2"

read -r -p "Will release for Roon version $TAG. Are you sure? [y/n]: " input

case $input in
    [yY][eE][sS]|[yY])
        git tag -f $TAG && git push origin $TAG --force 
        ;;
    [nN][oO]|[nN])
        echo "Cancelled"
        exit 0
        ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac

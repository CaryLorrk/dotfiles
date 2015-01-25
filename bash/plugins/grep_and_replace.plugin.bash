ack_and_replace() {
    if [ -z "$1" ] || [ -z "$2" ];  then
        echo "usage: ack_and_replace pattern replacement"
        return
    fi

    ack -l --print0 "$1" | xargs -0 -n 1 sed -i -e "s/$1/$2/g"
}
export -f ack_and_replace

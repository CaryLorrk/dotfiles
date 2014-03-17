reduce_mp3()
{
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: reduce_mp3 file_name bitrate"
    else
        echo reduce mp3 "$1" to bitrate $2, output to "reduced_${1}"
        eval "lame --mp3input -b \"$2\" \"$1\" \"reduced_$1\""
    fi
}

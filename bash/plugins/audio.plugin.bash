split_flac_in_directory() {
    cuebreakpoints *.cue | shnsplit -o flac *.flac
    cuetag *.cue split-track*.flac
    for SLICE in split-track*.flac; do
        ARTIST=$(metaflac "$SLICE" --show-tag=ARTIST | sed s/.*=//g)
        TITLE=$(metaflac "$SLICE" --show-tag=TITLE | sed s/.*=//g)
        TRACKNUMBER=$(metaflac "$SLICE" --show-tag=TRACKNUMBER | sed s/.*=//g)
        mv "$SLICE" "`printf %02g $TRACKNUMBER`-$TITLE.flac"
    done
}
export -f split_flac_in_directory

reduce_mp3()
{
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: reduce_mp3 file_name bitrate"
    else
        echo reduce mp3 "$1" to bitrate $2, output to "reduced_${1}"
        eval "lame --mp3input -b \"$2\" \"$1\" \"reduced_$1\""
    fi
}

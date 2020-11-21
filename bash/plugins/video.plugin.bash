concat_video() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "usage: concat_video input output"
        return
    fi
    echo_and_run "ffmpeg -f concat -i $1 -c copy $2"
}
export -f concat_video

cuda_burn_subtitle() {
    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
        echo "usage: burn_subtitle video subtitle output [font_size]"
        return
    fi

    echo_and_run "ffmpeg -hwaccel cuvid -i '$1' -vf subtitles='$2':force_style='FontSize=${4-32}' -map 0:v -map 0:a -c:a copy -c:v h264_nvenc '$3'"
}
export -f cuda_burn_subtitle

burn_subtitle() {

    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
        echo "usage: burn_subtitle video subtitle output [font_size]"
        return
    fi

    echo_and_run "ffmpeg -i '$1' -vf subtitles='$2':force_style='FontSize=${4-32}' -map 0:v -map 0:a -c:a copy -c:v libx264 '$3'"

}
export -f burn_subtitle

burn_subtitle_ass() {
    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
        echo "usage: burn_subtitle_ass video subtitle output"
        return
    fi

    echo_and_run "ffmpeg -i '$1' -vf ass='$2' -map 0:v -map 0:a -c:a copy -c:v libx264 -crf '$3'"
}
export -f burn_subtitle_ass

split_video() {
    IN_FILE="$1"
    OUT_FILE_FORMAT="$3"
    typeset -i CHUNK_LEN
    CHUNK_LEN="$2"

    DURATION_HMS=$(ffmpeg -i "$IN_FILE" 2>&1 | grep Duration | cut -f 4 -d ' ')
    DURATION_H=$(echo "$DURATION_HMS" | cut -d ':' -f 1)
    DURATION_M=$(echo "$DURATION_HMS" | cut -d ':' -f 2)
    DURATION_S=$(echo "$DURATION_HMS" | cut -d ':' -f 3 | cut -d '.' -f 1)
    let "DURATION = ( DURATION_H * 60 + DURATION_M ) * 60 + DURATION_S"

    if [ "$DURATION" = '0' ] ; then
        echo "Invalid input video"
        echo "Usage : ffsplit.sh input-file chunk-duration [output-filename-format]"
        return
    fi

    if [ "$CHUNK_LEN" = "0" ] ; then
        echo "Invalid chunk size"
        echo "Usage : ffsplit.sh input-file chunk-duration [output-filename-format]"
        return
    fi

    if [ -z "$OUT_FILE_FORMAT" ] ; then
        FILE_EXT=$(echo "$IN_FILE" | sed 's/^.*\.\([a-zA-Z0-9]\+\)$/\1/')
        FILE_NAME=$(echo "$IN_FILE" | sed 's/^\(.*\)\.[a-zA-Z0-9]\+$/\1/')
        OUT_FILE_FORMAT="${FILE_NAME}-%03d.${FILE_EXT}"
        echo "Using default output file format : $OUT_FILE_FORMAT"
    fi

    N='1'
    OFFSET='0'
    let 'N_FILES = DURATION / CHUNK_LEN + 1'

    while [ "$OFFSET" -lt "$DURATION" ] ; do
        OUT_FILE=$(printf "$OUT_FILE_FORMAT" "$N")
        echo "writing $OUT_FILE ($N/$N_FILES)..."
        ffmpeg -i "$IN_FILE" -c:a copy -c:v libx264 -crf 20 -ss "$(($OFFSET-3))" -t "$(($CHUNK_LEN+3))" "$OUT_FILE"
        let "N = N + 1"
        let "OFFSET = OFFSET + CHUNK_LEN"
    done
}
export -f split_video 

concat_video() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "usage: concat_video input output"
        return
    fi
    echo_and_run "ffmpeg -f concat -i $1 -c copy $2"
}
export -f concat_video

burn_subtitle() {
    if [ -z "$1"] || [ -z "$2" ] || [ -z "$3" ]; then
        echo "usage: burn_subtitle video subtitle output"
        return
    fi

    echo_and_run "ffmpeg -i \"$1\" -vf subtitles=\"$2\" -map 0:v -map 0:a -c:a copy -c:v libx264 -crf 20 \"$3\""
}
export -f burn_subtitle

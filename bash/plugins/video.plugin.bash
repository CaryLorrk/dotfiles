concat_video() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "usage: concat_video input output"
        return
    fi
    echo_and_run "ffmpeg -f concat -i $1 -c copy $2"
}
export -f concat_video



resize_image()
{
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "usage: resize_image file_name size"
        return
    fi
    echo resize image $1 to size $2, output to resized_${1}
    echo_and_run "convert \"$1\" -resize $2 \"resized_$1\""
}

gif_to_mp4()
{
    if [ -z "$1" ]; then
        echo "usage: gif_to_mp4 file_name"
        return
    fi

    file=$1
    extension="${file##*.}"
    filename="${file%.*}"
    if [ $extension != "gif" ]; then
        echo "Not a gif file."
        return
    fi


    echo "convert ${file} to ${filename}.mp4"
    ffmpeg -loglevel error -i "${file}" -vf scale="trunc(iw/2)*2:trunc(ih/2)*2" \
        -c:v libx264 -pix_fmt yuv420p "${filename}.tmp.mp4"

    duration=`ffprobe -show_format ${filename}.tmp.mp4 2> /dev/null | sed -n '/duration/s/.*=//p'`
    if [[ ${duration} < 1 ]]; then
        concat=`echo "1.0/${duration}" | bc -l | python -c "print int(round(float(raw_input())+0.5)*3)"`
    else
        concat=3
    fi

    for ((i=0;i<${concat};++i)); do
        echo "file '${filename}.tmp.mp4'" >> "${filename}.tmp.txt"
    done

    ffmpeg -loglevel error -f concat -i "${filename}.tmp.txt" -c copy "${filename}.mp4"
    rm -rf "${filename}.tmp.mp4" "${filename}.tmp.txt"

}
export -f gif_to_mp4

png_to_jpg()
{
    if [ -z "$1" ]; then
        echo "usage: png_to_jpg file_name"
        return
    fi
    
    file=$1
    extension="${file##*.}"
    filename="${file%.*}"

    if [ $extension != "png" ]; then
        echo "Not a png file."
        return
    fi

    echo_and_run "convert '${filename}.png' -background white -flatten '${filename}.jpg'"
}
export -f png_to_jpg

rename_image_to_date()
{
    if [ -z "$1" ]; then
        echo "usage: rename_image_to_date file_name [OFFSET]"
        return 
    fi
    file="$1"
    OFFSET=${2:-0}

    if [ ! -f "$file" ]; then
        echo Cannot find file $file
        return
    fi

    #DATE=`exiftool -DateTimeOriginal "$file"  | sed 's/^.*: //g' | sed 's/ /-/g' | sed 's/:/./g'`
    FAKE_DATE=`exiftool -DateTimeOriginal "$file" | sed 's/^.*: //g' | sed 's/:/-/' | sed 's/:/-/'`

    if [ -z "$FAKE_DATE" ]; then
        echo Missing date information for "$file" 
        return
    fi

    EPOCH=`date -d "$FAKE_DATE" +%s`
    REAL_EPOCH=$(($EPOCH+$OFFSET))
    DATE=`date -d @$REAL_EPOCH +%Y.%m.%d-%H.%M.%S`

    EXTENSION=${file##*.}
    if  [ ! -e "${DATE}.$EXTENSION" ]; then
        echo rename "$file" to "${DATE}.$EXTENSION"
        mv "$file" "${DATE}.$EXTENSION"
    else
        eval "diff \"$file\" \"${DATE}.$EXTENSION\" > /dev/null"
        if [ $? -eq 0 ]; then
            echo "$file" and "${DATE}.$EXTENSION" are the same
        else
            for ((i=2;;++i)); do
                if [ -e "${DATE}-${i}.$EXTENSION" ]; then
                    "diff \"$file\" \"${DATE}-${i}.$EXTENSION\" > /dev/null"
                    if [ $? -eq 0 ]; then
                        echo "$file" and "${DATE}-${i}.$EXTENSION" are the same
                        break
                    fi
                else
                    echo rename "$file" to "${DATE}-${i}.$EXTENSION"
                    mv "$file" "${DATE}-${i}.$EXTENSION"
                    break
                fi
            done
        fi
    fi
}

date_offset()
{
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "usage: date_offset date1 date2"
        echo "description: date1-date2 in epoch."
        return 
    fi

    DATE1=$1
    DATE2=$2

    EPOCH1=`date -d "$DATE1" +%s`
    EPOCH2=`date -d "$DATE2" +%s`
    echo $(($EPOCH1-$EPOCH2))
}

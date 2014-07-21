resize_image()
{
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "usage: resize_image file_name size"
        return
    fi
    echo resize image $1 to size $2, output to resized_${1}
    echo_and_run "convert \"$1\" -resize $2 \"resized_$1\""
}

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

    echo_and_run "convert ${filename}.png -background white -flatten ${filename}.jpg"
}
export -f png_to_jpg

rename_image_to_date()
{
    if [ -z "$1" ]; then
        echo "usage: rename_image_to_date file_name"
        return 
    fi
    file="$1"

    if [ ! -f "$file" ]; then
        echo Cannot find file $file
        return
    fi

    DATE=`exiftool -DateTimeOriginal "$file"  | sed 's/^.*: //g' | sed 's/ /-/g' | sed 's/:/./g'`
    if [ -z $DATE ]; then
        echo Missing date information for "$file" 
        return
    fi

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

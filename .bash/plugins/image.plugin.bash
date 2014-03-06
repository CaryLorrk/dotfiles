. $HOME/.bash/plugins/echo_and_run.plugin.bash

resize_image()
{
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "usage: resize_image file_name size"
    else
        echo resize image $1 to size $2, output to resized_${1}
        echo_and_run "convert \"$1\" -resize $2 \"resized_$1\""
    fi
}

rename_image_to_date()
{
    if [ -z "$1" ]; then
        echo "usage: rename_image_to_date file_name"
    fi
    file="$1"

    if [ ! -f "$file" ]; then
        continue
    fi
    DATE=`exiftool -DateTimeOriginal "$file"  | sed 's/^.*: //g' | sed 's/ /-/g' | sed 's/:/./g'`
    if [ -z $DATE ]; then
        echo Missing date information for "$file" 
        continue
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

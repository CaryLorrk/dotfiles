rename_special_char()
{
    if [ -z "$1" ]; then
        echo "usage: rename_special_char filename"
        return
    fi
    filename=$1
    echo "rename $filename to " $(echo $filename | sed 's/[^a-zA-Z0-9._-]/_/g' -)
    rename 's/[^a-zA-Z0-9._-]/_/g' "$filename"
}

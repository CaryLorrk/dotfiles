# trashit

# original script
#    http://www.macosxhints.com/article.php?story=20030217172653485
#    author: Shane Celis <shane (at) gnufoo (dot) org>
#
# Sun, 20-May-2007; 06:47:22 
#    minor changes...
#
# Tuesday, 04-January-2011:
#    modified by Jacob Patterson <jacob.patterson@gmail.com>
#    includes "new" trash handling (~/.local/share/Trash),
#    trashinfo.  See http://ubuntuforums.org/showthread.php?t=623656#
#    for more info on how to use.
#
# Thursday, 08-December-2011:
#    modified by Helge Willum Larsen <helgesdk@gmail.com>
#    fixed overwriting trashinfo when name collision occurs.
#    rewritten to /bin/bash.
#    added checks for empty file name and orphaned trashinfo.
#
# !!! USE AT OWN RISK !!!

trashit() {
    TRASH=$HOME/.trash
    if [[ -z $@ ]]; then
        echo "usage: trashit <files...>" >&2
    fi

    for file in "$@"; do
        # get just file name
        destfile=`basename "$file"`
        if [[ -z ${destfile} ]]; then
            echo "empty filename" >&2
            continue
        fi
        unset suffix;
        declare -i i=0;

        # If that file already exists, change the name
        while [[ -e $TRASH/files/${destfile}${suffix} ]]; do
            i+=1
            suffix=" - copy $i";
        done

        trashinfo="$TRASH/info/${destfile}${suffix}.trashinfo"
        if [[ -e ${trashinfo} ]]; then
            echo "failed to trash: ${file}" >&2
            continue
        fi

        mv -vi "$file" "$TRASH/files/${destfile}${suffix}"

        # Create trashinfo so file can be restored from trash to original location
        echo "[Trash Info]" > ${trashinfo}
        echo "Path=`dirname $file`/`basename ${file}`" >> ${trashinfo}
        echo "DeletionDate=`date +%FT%T`" >> ${trashinfo}
    done
}

alias rmv='trashit'

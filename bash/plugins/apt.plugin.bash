update-repo() {
    sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/$1" \
    -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"    
}

_ppa_lists(){
    local cur

    _get_comp_words_by_ref cur
    _expand || return 0

    COMPREPLY=( $( find /etc/apt/sources.list.d/ -name "*$cur*.list" \
-exec basename {} \; 2> /dev/null ) )
    return 0
} &&
complete -F _ppa_lists update-repo

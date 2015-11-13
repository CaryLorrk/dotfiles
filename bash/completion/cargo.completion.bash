#!bash
# Bash completion for cargo
#

_cargo()
{
    local cur prev helpopts comopts comstring

    comstring=" build clean doc new run test bench update"

    COMPREPLY=()
    _get_comp_words_by_ref cur prev
    helpopts=`_parse_help ${COMP_WORDS[0]}`

    if [[ " ${comstring} " =~ " ${prev} " ]]; then
    comopts=`_parse_help "cargo ${prev}"`
    COMPREPLY=( $( compgen -W "${comopts}" -- "$cur" ) )
    return 0
    fi;

    case $prev in
    help)
        COMPREPLY=( $( compgen -W "${comstring}" -- "$cur" ) )
        return 0
        ;;
    esac

    COMPREPLY=( $( compgen -W "${comstring} ${helpopts} help" -- "$cur" ) )
    return 0
}
complete -F _cargo cargo

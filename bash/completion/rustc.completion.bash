#!bash
# Bash completion for rustc
#

_rustc()
{
    local cur prev helpopts codegenopts warnopts debugopts

    COMPREPLY=()
    _get_comp_words_by_ref cur prev
    helpopts=`_parse_help ${COMP_WORDS[0]}`

    case $prev in
        --help|-h|--crate-name)
            return 0
            ;;
        --version|-v)
            COMPREPLY=( $( compgen -W "verbose" -- "$cur" ) )   
            return 0
            ;;
        -L|--out-dir|--sysroot)
            _compopt_o_filenames
            COMPREPLY=( $( compgen -d -- "$cur" ) )
            return 0
            ;;
        --crate-type)
            COMPREPLY=( $( compgen -W "bin lib rlib dylib staticlib" -- "$cur" ) )
            return 0
            ;;
        --emit)
            COMPREPLY=( $( compgen -W "asm bc ir obj link" -- "$cur" ) )
            return 0
            ;;
        --debuginfo)
            COMPREPLY=( $( compgen -W "0 1 2" ) )
            return 0
            ;;
        -o|--dep-info)
            _compopt_o_filenames
            COMPREPLY=( $( compgen -d -- "$cur" ) $( compgen -f -- "$cur" ) )
            return 0
            ;;
        --opt-level)
            COMPREPLY=( $( compgen -W "0 1 2 3" ) )
            return 0
            ;;
        --pretty)
            COMPREPLY=( $( compgen -W "normal expanded typed expanded,identified flowgraph=" ) )
            return 0
            ;;
        -C|--codegen)
            codegenopts="`${COMP_WORDS[0]} -C help | awk '{ if ($1 ~ /-C/) { print $2; } }' | sed 's|=val|=|'` help"
            COMPREPLY=( $( compgen -W "${codegenopts}" -- "$cur" ) )
            return 0
            ;;
        -W|-A|-D|-F)
            warnopts="`${COMP_WORDS[0]} -W help | awk '{ if (($2 ~ /warn/) || ($2 ~ /deny/) || ($2 ~ /allow/)) { print $1; } }'` help"
            COMPREPLY=( $( compgen -W "${warnopts}" -- "$cur" ) )
            return 0
            ;;
        -Z)
            debugopts="`${COMP_WORDS[0]} -Z help | awk '{ if ($1 ~ /-Z/) { print $2;  } }'` help"
            COMPREPLY=( $( compgen -W "${debugopts}" -- "$cur" ) )
            return 0
            ;;
        --color)
            COMPREPLY=( $( compgen -W "auto always never" -- "$cur" ) )
            return 0
            ;;
    esac

    local IFS=$'\n'
    case $cur in
        -*)
            COMPREPLY=( $( compgen -W "${helpopts}" -- "$cur" ) )
            return 0
            ;;
    esac

    _expand || return 0

    xspec="*.rs"
    case $prev in
        $xspec)
        return 0
        ;;
    esac

    _compopt_o_filenames
    COMPREPLY=( $( compgen -d -- "$cur" ) $( compgen -f -X "!$xspec" -- "$cur" ) )

}
complete -F _rustc rustc

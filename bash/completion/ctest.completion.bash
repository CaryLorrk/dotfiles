# bash completion for ctest(1) -*- shell-script -*-

_ctest()
{
    local cur prev words cword
    _get_comp_words_by_ref cur prev words cword
    _expand || return 0


    case "$prev" in
        -C|--build-config)
            COMPREPLY=( $( compgen -W 'Debug Release RelWithDebInfo
                MinSizeRel' -- "$cur" ) )
            return
            ;;
        -j|--parallel)
            COMPREPLY=( $( compgen -W "{1..$(( $(_ncpus)*2 ))}" -- "$cur" ) )
            return
            ;;
        -O|--output-log|-A|--add-notes|--extra-submit)
            _filedir
            return
            ;;
        -L|--label-regex|-LE|--label-exclude|--track|-I|--tests-information|\
        --max-width|--timeout|--stop-time)
            # argument required but no completions available
            return
            ;;
        -R|--tests-regex|-E|--exclude-regex)
            COMPREPLY=( $( compgen -W '$( ctest -N 2>/dev/null |
                grep "^ Test" 2>/dev/null | cut -d: -f 2 )' -- "$cur" ) )
            return
            ;;
        -D|--dashboard)
            if [[ $cur == @(Experimental|Nightly|Continuous)* ]]; then
                local model action
                action=${cur#@(Experimental|Nightly|Continuous)}
                model=${cur%"$action"}
                COMPREPLY=( $( compgen -W 'Start Update Configure Build Test
                    Coverage Submit MemCheck' -P "$model" -- "$action" ) )
            else
                COMPREPLY=( $( compgen -W 'Experimental Nightly Continuous' \
                -- "$cur" ) )
                compopt -o nospace
            fi
            return
            ;;
        -M|--test-model)
            COMPREPLY=( $( compgen -W 'Experimental Nightly Continuous' -- \
                "$cur" ) )
            return
            ;;
        -T|--test-action)
            COMPREPLY=( $( compgen -W 'Start Update Configure Build Test
                Coverage Submit MemCheck' -- "$cur" ) )
            return
            ;;
        -S|--script|-SP|--script-new-process)
            _filedir '@(cmake|ctest)'
            return
            ;;
        --interactive-debug-mode)
            COMPREPLY=( $( compgen -W '0 1' -- "$cur" ) )
            return
            ;;
        --help-command)
            COMPREPLY=( $( compgen -W '$( ctest --help-command-list 2>/dev/null|
                grep -v "^ctest version " )' -- "$cur" ) )
            return
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W '$( _parse_help "$1" --help )' -- ${cur}) )
        [[ $COMPREPLY == *= ]] && compopt -o nospace
        [[ $COMPREPLY ]] && return
    fi

    _filedir
} &&
complete -F _ctest ctest

# ex: ts=4 sw=4 et filetype=sh

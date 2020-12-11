cli::initialize () 
{ 
    : ${arg_help:=false};
    : ${arg_self_test:=false};
    while (( $# > 0 )); do
        case $1 in 
            '-h')

            ;&
            '--help')
                arg_help=true
            ;;
            '--self-test')
                arg_self_test=true
            ;;
            *)
                echo "Unexpected argument '$1'.";
                exit 1
            ;;
        esac;
        shift;
    done
}
initialize () 
{ 
    cli::initialize "$@"
}
cli::export () 
{ 
    cli::export::variables "$@";
    cli::export::functions "$@"
}
cli::export::import () 
{ 
    echo "cli::import $@"
}
cli::export::variables () 
{ 
    local -u glob;
    for i in "$@";
    do
        glob+="${i}_";
    done;
    for i in $(eval echo "\${!${glob}@}");
    do
        declare -p "${i}" | sed 's/^declare/declare -g/';
    done
}
cli::export::functions () 
{ 
    local glob;
    for i in "$@";
    do
        glob+="${i}::";
    done;
    while read keyword flags name; do
        if [[ "${name}" == ${glob}* ]]; then
            declare -f "${name}";
        fi;
    done < <(declare -F)
}

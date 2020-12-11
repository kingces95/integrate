initialize() {
    # declarations
    declare -g arg_help=""
    declare -g arg_self_test=""
    declare -g arg_help=""
    declare -g arg_side=""
    
    # defaults
    arg_self_test=false
    arg_help=false
    
    # assign variables from command line arguments
    while (( $# > 0 )); do
        case "$1" in
            '--help') arg_help=true ;;
            '--self-test') arg_self_test=true ;;
            '-h') arg_help=true ;;
            '--side') arg_side="${2:-}"; shift ;;
            *)
                echo "Unexpected argument '$1'."
                exit 1
            ;;
        esac
        if (( $# > 0 )); then shift; fi
    done
    
    # required
    if [[ -z "${arg_side}" ]]; then
        echo "Missing required argument '--side'."
        exit 1
    fi
    
    # allowed values
}

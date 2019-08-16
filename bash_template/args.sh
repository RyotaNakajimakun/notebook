while getopts hj:p:s: OPTION; do
    case $OPTION in
        h) usage; exit 0;;
        x) ="$OPTARG";;
        ?) usage; exit 1;;
    esac
done
shift `expr $OPTIND - 1`
if  [ ! -z "$*" ]; then
    usage
    exit 1;
fi


NEED_ARGUMENT=0

function Usage () {
    cat <<EOF

$(basename ${0}) is a tool for ...

Usage:
    $(basename ${0}) args...

Options:
    args..: description

EOF
}

if [ $# -lt $NEED_ARGUMENT ]; then
    Usage
    exit
fi

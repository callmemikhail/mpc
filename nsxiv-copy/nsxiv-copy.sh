#!/usr/bin/env bash

echo "$0" "started;"

while [ -n "$1" ]; do
    case "$1" in
        -h|--help)
            echo "small bash util, nsxiv copy"
            echo "[-d] or [--directory] specify the directory"
            echo "[-t] or [--target] specify the destination directory"
            exit 0;;
        -d|--directory)
            work_dir="$2"
            shift 2;;
        -t|--target)
            targ_dir="$2"
            shift 2;;
        *)
            echo "Unknown flag, use -h or --help"
            exit 1;;
    esac
done
for dir_name in "$work_dir" "$targ_dir"; do
    if [ -z "$dir_name" ]; then
        echo "Directory was not specified"
        exit 1
    elif [ ! -d "$dir_name" ]; then
        echo "Directory '$dir_name' not exist"
        exit 1
    fi
done

cp $(nsxiv -rto "$work_dir") "$targ_dir"



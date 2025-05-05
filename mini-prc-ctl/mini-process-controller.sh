#!/usr/bin/env bash


while [ -n "$1" ]; do
    case "$1" in	
        -h|--help) 
		echo "[-t] or [--time] Enter time period"
		echo "[-n] or [--name] Enter process name"
		echo "[-p] or [--priority] Enter process priority"
		exit 0;;
            
        -n|--name) 
            	process_name="$2"
            	shift 2;;
        -p|--priority) 
            	process_priority="$2"
            	shift 2;;
	-t|--time)
		time_sleep="$2"
		shift 2;;		
		
		*) 
            echo "Unknown parameter: $1"
            exit 1;;
            
    esac
done

if [ -z "$process_name" ]; then
	echo "Error: Process name (-n) not specified"
	exit 1
fi
if [ -z "$process_priority" ]; then
	echo "Error: Priority (-p) not specified"
	exit 1
fi

if [ -z "$time_sleep" ]; then
	echo "Error: time period (-t) not specified"
	exit 1
fi


while true; do
    valid_processes=$(ps -e -o comm)
    if echo "$valid_processes" | grep -qw "$process_name"; then
        process_pid=$(pidof $process_name)
        for pid in $process_pid; do
            sudo renice $process_priority -p $pid
        done
        echo "Priority $process_priority set for $process_name"
        printf '%*s\n' 20 | tr ' ' '*'
        sleep $time_sleep
    else
        echo "$process_name: Process not found"
        break
    fi
done


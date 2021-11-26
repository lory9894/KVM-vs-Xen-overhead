#!/bin/bash
if ! command -v xentrace &> /dev/null
then
    echo "xentrace could not be found"
    exit 1
fi

declare -A MASKMAP=( [TRC_GEN]="0x0001f000" [TRC_SCHED]="0x0002f000" [TRC_DOM0OP]="0x0004f000" [TRC_HVM]="0x0008f000" [TRC_MEM]="0x0010f000" [TRC_ALL]="0xfffff000" [TRC_HVM_ENTRYEXIT]="0x00081000" [TRC_HVM_HANDLER]="0x00082000" )
MONITORS_XENTRACE_COMMAND=""
if ! [[ $MONITORS_XENTRACE_MASK =~ ^0x[0-9a-fA-F]{8}$ ]]; then
	MONITORS_XENTRACE_COMMAND+="${MASKMAP[$MONITORS_XENTRACE_MASK]}"
	
	if [[ -z ${MASKMAP[$MONITORS_XENTRACE_MASK]}  ]]; then
		echo "Uknown mask $MONITORS_XENTRACE_MASK, check man xentrace"
		exit 1
	fi
else
	MONITORS_XENTRACE_COMMAND+="${MONITORS_XENTRACE_MASK}"
fi

tmpfile=$(mktemp /tmp/mmtests-xentrace-XXXXXX.bin)
XENTRACEPID=
shutdown_xentrace(){
	kill $XENTRACEPID
	cp $tmpfile $SHELLPACK_LOG/xentrace-host
	rm $tmpfile
	exit 0
}

trap shutdown_xentrace SIGINT
trap shutdown_xentrace SIGTERM
echo "xentrace -D -e $MONITORS_XENTRACE_COMMAND $tmpfile"
xentrace -D -e $MONITORS_XENTRACE_COMMAND $tmpfile >/dev/null 2>&1 &
XENTRACEPID=$!
wait $XENTRACEPID


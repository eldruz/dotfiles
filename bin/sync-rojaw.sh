#!/bin/bash
# Script:	sync-rojaw.sh
# Synchronise les données de ma clé USB rojaw avec
# le disque dur de données du pc
#
# global variables
SCRIPTNAME=$(basename ${0} .sh)
LOGFILE=$HOME/var/log/csync-rojaw.log

VERBOSE="n"

EXIT_SUCCESS=0
EXIT_FAILURE=1
EXIT_ERROR=2
EXIT_BUG=10

# functions
function usage {
	  echo "Usage: ${SCRIPTNAME} [-h] [-v] - Syncs the notes between the desktop and rojaw." >&2
	  [[ ${#} -eq 1 ]] && exit ${1} || exit ${EXIT_FAILURE}
}

while getopts ':vh' OPTION ; do
	  case ${OPTION} in
        v)  VERBOSE=y
            ;;
		    h)	usage ${EXIT_SUCCESS}
			      ;;
		    \?)	echo "unknown option \"-${OPTARG}\"." >&2
			      usage ${EXIT_ERROR}
			      ;;
		    *)	echo "Impossible error. parameter: ${OPTION}" >&2
			      usage ${EXIT_BUG}
			      ;;
	  esac
done

# skip parsed options
shift $(( OPTIND - 1 ))

# beginning of script
# 2-way sync of my notes on the ~/notes folder and rojaw usb notes/ folder
# Sync the data/ directory on rojaw to the data hdd
date +"%d-%m-%Y %T" > ${LOGFILE}
CSYNC_CMD="csync ${HOME}/notes /media/rojaw/notes"
RSYNC_CMD="rsync -av /media/rojaw/Data/ /media/data"
if [[ ${VERBOSE} = y ]] ; then
    ${CSYNC_CMD} 2>&1 | tee --append ${LOGFILE}
    ${RSYNC_CMD} | tee --append ${LOGFILE}
else
    ${CSYNC_CMD} 2>> ${LOGFILE}
    ${RSYNC_CMD} 1>> ${LOGFILE}
fi
echo "Rojaw is operational."

exit ${EXIT_SUCCESS}

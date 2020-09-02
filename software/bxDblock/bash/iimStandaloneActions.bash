#
# /opt/public/osmt/bin/iimStandaloneLib.bash is common code
# which is included at the end of iimStandalone modules.
# 


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  iimActions    :: /[dblock]/ iimStandaloneActions.bash [[elisp:(org-cycle)][| ]]
_CommentEnd_

function visLibExamplesOutput {
    # $1=callingsName
    cat  << _EOF_
$( examplesSeperatorChapter "COMMON SEEDED EXAMPLES" )
${1} -i examplesCommonSeeded
${1} -i visit
${1} -i describe
${1} -i examples
_EOF_
}

function vis_examplesCommonSeeded {
 cat  << _EOF_
$( examplesSeperatorChapter "COMMON EXAMPLES" )
${G_myName} -i showMe
${G_myName} -i seedHelp
${G_myName} -n showOnly -T 9 -i help
${G_myName} -i runFunc func args
${G_myName} -i visit
_EOF_
}


function examplesSeperatorTopLabel {
 cat  << _EOF_
###############################  $@  #################################
_EOF_
}


function examplesSeperatorChapter {
 cat  << _EOF_
#################  $@  #################
_EOF_
}


function examplesSeperatorSection {
 cat  << _EOF_
=================  $@  =================
_EOF_
}


function examplesSeperatorSubSection {
 cat  << _EOF_
-----------------  $@  -----------------
_EOF_
}

function vis_showMe {
 cat  << _EOF_
--- Program Parameters
RcsId=${RcsId}
G_argsOrig=${G_argsOrig}
G_progName=${G_progName}
G_myName=${G_myName}
G_myInvokedName=${G_myInvokedName}
G_myFullName=${G_myFullName}
G_runMode=${G_runMode}
G_verbose=${G_verbose}
G_checkMode=${G_checkMode}
G_forceMode=${G_forceMode}
--- OSMT Configurable Parameters
opShellVersion=${.sh.version}
opBase=${opBase}
--- User Parameters
opRunAcctName=${opRunAcctName}
_EOF_
# Also Trace Level
# NOTYET, Also show other relevant opBase and config parameters

  printf -- "--- OSMT INFO ---"
  # NOTYET, test that it exists, use the right variable
  cat /etc/osmtInfo
}

function vis_seedHelp {
 cat  << _EOF_

The following features are available to all scripts based on
seedActions.sh and seedSubjectActions.sh

Tracing:     -T <runLevelNumber>  -- Ex: ${G_myName} -T 9
Run Mode:    -n <runMode>         -- Ex: ${G_myName} -n runSafe
Record Mode: -r <recordMode>      -- Ex: ${G_myName} -r basic
Verbose:     -v                   -- Ex: ${G_myName} -v
Elaborate:   -e                   -- Ex: ${G_myName} -e elaborationTextIsIgnored
Force Mode:  -f                   -- Ex: ${G_myName} -f
Check Mode:  -c                   -- Ex: ${G_myName} -c fast

Tracing
=======
            DEFAULT: -T 0

            Trace Number Conventions:

	    0: No Tracing
	    1: Application Basic Info
	    2: Application General Info
	    3: Application Function Entry and Exit
    	    4: Application Debugging
	    5: Wrappers Library
	    6: Seed Script
	    7: Seed Supporting Libraries (eg, doLib.sh)
	    8: ocp_library
	    9: Quick Debug, usually temporary

Run Mode:
=========
           DEFAULT: runOnly

G_runMode=
   showOnly:           at opDo* just show the args always return 0
   runOnly:            at opDo* just execute
   showRun:            at opDo both runOnly and showOnly
   runSafe:            at opDo both show and run, but if protected
                       then just show
   showProtected:      Run everything and don't show except for
                       show only protected
   showRunProtected:   Run everything and don't show except for
                       run and show rotected

runSafe = unprotected: showRun, protected: show
showProtected = unprotected: run, protected: show
showRunProtected = unprotected: run, protected: showRun 

Verbose Mode:
=============

G_verbose=
   verbose        When Set, verbose format (eg, line nu, time tag, ...)
                  of Tracing and RunMode are selected.

Force Mode:
=============

G_forceMode=
   force          When Set, force/overwrite mode of operation
                  is selected.

Check Mode:
===========

G_checkMode={fast,strict,full}
   fast:          1) Skip asserting and consistency checks.
                  2) Do less than default, invoker will 
                     compensate
   strict:        Do asserts and consistency checks.
   full:          1) Do more than default

_EOF_
}




#opBasePathSet

#systemName=`uname -n`
#devlOsType=`uname -s`


###

#PATH=/usr/sbin:/usr/bin:/sbin

# Get options (defaults immediately below):

badUsage=
traceLevel=

Array paramInfo
loadFiles=""

#G_checkMode=""
#G_forceMode=""

G_argsOrig="$@"
#G_progName=`FN_nonDirsPart ${0}`
G_progName=$( basename ${0} )
G_myName=${G_progName}
G_myInvokedName=${0}

G_humanUser=FALSE

#TM_trace 9 ${G_argsOrig}

dotMeParamTmpFile=/tmp/${G_progName}.dotMe.$$

G_runMode="runOnly"
G_runModeCmndOption=" -n runOnly "

G_recordMode=""
G_recordModeCmndOption=""

G_paramCmndOption=""

while getopts e:T:c:i:p:l:u?n:r:vfh c
do
    case $c in
    T)
	case $OPTARG in
	*[!0-9]* )
	    echo "$0: -T requires a numeric option"
 	    badUsage=TRUE
	    ;;
        [0-9]* )
	    traceLevel=$OPTARG
	    ;;
	esac
	;;
    i)
        visibleFunction="${OPTARG}"   # rest of argv is passed to visibleFunction
	;;
    p)
       leftSide=`ATTR_leftSide "${OPTARG}"`
       rightSide=`ATTR_rightSide "${OPTARG}"`
  
       echo "${leftSide}"="${rightSide}" >> ${dotMeParamTmpFile}

       G_paramCmndOption=" -p ${OPTARG} ${G_paramCmndOption}"
       ;;
    l)
	loadFiles="${loadFiles} ${OPTARG}"
	G_myName=`FN_nonDirsPart ${OPTARG}`
        G_myInvokedName=${OPTARG}
	;;

    c)
	G_checkMode="${OPTARG}"
	G_checkCmndOption=" -c "
	;;

    e)
	# Elaboration Text SimplyIgnored
        elaborationTextSimplyIgnored="${OPTARG}"
	;;

    n)
	case ${OPTARG} in 
	    "runOnly")
		G_runMode="runOnly"
   	        G_runModeCmndOption=" -n runOnly "
		;;
	    "showOnly")
		G_runMode="showOnly"
   	        G_runModeCmndOption=" -n showOnly "
		;;
	    "showRun")
		G_runMode="showRun"
   	        G_runModeCmndOption=" -n showRun "
		;;
	    "runSafe")
		G_runMode="runSafe"
   	        G_runModeCmndOption=" -n runSafe "
		;;
	    "showProtected")
		G_runMode="showProtected"
   	        G_runModeCmndOption=" -n showProtected "
		;;
	    "showRunProtected")
		G_runMode="showRunProtected"
   	        G_runModeCmndOption=" -n showRunProtected "
		;;
	    *)
		badUsage=TRUE
		;;
	esac
	;;

    r)
	case ${OPTARG} in 
	    "basic")
		G_recordMode="basic"
   	        G_recordModeCmndOption=" -r basic "
		;;
	    *)
		badUsage=TRUE
		;;
	esac
	;;

    v)
	G_verbose="verbose"
        G_verboseCmndOption=" -v "
	;;

    f)
	G_forceMode="force"
	G_forceModeCmndOption=" -f "
	;;

    h)
	G_humanUser=TRUE
	G_humanCmndOption=" -h "
	;;

    u | \?)
	badUsage=TRUE
	;;
    esac
done

G_commandOptions="${G_checkCmndOption} ${G_runModeCmndOption} ${G_verboseCmndOption} ${G_humanCmndOption} ${G_forceModeCmndOption} ${G_paramCmndOption}"
#echo "G_commandOptions=${G_commandOptions}"

typeset myOptind=$OPTIND


function FN_absolutePathGet {
  # $1 = given file

  if  test  $# -ne 1 ; then
    return 1
  fi

  typeset givenFile=$1

  if [ "${givenFile}" == "" ] ; then
      return 1
  fi

  # Similar to expand-file-name in elisp
  # Convert filename NAME to absolute, and canonicalize it.
  # 

  givenFile=`eval /bin/echo "${givenFile}"`

  typeset absPath=`
  case $givenFile in
    */*) cd ${givenFile%/*} ;;
  esac
  pwd -P
`/${givenFile##*/} 

  echo ${absPath}
}


function opMyFullNameGet {
    #set -x
    typeset firstChar=${G_myInvokedName:0:1}

    if [ "${firstChar}" == "/" ] ; then 
	G_myFullName=${G_myInvokedName}
	G_myFullName=$( FN_absolutePathGet ${G_myFullName} )
	return 
    fi
    
    if [[ -f ${G_myInvokedName} ]] ; then
	G_myFullName=${PWD}/${G_myInvokedName}
    else
	G_myFullName=$( which ${G_myName} )
    fi

    G_myFullName=$( FN_absolutePathGet ${G_myFullName} )

    if [[ ! -f ${G_myFullName} ]] ; then
	echo "${G_myFullName} not found"
	return 1
    fi
}

opMyFullNameGet


if [[ "${G_forceMode}_" != "_" ]] ; then
    export G_forceMode="${G_forceMode}"
fi
if [[ "${G_checkMode}_" != "_" ]] ; then
    export G_checkMode="${G_checkMode}"
    #print -u2 G_checkMode="${G_checkMode}"
fi


G_preParamHookVal=`ListFuncs | egrep '^G_preParamHook$'`
if [ "${G_preParamHookVal}X" != "X" ] ;   then
  G_preParamHook 
fi

#
# EXECUTE PARAMETER ASSIGNMENTS
#


if [[ -f ${dotMeParamTmpFile} ]] ; then
  . ${dotMeParamTmpFile}
  rm ${dotMeParamTmpFile}
fi


G_postParamHookVal=`ListFuncs | egrep '^G_postParamHook$'`
if [ "${G_postParamHookVal}X" != "X" ] ;   then
  G_postParamHook 
fi


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  IimSeed      :: iimRecordBegin  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function iimRecordBegin {
    typeset dateTag=$( date +%y%m%d%H%M%S%N )
    typeset userIdTag=$( id -u -n )

    typeset recordingBaseDir="/tmp"

    if [[ -d "/var/log/bisos/iim/bash" ]] ; then
	recordingBaseDir="/var/log/bisos/iim/bash"
    fi

    logFile=${recordingBaseDir}/${userIdTag}-${G_myName}-${dateTag}-log.org
    
    exec &> >(tee "${logFile}")
    printf "Started Logging To ${logFile}\n"
    cat  << _EOF_
${G_myName}  ${G_argsOrig} 
at ${G_myFullName} started at 
$( date ) by $( id -u -n) 
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
_EOF_
}


_CommentBegin_
**  [[elisp:(org-cycle)][| ]]  IimSeed      :: iimRecordEnd  [[elisp:(org-cycle)][| ]]
_CommentEnd_

iimRecordEndedP="false"

function iimRecordEnd {
    if [ ${iimRecordEndedP} != "false" ] ; then
	return
    fi	
    printf "End Logging To ${logFile}\n"
    date
    cat  << _EOF_
* Parameters:
#+STARTUP: content
_EOF_
    iimRecordEndedP="true"
}



#
# VERIFY COMPLETENESS OF REQUIRED PARAMETERS
#
function opParamMandatoryVerify {

  #if [[ "${BASH_VERSION}_" != "_" ]] ; then
    # Because bash does not implement 
    # typeset -t, this feature is not
    # functional in bash
  #  return 0
  #fi

  typeset retVal=0
  typeset i=""

  paramsList=`TagVarList`
  
  for i in ${paramsList} ; do
    if  [ "${i}X" == "X" ] ; then continue; fi;
      echo "if [ \"\${$i}_\" == \"MANDATORY_\" ] || [ \"\${$i}_\" == \"mandatory_\" ] ; then echo \"$i must be specified\"; badUsage=TRUE; fi;" > ${dotMeParamTmpFile}

      #cat ${dotMeParamTmpFile}
      . ${dotMeParamTmpFile}
  done

  if [[ "${badUsage}" == "TRUE" ]] ; then
    exit 1
  fi

  FN_fileRmIfThere ${dotMeParamTmpFile}

  return ${retVal}
}

function dash_i_set {
    if [ "${dash_i}" = "" ] ; then
	dash_i="-i"
    elif [ "${dash_i}" = "nil" ] ; then
	dash_i=""
    else
	EH_problem "Oops"
	exit 1
    fi
}

function usage {

  # to get subject specific itemCmd_ lines

    printf >&2 "Usage: ${G_myName} [ -T traceLevel ] [ -u ] [ -p parameter=value ] [-i visibleFunction] \n"
    
    visFuncsList=`ListFuncs | egrep '^vis_'`
    printf >&2 "Usage: visibleFunction is one of: "
    for i in ${visFuncsList}
    do
      printf >&2 "${i##vis_} "
    done
    printf >&2 "\n"

}


#########  EXECUTION STARTS HERE ############

#G_validateOption ${action}  "${actionValidList}"

#G_validateRunOS "${runOSValidList}"


#
# REPORT USAGE PROBLEMS
#

if [ ${badUsage} ] ; then
    usage
    exit 1
fi

#shift `expr $OPTIND - 1`
shift `expr $myOptind - 1`

G_argv="$@"

#TM_trace 9 Args="$@"

#
# PERFORM REQUESTED TASKS
#

if [ ! -z "${G_recordMode}" ] ; then
    trap iimRecordEnd EXIT
    #trap iimRecordEnd ERR    
fi

if [ "${visibleFunction}X" != "X" ]
then
    #echo "running ${visibleFunction}"
    if [ ! -z "${G_recordMode}" ] ; then
	iimRecordBegin
    fi
    
    vis_${visibleFunction} "$@"
    exitCode=$?

    if [ ! -z "${G_recordMode}" ] ; then	
	iimRecordEnd
    fi
    
    exit ${exitCode}
fi

function runNoArgsHook {
  noArgsHookVal=`ListFuncs | egrep '^noArgsHook$'`
  if [ "${noArgsHookVal}X" != "X" ] ;   then
    noArgsHook "$@"
  else
    echo "No action taken. Specify options."
    usage
  fi
  exit
}

if [ ! -z "${G_recordMode}" ] ; then
    iimRecordBegin
fi

runNoArgsHook "$@"
exitCode=$?

if [ ! -z "${G_recordMode}" ] ; then	
    iimRecordEnd
fi

exit ${exitCode}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  iimActions    :: /[dblock]-End/ iimStandaloneActions.bash [[elisp:(org-cycle)][| ]]
_CommentEnd_

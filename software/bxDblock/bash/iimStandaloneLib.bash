#
# /opt/public/osmt/bin/iimStandaloneLib.bash is common code
# which is included in the begining of iimStandalone modules.
# 

if [ -z "${BASH_VERSION}" ] ; then
    echo "UnSupported Bash"
    exit 1
fi

shopt -s expand_aliases
shopt -s extglob
#shopt

alias _CommentBegin_='cat << _CommentEnd_ > /dev/null'


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  iimLib        :: /[dblock]/ iimStandaloneLib.bash [[elisp:(org-cycle)][| ]]
_CommentEnd_

alias integer='typeset -i'
alias OrderedArray='typeset -a'
alias Array='typeset -a'
alias ListFuncs='typeset -F | sed -e s/"declare -f "//' 
alias TagVar='typeset -t'
alias TagVarList='typeset -t | sed -e s/"declare -t "// | cut -d= -f1'

alias TM_trace='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; tm_trace'
alias LOG_event='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; log_event'
alias LOG_message='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; log_event'
alias EH_oops='printf  >&2 "EH_,$FUNCNAME,$LINENO: OOPS"'
alias EH_problem='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; eh_problem'
alias EH_problemRet='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; eh_problem; return'
alias EH_fatal='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; eh_fatal'
alias EH_exit='tm_fileName=$FUNCNAME; tm_lineNo=$LINENO; eh_fatal'
alias EH_assert='opDoAssert eval '
alias opDoAssert='_opDoAssert "${G_myName}" "$FUNCNAME" $LINENO'
alias lpReturn='lpLastRetFuncIsValid=1; lpLastRetFunc=$FUNCNAME; return'
alias G_funcEntry='G_thisFunc=$FUNCNAME; G_thisFuncArgs=$@'
alias opDo='_opDo "${G_myName}" "$FUNCNAME" $LINENO "JUST_DO"'


function _opDoRunOnly {
  #
  # $1: mode
  # $2: msg
  # $3: failed msg
  # $4-: command

  if [[ "${1}X" == "JUST_DOX" ]] ; then
    shift; shift; shift;
    "$@" || err=$?
    return $err
  else
    typeset err=0
    typeset mode="${1}"
    typeset failedMsg="${3}"
    shift; shift; shift;
    "$@" || err=$?
    if [[ $err -ne 0 ]] ; then
      EH_problem "$failedMsg" "$err"
      if [[ "${mode}X" == "EXITX" ]] ; then
	exit $err
      fi
      return $err
    fi
  fi
}

function _opDoShowOnly {
  #
  # $1: mode
  # $2: msg
  # $3: failed msg
  # $4-: command
    if [[ "${BASH_VERSION}" != "" ]] ; then
	#echo -e ${2} 1>&2
	printf 1>&2 "%b \n" "${2}"
    else
	print -u2 "${2}"
    fi
}


function _opDoShowRun {
  #
  # $1: mode
  # $2: msg
  # $3: failed msg
  # $4-: command
  _opDoShowOnly "$@"
  _opDoRunOnly "$@"
}

function shift4ThenEcho {
    shift || exit
    shift || exit
    shift || exit
    shift || exit
    echo $*
}

function G_funcEntryShow {
    echo "${G_myName}:${G_thisFunc}:" 1>&2
}

function _opDoAfterPause {
    #shift
    #shift
    #shift
    #shift
    shift4ThenEcho "$@"
    _pauseForVerification ; if [[ ${skipIt} == "true" ]] ; then return; fi;
    _opDo "$@"
}

function _opDo {
    err=0
    typeset scriptName="$1"; shift || exit 
    typeset functionName="$1"; shift || exit
    typeset lineNumber="$1"; shift || exit
    typeset mode="$1"; shift || exit

    if [[ -z "${__opDo_prevScriptName}" ]] ; then
	export __opDo_prevScriptName=""
    fi
    if [[ -z "${__opDo_prevFunctionName}" ]] ; then
	export __opDo_prevFunctionName=""
    fi
    if [[ "${__opDo_prevScriptName}X" == "${scriptName}X" ]] ; then
	scriptName=""
    else
	__opDo_prevScriptName="${scriptName}"
	scriptName="${scriptName}::"
    fi
    if [[ "${__opDo_prevFunctionName}" == "${functionName}" ]] ; then
	functionName=""
    else
	__opDo_prevFunctionName="${functionName}"
    fi
    
    if [ -z "${G_recordMode}" ] ; then
	lineNumberTag="** [${lineNumber}]"
    else
	lineNumberTag="** [[file:${G_myFullName}::${lineNumber}][${lineNumber}]]"	
    fi

    if [ -z "${G_recordMode}" ] ; then
	scriptFuncName="* ${scriptName}${functionName}"	
    else
	scriptFuncName="* [[file:${G_myFullName}::function ${functionName}][${scriptName}${functionName}]]"		
    fi

    typeset msg
    typeset failedMsg
    dateTag=$( date +%Y%m%d%H%M%S%N )
    case "${G_verbose}" in
	"verbose")
	    if [ "${scriptName}" == "" ] ; then
		if [ "${functionName}" == "" ] ; then
		   msg="${lineNumberTag}: $@"
		else
		    #msg="* ${scriptName}${functionName} -- ${dateTag}\n${lineNumber}: $@"
		    msg="${scriptFuncName} -- ${dateTag}\n${lineNumberTag}: $@"
		fi 
	    else
		#msg="* ${scriptName}${functionName} -- ${dateTag}\n${lineNumber}: $@"
		msg="${scriptFuncName} -- ${dateTag}\n${lineNumberTag}: $@"		
	    fi
	    failedMsg="FAILED: ${scriptName}${functionName}${lineNumber}: $@ [ErrCode]="
	    ;;
	*)
	    msg="$@"
	    failedMsg="FAILED: $@ [ErrCode]="
	    ;;
    esac
    case "${G_runMode}" in
	"runOnly")
	    _opDoRunOnly "$mode" "$msg" "$failedMsg" "$@" || return $?
	    ;;
	"showOnly")
	    _opDoShowOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    ;;
	"showRun")
	    _opDoShowRun "$mode" "$msg" "$failedMsg" "$@" || return
	    ;;
	"runSafe")
	    #runSafe = unprotected: showRun, protected: show
	    if [[ ${__opDo_withinCritical} -eq 0 ]] ; then
		_opDoShowRun "$mode" "$msg" "$failedMsg" "$@" || return
	    else
		_opDoShowOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    fi
	    ;;
	"showCritical"|"showProtected")
	    #showCritical    = unprotected: run,     protected: show
	    if [[ ${__opDo_withinCritical} -eq 0 ]] ; then
		_opDoRunOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    else
		_opDoShowOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    fi
	    ;;
	"showRunCritical"|"showRunProtected")
	    #showRunCritical = unprotected: run,     protected: showRun 
	    if [[ ${__opDo_withinCritical} -eq 0 ]] ; then
		_opDoRunOnly "$mode" "$msg" "$failedMsg" "$@" || return
	    else
		_opDoShowRun "$mode" "$msg" "$failedMsg" "$@" || return
	    fi
	    ;;
    esac
    return $err
}

function _opDoAssert {
    typeset err=0
    typeset scriptName="$1"; shift || exit 
    typeset functionName="$1"; shift || exit
    typeset lineNumber="$1"; shift || exit
    scriptName="${scriptName}::"
    lineNumber="[${lineNumber}]"
    typeset failedMsg="ASSERTION FAILED: ${scriptName}${functionName}${lineNumber}: $@ [ErrCode]="
    "$@" || err=$?
    if [[ $err -ne 0 ]] ; then
	EH_problem "$failedMsg" "$err"
	exit $err
    fi
}


tm_trace() {
  # $1 = traceNu
  # $2 = traceString

  if [ ${traceLevel} ] ; then
    if test $1 -le ${traceLevel} ; then
      shift
      printf >&2 "TM_,${tm_fileName},${tm_setFile},${tm_lineNo}: $*\n"
    fi
  fi
}

log_event() {
  printf >&2 "LOG_,${tm_fileName},${tm_setFile},${tm_lineNo}: $*\n"
}

eh_problem() {
  printf >&2 "EH_,${G_myName},${tm_fileName},${tm_lineNo}: PROBLEM: $*\n"
}

eh_fatal() {
  printf >&2 "EH_,${tm_fileName},${tm_lineNo}: FATAL $*\n"
  exit 1
}

function vis_runFunc {
  #EH_assert [[ $# -gt 0 ]]
  typeset func=$1
  shift
  ${func} "$@"
}

function vis_reRunAsRoot {
    EH_assert [[ $# -gt 0 ]]

    globalReRunRetVal=0

    runId=$( id -u )
    if [ "${runId}" != "0" ] ; then
	#ANT_raw "Re Invokation as root:"
	#opDo sudo ${opBinBase}/${G_myName} -i runFunc $@
	#export G_runMode="runOnly"
	opDo sudo ${G_myFullName} ${G_commandOptions} -i runFunc $@
	globalReRunRetVal=$?
	#ANT_raw retVal=${globalReRunRetVal}
	lpReturn 0
    else
	lpReturn 127
    fi
}


FN_fileSymlinkUpdate() {
  # $1 is the source/origin  name (should exist)
  # $2 is the target name (gets created)

  if  test $# -ne 2 ; then
    EH_problem "$0 requires two args: Args=$*"
    return 1
  fi

  if test -a $1 ;   then  # Src file exists
    if test  -h $2 ;     then
      printf >&2  "$2 already a symlink, removing it\n"
      ls -l $2 1>&2
      /bin/rm $2
      printf  1>&2 "running: ln -s $1 $2\n"
      ln -s $1 $2
    elif test -a $2 ; then
      # The target should not have existed before
      printf  1>&2 "$2 exists: skiping $0 of $1\n"
      ls -l $2 1>&2
    else
      ln -s $1 $2
      ls -l $2 1>&2
    fi
  else
    printf 1>&2 "No $1: skiping $0 of $1\n"
  fi
}

#alias continueAfterThis='echo "${G_myName}::$0:$LINENO"; _continueAfterThis; if [[ ${skipIt} == "true" ]] ; then return; fi;'
alias continueAfterThis='_continueAfterThis; if [[ ${skipIt} == "true" ]] ; then return; fi;'

function _continueAfterThis {
    #echo "About to: $*"
    if [ ${G_humanUser} != "TRUE" ] ; then
	return
    fi
    echo -n "Hit enter to continue, \"skip\" to skip or \"EXIT\" to exit: "
    skipIt=false
    while read line ; do
	if [[ "${line}_" == "SKIP_"  || "${line}_" == "skip_" ]] ; then
	echo "Skiped"
	    skipIt=true
	    break
	fi

	if [[ "${line}_" == "EXIT_"  || "${line}_" == "exit_" ]] ; then
	    exit
	fi

	if [[ "${line}_" == "_" ]] ; then
	    #echo "Continuing ...."
	    break
	fi

	echo "HA! ${line} -- Say Again"
	echo -n "Hit enter to continue, \"skip\" to skip or \"EXIT\" to exit: "
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  iimLib        :: /[dblock]-End/ iimStandaloneLib.bash [[elisp:(org-cycle)][| ]]
_CommentEnd_


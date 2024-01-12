#!/bin/bash

####+BEGIN: bx:bsip:bash:seed-spec :types "seedNameDistProc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedNameDistProc.sh]] |
"
FILE="
*  /This File/ :: /bxo/r3/iso/piu_mbFullUsage/mailings/compose/activism/misc-2023/dists/activism-biden-1986/distProc.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedNameDistProc.sh -l $0 "$@"
    exit $?
fi
####+END:

leavesExcludes=""

leavesOrdered=""

nodesExcludes=""

nodesOrdered=""

####+BEGIN: bx:dblock:ploneProc:bash:leavesList :types ""
# {{{ DBLOCK-leavesList
leavesList="
"
# }}} DBLOCK-leavesList
####+END:

####+BEGIN: bx:dblock:ploneProc:bash:nodesList :types ""
# {{{ DBLOCK-nodesList
nodesList="
"
# }}} DBLOCK-nodesList
####+END:

# {{{ EXTRAs

function examplesHookPost {
      typeset extraInfo="-v -n showRun"
cat  << _EOF_
--- EXTRAs ---
${G_myName} ${extraInfo} -i namesOutputListWith vis_siblings          # List Of Files To Include and Exclude
--- DISTRIBUTIONS PROCESSING ---
${G_myName} ${extraInfo} -i distNamesOutputToFileWith vis_siblings  # = namesOutputToFilesWith dist vis_siblings
${G_myName} ${extraInfo} -i distNextBatch                   # After distNamesGenWith + logsToNames = namesResultFor dist
${G_myName} ${extraInfo} -i distPrepWith vis_siblings         # distNamesOutputWith + logsToNames + distNextBatch
====== Template Syncronization =======
diff ./distProc.sh  ${startsBaseDir}/distProc.sh
cp   ./distProc.sh  ${startsBaseDir}/distProc.sh 
cp   ${startsBaseDir}/distProc.sh  ./distProc.sh  
_EOF_
 return
}

function vis_mailingFileNames {
     echo "../../biden-1986.orgMsg"
}

function vis_distHereNames {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    distIncludeFileName ../names/here.names
    listNamesGlobalExcludes
}

function vis_siblings {
  distIncludeFileName /bxo/usg/bystar/bpos/usageEnvs/fullUse/names/family/siblings.names
  listNamesGlobalExcludes
  #outputIncludeAndExcludeLists
}

####+BEGIN: bx:dblock:bash:end-of-file :types ""
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:

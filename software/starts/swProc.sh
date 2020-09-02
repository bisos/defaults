#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
####+END:

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedSoftwareProc.sh"
####+END:

leavesExcludes=""

leavesOrdered=""

nodesExcludes=""

nodesOrdered=""

####+BEGIN: bx:dblock:ploneProc:bash:leavesList :types ""
####+END:

####+BEGIN: bx:dblock:ploneProc:bash:nodesList :types ""
####+END:

# {{{ EXTRAs

function examplesHookPostExample {
cat  << _EOF_
--- EXTRAs ---
${G_myName} ${extraInfo} -i extraExample
_EOF_
 return
}

function vis_extraExample {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}

# }}} EXTRAs


####+BEGIN: bx:dblock:bash:end-of-file :types ""
####+END:

#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
####+END:

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedNameDistProc.sh"
####+END:

leavesExcludes=""

leavesOrdered=""

nodesExcludes=""

nodesOrdered=""

####+BEGIN: bx:dblock:ploneProc:bash:leavesList :types ""
####+END:

####+BEGIN: bx:dblock:ploneProc:bash:nodesList :types ""
####+END:

startsBaseDir="/libre/ByStar/InitialTemplates/nameDist/starts"

# {{{ EXTRAs

function examplesHookPost {
cat  << _EOF_
--- EXTRAs ---
${G_myName} ${extraInfo} -i extraExample
====== Template Syncronization =======
diff ./nameProc.sh  ${startsBaseDir}/nameProc.sh
cp   ./nameProc.sh  ${startsBaseDir}/nameProc.sh 
cp   ${startsBaseDir}/nameProc.sh  ./nameProc.sh  
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


function vis_distHereNames {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local here=$(pwd)
    local outFile="${here}/here.names"

    inBaseDirDo /acct/employee/lsipusr/BUE/names/iranians bbdbNamesProc.sh -v -n showRun -p mode=stdout -i bigInIran 2> /dev/null 1> ${outFile}

    distIncludeFileName ${outFile}

    listNamesGlobalExcludes

    lpReturn
}



####+BEGIN: bx:dblock:bash:end-of-file :types ""
####+END:

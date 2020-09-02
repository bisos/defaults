#!/bin/bash

IimBriefDescription="iimsProc.sh extensions based on seedIimsProc.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
typeset RcsId="$Id: iimsProc.sh,v 1.3 2016-10-22 06:56:39 lsipusr Exp $"
# *CopyLeft*
#  This is a Halaal Poly-Existential. See http://www.freeprotocols.org

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"
####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedIimsProc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedIimsProc.sh]] | 
"
FILE="
*  /This File/ :: /de/bx/nne/dev-py/iimsPkgs/begunIim/iimsProc.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedIimsProc.sh -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

G_myPanel="./Panel.org"


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples Hook Post [[elisp:(org-cycle)][| ]]
_CommentEnd_


function examplesHookPost {
cat  << _EOF_
$( examplesSeperatorChapter "*Extentions* (examplesHookPost)" )
diff ./Panel.org /libre/ByStar/InitialTemplates/activeDocs/common/iimPanels/polySon/beginPanel.org
==============
diff ./iimsProc.sh /libre/ByStar/InitialTemplates/software/begin/iims/common/iimsProc.sh
==============
${G_myName} ${extraInfo} -i panelPreps
$( examplesSeperatorChapter "Some Local IIM Extensions" )
${G_myName} ${extraInfo} -i defaultsTargetsAndParamsSet
_EOF_
 return
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: pkgInit [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_pkgInit {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -d "./tmp" ] ; then
	opDo mv ./tmp ./tmp.${dateTag}
    fi
    FN_dirCreatePathIfNotThere ./tmp
    opDo fileParamManage.py -i fileParamWrite ./tmp dateVer "uninitialized"

    if [ -d "./iimsIn" ] ; then
	opDo mv ./iimsIn ./iimsIn.${dateTag}
    fi
    FN_dirCreatePathIfNotThere ./iimsIn
    FN_dirCreatePathIfNotThere ./iimsIn/control
    opDo fileParamManage.py -i fileParamWrite ./iimsIn/control iimsPkgLabel  $(FN_nonDirsPart $(pwd))
    opDo fileParamManage.py -i fileParamWrite ./iimsIn/control dateVer "uninitialized"    

    FN_dirCreatePathIfNotThere ./iimsIn/targets
    FN_dirCreatePathIfNotThere ./iimsIn/proxies    

    if [ -d "./iimsOut" ] ; then
	opDo mv ./iimsOut ./iimsOut.${dateTag}
    fi
    FN_dirCreatePathIfNotThere ./iimsOut

    opDo vis_defaultsTargetsAndParamsSet    

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: pkgDistClean [[elisp:(org-cycle)][| ]]
_CommentEnd_



function vis_pkgDistClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET, 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    describeF

    opDo vis_effectiveLisClean 
    #opDo FN_fileSymlinkRemoveIfThere ./liTargets.py
    #opDo FN_fileSymlinkRemoveIfThere ./liParams.py

    opDo vis_selectionsPanelClean    
    opDo FN_fileSymlinkRemoveIfThere ./panelSelects

    opDo FN_dirRemoveIfThere ./output  ./outputFiles ./outputFiles__main__
    
    opDo FN_dirRemoveIfThere ./data_cache

    opDo FN_dirRemoveIfThere ./inputFiles

    opDo FN_dirRemoveIfThere ./iimsOut  

    opDo FN_fileRmIfThere ./eml-*.org                 
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: FN_dirRemoveIfThere [[elisp:(org-cycle)][| ]]
_CommentEnd_


function FN_dirRemoveIfThere {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset thisDir=""
    for thisDir in $@ ; do
	if [ -d "${thisDir}" ] ; then
	    opDo /bin/rm -r -f "${thisDir}"
	fi
    done
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF           :: vis_panelPreps [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_panelPreps {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset tmpFile=$( FN_tempFile )

    typeset selectedIim=$( cat ./_selectedIim )

    if [ -z ${selectedIim} ] ; then
	ANT_raw "Missing _selectedIim -- panelPreps skipped"
	lpReturn
    fi

    cat  ./Panel.org  | sed  \
	-e "s:@selectedIim@:${selectedIim}:" \
        >> ${tmpFile}

    opDo mv ${tmpFile} ./Panel.org
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: vis_defaultsTargetsAndParamsSet [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_defaultsTargetsAndParamsSet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #
    # To be customized on a per pkg basis
    #

    typeset objectType=$(cat _objectType_)
    
    if [ -z "${objectType}" ] ; then
	EH_problem "Missing _objectType_"
	lpReturn 101
    fi
    
    case ${objectType} in
	"bxt.py.iim.to")
	    opDo vis_selectionsPanelPrep	    
	    opDo iimsProc.sh -h -v -n showRun  -p liTargetsDotpy=/de/bx/current/district/librecenter/tiimi/targets/bxp/tList/ts-librecenter-localhost.py -p liParamsDotpy=/de/bx/current/district/librecenter/tiimi/targets/bxp/paramList/bxpUsageParams.py -i effectiveLisSet    	    
	    ;;
	"bxt.py.iim.polySon")
	    opDo vis_selectionsPanelPrep	    
	    ;;
	"bxt.py.iim")
	    doNothing
	    ;;
	*)
	    ANT_raw "Unsupported objectType=${objectType}"
	    ;;	    
    esac
    
    lpReturn
}




_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

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

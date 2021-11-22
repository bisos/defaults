#!/bin/bash

IimBriefDescription="iimsProc.sh: A scattered IIM extensions based on seedIimsProc.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
typeset RcsId="$Id: iimsProc.leaf.sh,v 1.2 2017-07-06 01:17:45 lsipusr Exp $"
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
*  /This File/ :: /de/bx/nne/dev-py/iimsPkgs/remoteMailActions/envelopeDsn/iimsProc.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedIimsProc.sh -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  IIM Profile / Characteristic Definitions    [[elisp:(org-cycle)][| ]]
_CommentEnd_

# Types are defined as associative arrays in /opt/public/osmt/lib/visLib.sh

G_iimGroupingType=${IimGroupingType[pkged]}

G_myPanel=$(FN_prefix ${G_myName})-Panel.org

G_iimCmndParts="
${IimCmndParts[common]}
"


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples Hook Post [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  examplesHookPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function examplesHookPost {
cat  << _EOF_
$( examplesSeperatorChapter "*Extentions* (examplesHookPost)" )
${G_myName} ${extraInfo} -i panelPreps
${G_myName} ${extraInfo} -i iimsPkgPreps   # from visLib.sh sets up ./var/iimsPkg/iimsIn/paramsFp
$( examplesSeperatorChapter "Some Local IIM Extensions" )
${G_myName} ${extraInfo} -i defaultsTargetsAndParamsSet
${G_myName} ${extraInfo} -i pkgInit $(cat _selectedIim)
${G_myName} ${extraInfo} -i pkgInfo
$( examplesSeperatorChapter "*Templates Development*" )
----  Initial Templates Development ----
diff ./iimsProc.sh  /bisos/apps/defaults/begin/templates/purposed/iims/bash/iimsProc.leaf.sh
cp ./iimsProc.sh  /bisos/apps/defaults/begin/templates/purposed/iims/bash/iimsProc.leaf.sh
cp  /bisos/apps/defaults/begin/templates/purposed/iims/bash/iimsProc.leaf.sh ./iimsProc.sh 
----  Initial Templates Development ----
diff ./Panel.org /bisos/apps/defaults/begin/templates/purposed/iims/bash/common/beginPanel.org
cp ./Panel.org /bisos/apps/defaults/begin/templates/purposed/iims/bash/common/beginPanel.org
cp /bisos/apps/defaults/begin/templates/purposed/iims/bash/common/beginPanel.org ./Panel.org 
_EOF_
 return
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgInfo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local bxtObject=$(cat _objectType_)

    if [ ! -f _iimsList ] ; then
	EH_problem ""
	lpReturn
    fi

    local iimsList=$(cat _iimsList)

    ANT_raw "iimsList=${iimsList}"

    local iimLanguage=""
    local thisIim=""
    for thisIim in ${iimsList}; do
	iimLanguage=$( ${thisIim} -i iimLanguage)
	echo "${thisIim} -- ${iimLanguage}"
	
	if [ "${iimLanguage}" == "bash" ] ; then
	    opDo ${thisIim} -i iimGroupingType
	    opDo ${thisIim} -i iimCmndPartList
	elif [ "${iimLanguage}" == "python" ] ; then
	    echo "NOTYET -- IIM-Profile can be retrieved with -i iim.groupingType etc"	    
	    EH_problem "python ${thisIim} -- Notyet"
	else
	    EH_oops "${thisIim}"
	    continue
	fi
    done

    case "${bxtObject}" in
	"bxt.iim.bash.pkged")
	    ANT_cooked "Processed bxtObject=${bxtObject}"	    
	    ;;
	*)
	    ANT_cooked "Unprocessed bxtObject=${bxtObject}"
	    ;;
    esac


    lpReturn
  }


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_varIimsPkgPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_varIimsPkgPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    opDo fileParamManage.py -i fileParamWrite ./iimsIn/control iimsPkgLabel  $(FN_nonDirsPart $(pwd))
    opDo fileParamManage.py -i fileParamWrite ./iimsIn/control dateVer "uninitialized"    

    
    if [ $# -eq 0 ] ; then
	iimsList=$(cat _iimsList)
    else
	iimsList="$@"
    fi

    opDo FN_dirCreatePathIfNotThere ./tmp    

    local iimLanguage=""
    local thisIim=""
    for thisIim in ${iimsList}; do
	iimLanguage=$( ${thisIim} -i iimLanguage)
	if [ "${iimLanguage}" == "bash" ] ; then
	    opDo ${thisIim} -h -v -n showRun -i pkgedPanelPreps	    
	elif [ "${iimLanguage}" == "python" ] ; then
	    EH_problem "python ${thisIim} -- Notyet"
	else
	    EH_oops ""
	    continue
	fi
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgInit    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgInit {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    local iimsList=""
    
    if [ $# -eq 0 ] ; then
	iimsList=$(cat _iimsList)
    else
	iimsList="$@"
    fi

    opDo FN_dirCreatePathIfNotThere ./tmp    

    local iimLanguage=""
    local thisIim=""
    for thisIim in ${iimsList}; do
	iimLanguage=$( ${thisIim} -i iimLanguage)
	if [ "${iimLanguage}" == "bash" ] ; then
	    opDo ${thisIim} -h -v -n showRun -i pkgedPanelPreps	    
	elif [ "${iimLanguage}" == "python" ] ; then
	    EH_problem "python ${thisIim} -- Notyet"
	else
	    EH_oops ""
	    continue
	fi
    done
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgInitObsoleted    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgInitObsoleted {
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

    opDo vis_selectionsPanelPrep

    opDo iimsProc.sh -h -v -n showRun  -p liTargetsDotpy=/de/bx/current/district/librecenter/tiimi/targets/bxp/tList/ts-librecenter-localhost.py -p liParamsDotpy=/de/bx/current/district/librecenter/tiimi/targets/bxp/paramList/bxpUsageParams.py -i effectiveLisSet    
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pkgDistClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pkgDistClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET, 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #describeF

    opDo FN_dirRemoveIfThere ./var

    opDo FN_dirRemoveIfThere ./tmp

    lpReturn    

    #opDo vis_effectiveLisClean 
    #opDo FN_fileSymlinkRemoveIfThere ./liTargets.py
    #opDo FN_fileSymlinkRemoveIfThere ./liParams.py

    #opDo vis_selectionsPanelClean    
    #opDo FN_fileSymlinkRemoveIfThere ./panelSelects

    #opDo FN_dirRemoveIfThere ./output  ./outputFiles ./outputFiles__main__
    
    #opDo FN_dirRemoveIfThere ./data_cache

    #opDo FN_dirRemoveIfThere ./inputFiles

    #opDo FN_dirRemoveIfThere ./iimsOut  

    #opDo FN_fileRmIfThere ./eml-*.org                 
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_panelPreps    [[elisp:(org-cycle)][| ]]
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
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_defaultsTargetsAndParamsSet    [[elisp:(org-cycle)][| ]]
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

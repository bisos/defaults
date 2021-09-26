#!/bin/bash

IimBriefDescription="srAgent.sh Maps the current sr to corresponding bsrXxManage.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: srAgent.sh,v 1.5 2016-07-22 06:49:09 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/: [[file:/opt/public/osmt/bin/seedActions.bash]] | 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] | 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*
**    *[[elisp:(org-cycle)][Description And Purpose]]*  [[elisp:(beginning-of-buffer)][Top]]  [[elisp:(org-cycle)][| ]] 
_EOF_
}

_CommentBegin_
*      ################      *Seed Extensions*
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

# /opt/public/osmt/bin/biso.libSh
#. ${opBinBase}/bxIso.libSh
. ${opBinBase}/biso.libSh

# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    typeset srFqdn=$( fileParamManage.py -i fileParamReadPath ./srInfo/srFqdn )
    typeset srBaseDir=$( pwd )
    typeset isoId=$(vis_bisoIdGetThere ${srBaseDir})
    typeset sr=$(vis_bisoSrGetThere ${srBaseDir})
    typeset svcCapability="bsrA2GenericManage.sh"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Service Realization Agent" )
$( examplesSeperatorSection "Get SR Info" )
${G_myName} ${extraInfo} -i srFqdnGet
$( examplesSeperatorSection "Get SR LogBase" )
${G_myName} ${extraInfo} -i srLogsBase
$( examplesSeperatorSection "Initial Bxt Object Creation/Update" )
bxtStartCommon.sh  -i startObjectUpdateInThere $( pwd )  # Auto Detect -- NOTYET
$( examplesSeperatorSection "Service Capability: ${svcCapability}" )
${svcCapability}
${svcCapability} -h -v -n showRun -p bystarUid=${isoId} -p sr=${sr} -i fullUpdate 
${svcCapability} -h -v -n showRun -p bystarUid=${isoId} -p sr=${sr} -i visitUrl
$( examplesSeperatorSection "Seed Candidates" )
${G_myName} ${extraInfo} -i bisoBaseGetThere $( pwd )
${G_myName} ${extraInfo} -i bisoSrGetThere $( pwd )
${G_myName} ${extraInfo} -i bisoIdFromBase /acct/smb/com/bysource-git
${G_myName} ${extraInfo} -i bisoIdGetThere $( pwd )
$( examplesSeperatorSection "Initial Templates Development" )
diff ./srAgent.sh  /libre/ByStar/InitialTemplates/iso/sr/common/srAgent.sh
cp ./srAgent.sh  /libre/ByStar/InitialTemplates/iso/sr/common/srAgent.sh
cp /libre/ByStar/InitialTemplates/iso/sr/common/srAgent.sh ./srAgent.sh
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Interactively Invokable Functions (IIF)s | 
_CommentEnd_


function vis_srFqdnGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo fileParamManage.py -i fileParamReadPath ./srInfo/srFqdn
    EH_retOnFail

    lpReturn
}


function vis_srLogsBase {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset bxIsoBaseDir=$(vis_bxIsoBaseGetThere $(pwd))
    typeset bxIsoSr=$(vis_bxIsoSrGetThere $(pwd))
    typeset bxIsoSrVar=$(echo ${bxIsoSr} | sed -e 's:iso/:var/:')

    echo ${bxIsoBaseDir}/${bxIsoSrVar}/logs

    lpReturn
}


_CommentBegin_
*      ################      *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]======  /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:

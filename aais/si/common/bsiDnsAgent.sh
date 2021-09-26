#!/bin/bash

IimBriefDescription="bsrAgent.sh -- General purpose Service Realization processor."

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: bsrDnsAgent.sh,v 1.2 2016-07-25 05:35:04 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedBsiDnsAgent.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedBsiDnsAgent.sh]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/defaults/aais/si/common/bsiDnsAgent.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedBsiDnsAgent.sh -l $0 "$@"
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
*      ======[[elisp:(org-cycle)][Fold]]====== *[Base Template:]*  [[file:/libre/ByStar/InitialTemplates/iso/sr/common/bsrAgent.sh]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*
**    *[[elisp:(org-cycle)][Description And Purpose]]*  [[elisp:(beginning-of-buffer)][Top]]  [[elisp:(org-cycle)][| ]] 
      Based on the specification of file parameter ./srInfo/svcCapability,
      manage this service realization.
_EOF_
}

_CommentBegin_
*      ################      *Seed Extensions*
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== ExamplesHookPost
_CommentEnd_


function examplesHookPost {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    #oneBystarUid=${currentBystarUid}
    #oneBystarUid=prompt
    oneBystarUid=current

    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    typeset srFqdn=$( fileParamManage.py -i fileParamReadPath ./srInfo/srFqdn )
    typeset srBaseDir=$( pwd )
    typeset isoId=$(vis_bisoIdGetThere ${srBaseDir})
    #typeset sr=$(vis_bxIsoSrGetThere ${srBaseDir})
    typeset svcCapability="bystarGitoliteHttpAdmin.sh"

  cat  << _EOF_
$( examplesSeperatorTopLabel "examplesHookPost Extensions" )
_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Interactively Invokable Functions (IIF)s | 
_CommentEnd_



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

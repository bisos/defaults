#!/bin/bash

IimBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: pkgRePubLca.sh,v 1.1 2016-11-25 05:45:02 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedPkgRePub2.sh"
SEED="
* /[dblock]/--Seed/: /opt/public/osmt/bin/seedPkgRePub2.sh
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedPkgRePub2.sh -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Cycle Vis]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][1 Win]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]]

####+END:
_CommentEnd_



_CommentBegin_
*      ================
*      ################  CONTENTS-LIST #############
*      ======[[elisp:(org-cycle)][Fold]]====== *[Info]* Module Description, Notes (TODO Lists, etc.)
_CommentEnd_
function vis_describe {  cat  << _EOF_
**     ====[[elisp:(org-cycle)][Fold]]==== Essential Features TODO
*** TODO [#A] ======== Improve G_commonExamples.
    SCHEDULED: <2014-02-03 Mon>
*** TODO ======== Add the EH_ module.
_EOF_
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions
_CommentEnd_


function examplesHookPostNot {
  cat  << _EOF_
----- POST HOOK ADDITIONS -------
${G_myName} -i pkgRePubObtainInstructions
_EOF_
}


function vis_pkgRePubObtainInstructions {
  cat  << _EOF_
Go There and Do That.
_EOF_
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Distribution+Generation Parameters Specification
_CommentEnd_


vis_pkgRePubParameters() {
  EH_assert [[ $# -eq 0 ]]
  distFamilyGenerationHookRun pkgRePubParameters
}

pkgRePubParameters_UBUNTU_1310 () { pkgRePubParameters_commonUbuntu; }

pkgRePubParameters_DEBIAN_7 () { pkgRePubParameters_commonDebian; }

pkgRePubParameters_commonDebian () {
    opDo pkgRePubParameters_commonUbuntu;
}

pkgRePubParameters_DEFAULT_DEFAULT () {
      EH_problem "No Handler Found for ${opRunDistFamily}/${opRunDistGeneration}"
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== pkgRePubParameters_commonUbuntu
_CommentEnd_


function pkgRePubParameters_commonUbuntu {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


_CommentBegin_
*     ====[[elisp:(org-cycle)][Fold]]==== Pkgs List
_CommentEnd_

    prpList_main=( 
	"basePkg"        # This can be made version specific --     
    )

    #
    # In BASH 4.x Associative Arrays From Within A Function Can Not Be Made Global.
    # But prpList_main is dist+gen specific. So multiple generations are maintained based on the list.
    #

    lpReturn
}


_CommentBegin_
*     ====[[elisp:(org-cycle)][Fold]]==== basePkg (Common)
_CommentEnd_


typeset -A prp_basePkg=(
    [pkgRePubName]="Plone-3.3.6-UnifiedInstaller.tgz"
    [pkgRePubSrcStableUrl]="http://launchpad.net/plone/3.3/3.3.6/+download/Plone-3.3.6-UnifiedInstaller-20110816.tgz"
    [pkgRePubArchType]="all"     # all or i386
    [pkgRePubDistDests]="localDist"    # or "localDist currentDist"
)


_CommentBegin_
*     ====[[elisp:(org-cycle)][Fold]]==== Execute based on platform generation.
_CommentEnd_

vis_pkgRePubParameters


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ================ /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:

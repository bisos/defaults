#!/bin/bash

IimBriefDescription="presProc.sh based on seedPresProc.sh"

ORIGIN="
* Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
typeset RcsId="$Id: presProc.sh,v 1.1 2020-08-24 05:05:21 lsipusr Exp $"
__copyLeft__="
* Copyleft:  This is a Halaal Poly-Existential. See http://www.freeprotocols.org
"
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedPresProc.sh"
SEED="
* /[dblock]/--Seed/: /opt/public/osmt/bin/seedPresProc.sh
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedPresProc.sh -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_


_CommentBegin_
*      ================
*      ################ CONTENTS-LIST #################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Info]* Module Description, Notes (TODO Lists, etc.)
**      ====[[elisp:(org-cycle)][Fold]]==== --no-logo --script
**      ====[[elisp:(org-cycle)][Fold]]==== Create The dispostion directory and frame-0 frame-n + Globals + a directory for each label.
_CommentEnd_

function vis_describeUsage {  
    vis_describe
    cat  << _EOF_
_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Seed Hooks
_CommentEnd_

function cleanPost {
  #if [[ -L tables ]] ; then /bin/rm tables; fi
  #if [[ -L figures ]] ; then /bin/rm figures; fi
  return
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Extension Examples
_CommentEnd_

function examplesHookPost {
    cat  << _EOF_
$( examplesSeperatorTopLabel "EXTENSION EXAMPLES" )
${G_myName} ${extraInfo} -i describeUsage | emlVisit
_EOF_
}

_CommentBegin_
*      ################ /Features/
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Extenstion Facilities
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :types ""
_CommentBegin_
*      ================ /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:


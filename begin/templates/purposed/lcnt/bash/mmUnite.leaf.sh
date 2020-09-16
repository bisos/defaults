#!/bin/bash

IimBriefDescription="presProc.sh based on seedPresProc.sh"

ORIGIN="
* Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
typeset RcsId="$Id: mmUnite.leaf.sh,v 1.4 2018-01-24 06:58:31 lsipusr Exp $"
# *CopyLeft*
#  This is a Halaal Poly-Existential. See http://www.freeprotocols.org

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedMmUnite.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedMmUnite.sh]] | 
"
FILE="
*  /This File/ :: /lcnt/lgpc/examples/permanent/bxde/en+fa/pres+art/jan161803/mmUnite.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedMmUnite.sh -l $0 "$@" 
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
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST #################
*  [[elisp:(org-cycle)][| ]]  [BACS]        :: *[Info]* Module Description, Notes (TODO Lists, etc.) [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Subject      :: --no-logo --script [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Subject      :: Create The dispostion directory and frame-0 frame-n + Globals + a directory for each label. [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_describeUsage    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_describeUsage {  
    vis_describe
    cat  << _EOF_
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [BACS]        :: Seed Hooks [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  cleanPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function cleanPost {
  # Place Holder
  return
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [BACS]        :: Extension Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  examplesHookPost    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function examplesHookPost {
    cat  << _EOF_
$( examplesSeperatorTopLabel "EXTENSION EXAMPLES" )
${G_myName} ${extraInfo} -i describeUsage | emlVisit
$( examplesSeperatorTopLabel "pdfpc Notes Generator (Pdf Presentation Console)" )
sed -i -e  's/\\\\/\n/g' -e  's/\\par/\n\n/g'  presentationEnFa.pdfpc 
pdfpc presentationEnFa.pdf  # Two Screens
pdfpc -S presentationEnFa.pdf  # One Screen
$( examplesSeperatorTopLabel "Base Setup" )
${G_myName} ${extraInfo} -i baseSetup
$( examplesSeperatorTopLabel "Audio Base Setup" )
${G_myName} ${extraInfo} -i startAudioVideo
$( examplesSeperatorSection "Process Impressive Tags Of LaTeX Input" )
${G_myName} ${extraInfo} -i impressiveTagsUpdate
iimBeamerImpressiveEmacs.py -v 30 --load ./presentationEnFa-itags.py -i loadProc
$( examplesSeperatorSection "ScreenCasting Preparations And Execution" )
${G_myName} ${extraInfo} -i screenCastingFullClean
${G_myName} ${extraInfo} -i screenCastingFullUpdate
$( examplesSeperatorSection "Initial Templates Development" )
${G_myName} ${extraInfo} -i buildRevealPreview ./presentationEnFa.ttytex
=====================================
---- EnFa - procProc.sh -- Initial Templates Development ----
diff ./mmUnite.sh  /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUnite.leaf.sh
cp ./mmUnite.sh  /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUnite.leaf.sh
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUnite.leaf.sh  ./mmUnite.sh 
---- EnFa - Panel.org -- Initial Templates Development ----
bx-dblock -i diffBlankedFiles ./MmUnitePanel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginMmUnitePanel.org
diff ./MmUnitePanel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginMmUnitePanel.org
cp ./MmUnitePanel.org /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginMmUnitePanel.org
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/org/beginMmUnitePanel.org ./MmUnitePanel.org 
_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  examplesHookPostObsoleted    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function examplesHookPostObsoleted {
    cat  << _EOF_
$( examplesSeperatorTopLabel "EXTENSION EXAMPLES" )
${G_myName} ${extraInfo} -i describeUsage | emlVisit
avconv  -i pres.ogv -strict -2 -f mp4 pres.mp4
$( examplesSeperatorTopLabel "pdfpc Notes Generator (Pdf Presentation Console)" )
sed -i -e  's/\\\\/\n/g' -e  's/\\par/\n\n/g'  presentationEnFa.pdfpc 
pdfpc presentationEnFa.pdf  # Two Screens
pdfpc -S presentationEnFa.pdf  # One Screen
$( examplesSeperatorTopLabel "Audio Base Setup" )
${G_myName} ${extraInfo} -i startAudio
impressive --nologo --darkness 10 --spot-radius 32 -I /acct/smb/com/tmo-son/bx/lcnt/lgpc/permanent/swDevEnv/sonTmcpDevEnvVm/voiceOver.info  --geometry 1280x720 ./presentationEnFa.pdf
$( examplesSeperatorSection "Process Impressive Tags Of LaTeX Input" )
${G_myName} ${extraInfo} -i impressiveTagsUpdate
iimBeamerImpressiveEmacs.py -v 30 --load ./presentationEnFa-itags.py -i loadProc
$( examplesSeperatorSection "ScreenCasting Preparations And Execution" )
${G_myName} ${extraInfo} -i screenCastingFullClean
${G_myName} ${extraInfo} -i screenCastingFullUpdate
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] /Features/
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [BACS]        :: Extenstion Facilities [[elisp:(org-cycle)][| ]]
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


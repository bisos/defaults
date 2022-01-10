#!/bin/bash

IimBriefDescription="lcntProc.sh based on seedLcntProc.sh"

ORIGIN="
* Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
typeset RcsId="$Id: lcntProc.sh,v 1.4 2016-02-07 01:44:28 lsipusr Exp $"
# *CopyLeft*
#  This is a Halaal Poly-Existential. See http://www.freeprotocols.org

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

####+BEGIN: bx:bisos:bash:seed-spec :types "/bisos/core/lcnt/bin/seedLcntProc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/lcnt/bin/seedLcntProc.sh]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/defaults/mailing/compose/faEn/generic/lcntProc.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/lcnt/bin/seedLcntProc.sh -l $0 "$@"
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
function vis_describe {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related]*    [[elisp:(find-file "/de/bx/nne/dev-py/bin/iimBeamerImpressiveEmacs.py")][iimBeamerImpressiveEmacs.py]]   [[elisp:(find-file "/opt/public/osmt/bin/bx-desktopCapture")][bx-desktopCapture]] lcntProc.sh  [[elisp:(find-file "/bisos/apps/defaults/activeDocs/blee/bystarContinuum/videoProc/fullUsagePanel-en.org")][VideoProc Pannel]]

_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Seed Hooks
_CommentEnd_


function buildPre {
  #if [[ ! -d tables ]] ; then ln -s ../Q1-2007-BusPlan/tables tables; fi
  lcntSourceTypeBaseDir="${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/${lcntAttrPermanence}"
  if [[ ! -d figures ]] ; then ln -s ${lcntSourceTypeBaseDir}/common/figures figures; fi
  return
}

function buildPost {
  #if [[ -L tables ]] ; then /bin/rm tables; fi
  return
}


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
$( examplesSeperatorChapter "Local Results Release" )
${G_myName} ${extraInfo} -i resultsRelease
${G_myName} ${extraInfo} -i buildResultsRelease
$( examplesSeperatorChapter "Presentation / Disposition Processing" )
./presProc.sh
---- EnFa - lcntProc.sh -- Initial Templates Development ----
diff ./lcntProc.sh  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/lcntProc.sh
cp  ./lcntProc.sh  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/lcntProc.sh
cp  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/lcntProc.sh ./lcntProc.sh
---- EnFa - Panel.org -- Initial Templates Development ----
diff ./Panel.org  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/Panel.org
cp  ./Panel.org  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/Panel.org
cp  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/Panel.org ./Panel.org
---- EnFa - mailing.ttytex -- Initial Templates Development ----
diff ./mailing.ttytex  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/mailing.ttytex
cp  ./mailing.ttytex  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/mailing.ttytex
cp  /bisos/apps/defaults/mailing/staticMailing/enFa/generic/mailing.ttytex ./mailing.ttytex
---- FaEn - lcntProc.sh -- Initial Templates Development ----
diff ./lcntProc.sh  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/lcntProc.sh
cp  ./lcntProc.sh  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/lcntProc.sh
cp  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/lcntProc.sh ./lcntProc.sh
---- FaEn - Panel.org -- Initial Templates Development ----
diff ./Panel.org  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/Panel.org
cp  ./Panel.org  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/Panel.org
cp  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/Panel.org ./Panel.org
---- FaEn - mailing.ttytex -- Initial Templates Development ----
diff ./mailing.ttytex  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/mailing.ttytex
cp  ./mailing.ttytex  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/mailing.ttytex
cp  /bisos/apps/defaults/mailing/staticMailing/faEn/generic/mailing.ttytex ./mailing.ttytex
_EOF_
}

function vis_buildHtmlPreview {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=heveaHtml -i buildDocs mailing.ttytex
    opDo eoe-browser ./heveaHtml-mailing/index.html
    lpReturn
}

function vis_buildPdfPreview {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=pdf -i buildDocs mailing.ttytex
    opDo acroread mailing.pdf
    lpReturn
}



function vis_buildResultsRelease {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=pdf -i buildDocs mailing.ttytex

    opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=heveaHtml -i buildDocs mailing.ttytex

    opDo vis_resultsRelease

    lpReturn
}


function vis_resultsRelease {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ ! -f ./mailingStatic/mailingName ] ; then
	EH_problem "Missing mailingName fileVar"
	lpReturn 101
    fi
    typeset mailingName=$(cat ./mailingStatic/mailingName)
    if [ -z ${mailingName} ] ; then
	EH_problem "Missing mailingName Value"
	lpReturn 101
    fi

    echo ${mailingName}

    if [ ! -d ./rel ] ; then
	opDo mkdir -p ./rel
    fi

    opDo cp ./mailing.pdf  ./rel/${mailingName}.pdf
    
    opDo mkdir -p ./rel/${mailingName}-html   
    opDo cp -r -p ./heveaHtml-mailing/*  ./rel/${mailingName}-html

    opDo /opt/public/osmt/bin/elispFilterHtml.sh -v -n showRun  -i deTitleCompletely ./rel/${mailingName}-html/index.html

    lpReturn
}



####+BEGIN: bx:dblock:bash:end-of-file :types ""
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]======  /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:


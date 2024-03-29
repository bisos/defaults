#!/bin/bash

IimBriefDescription="lcntProc.sh based on seedLcntProc.sh"

ORIGIN="
* Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
typeset RcsId="$Id: lcntProc.sh,v 1.5 2016-02-07 02:40:12 lsipusr Exp $"
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
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/defaults/mailing/compose/enFa/generic/lcntProc.sh
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


pdf=""


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Seed Hooks
_CommentEnd_


function buildPre {
  #if [[ ! -d tables ]] ; then ln -s ../Q1-2007-BusPlan/tables tables; fi
    #lcntSourceTypeBaseDir="${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/${lcntAttrPermanence}"
    lcntSourceTypeBaseDir="NOTYET"
  if [[ ! -L figures ]] ; then ln -s ${lcntSourceTypeBaseDir}/common/figures figures; fi
  return
}

function buildPost {
  #if [[ -L tables ]] ; then /bin/rm tables; fi
  return
}


function cleanPost {
    #if [[ -L tables ]] ; then /bin/rm tables; fi
    #if [[ -L figures ]] ; then /bin/rm figures; fi
    
    local backupFiles=$( ls content.mail.2* 2> /dev/null )

    if [ ! -z "${backupFiles}" ] ; then
	lpDo rm ${backupFiles}
    fi
    if [ -d rel ] ; then
	lpDo rm -r -f rel
    fi
    return
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Extension Examples
_CommentEnd_


function examplesHookPost {
    extraInfo="-v -n showRun"
    cat  << _EOF_
$( examplesSeperatorTopLabel "EXTENSION EXAMPLES" )
$( examplesSeperatorChapter "Mailing Info" )
${G_myName} ${extraInfo} -i mailingName
${G_myName} ${extraInfo} -i mailingDoc
$( examplesSeperatorChapter "Local Results Release" )
${G_myName} ${extraInfo} -i bodyPartsRefresh
${G_myName} ${extraInfo} -p pdf=pdf -i bodyPartsRefresh
$( examplesSeperatorChapter "Initial Setups" )
${G_myName} ${extraInfo} -i resultsRelease
${G_myName} ${extraInfo} -i buildResultsRelease
$( examplesSeperatorChapter "Presentation / Disposition Processing" )
./presProc.sh
---- EnFa - lcntProc.sh -- Initial Templates Development ----
diff ./lcntProc.sh  /bisos/apps/defaults/mailing/compose/enFa/generic/lcntProc.sh
cp  ./lcntProc.sh  /bisos/apps/defaults/mailing/compose/enFa/generic/lcntProc.sh
cp  /bisos/apps/defaults/mailing/compose/enFa/generic/lcntProc.sh ./lcntProc.sh
---- EnFa - Panel.org -- Initial Templates Development ----
diff ./Panel.org  /bisos/apps/defaults/mailing/compose/enFa/generic/Panel.org
cp  ./Panel.org  /bisos/apps/defaults/mailing/compose/enFa/generic/Panel.org
cp  /bisos/apps/defaults/mailing/compose/enFa/generic/Panel.org ./Panel.org
---- EnFa - mailing.ttytex -- Initial Templates Development ----
diff ./mailing.ttytex  /bisos/apps/defaults/mailing/compose/enFa/generic/mailing.ttytex
cp  ./mailing.ttytex  /bisos/apps/defaults/mailing/compose/enFa/generic/mailing.ttytex
cp  /bisos/apps/defaults/mailing/compose/enFa/generic/mailing.ttytex ./mailing.ttytex
---- FaEn - lcntProc.sh -- Initial Templates Development ----
diff ./lcntProc.sh  /bisos/apps/defaults/mailing/compose/faEn/generic/lcntProc.sh
cp  ./lcntProc.sh  /bisos/apps/defaults/mailing/compose/faEn/generic/lcntProc.sh
cp  /bisos/apps/defaults/mailing/compose/faEn/generic/lcntProc.sh ./lcntProc.sh
---- FaEn - Panel.org -- Initial Templates Development ----
diff ./Panel.org  /bisos/apps/defaults/mailing/compose/faEn/generic/Panel.org
cp  ./Panel.org  /bisos/apps/defaults/mailing/compose/faEn/generic/Panel.org
cp  /bisos/apps/defaults/mailing/compose/faEn/generic/Panel.org ./Panel.org
---- FaEn - mailing.ttytex -- Initial Templates Development ----
diff ./mailing.ttytex  /bisos/apps/defaults/mailing/compose/faEn/generic/mailing.ttytex
cp  ./mailing.ttytex  /bisos/apps/defaults/mailing/compose/faEn/generic/mailing.ttytex
cp  /bisos/apps/defaults/mailing/compose/faEn/generic/mailing.ttytex ./mailing.ttytex
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

function vis_mailingName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local mailingFileName="./content.mail"

    local mailingName="unspecifiedMailingName"
    
    if [ ! -f "${mailingFileName}" ] ; then
	EH_problem "Missing mailingName"
    else
	mailingName=$( egrep '^X-MailingName:' content.mail | cut -d : -f 2 )
    fi

    if [ -z "${mailingName}" ] ; then
	EH_problem "Missing X-MailingName"
    fi

    echo ${mailingName}
}

function vis_mailingDoc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local mailingFileName="./content.mail"

    local mailingDoc="unspecifiedMailingName"
    
    if [ ! -f "${mailingFileName}" ] ; then
	EH_problem "Missing mailingName"
    else
	mailingDoc=$( egrep '^X-MailingDoc:' content.mail | cut -d : -f 2 )
    fi

    if [ -z "${mailingDoc}" ] ; then
	EH_problem "Missing X-MailingDoc: -- X-MailingName used instead"
	mailingDoc=$( vis_mailingName )
    fi
    
    echo ${mailingDoc}
}


function vis_bodyPartsRefresh {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local mailingFileName="./content.mail"

    if [ ! -f "${mailingFileName}" ] ; then
	EH_problem "Missing ${mailingFileName}"
	lpReturn 101
    fi

    local mailingDoc=$( vis_mailingDoc )
    local dateTag=$( date +%y%m%d%H%M%S )
    local savedMailingFileName=${mailingFileName}.${dateTag}

    lpDo mv ${mailingFileName} ${savedMailingFileName}

    lpDo eval "sed '/--text follows this line--/q' ${savedMailingFileName} > ${mailingFileName}"

    lpDo rm ${savedMailingFileName}

    cat  << _EOF_ >> ${mailingFileName}
<#part type="text/html" disposition=inline>
<!--  [[elisp:(find-file "./mailing.ttytex")][Visit ./mailing.ttytex]]  | [[elisp:(message-mode)][message-mode]] | [[elisp:(mcdt:setup-and-compose/with-curBuffer)][Compose]]  | [[elisp:(mcdt:setup-and-originate/with-curBuffer)][Originate]] -->
<!-- ####+BEGIN: bx:dblock:global:file-insert-process :file "./rel/mailing-html/index.html" :load "./dblockProcess.el" :exec "bx:dblock:body-process"
-->
<!-- ####+END: -->
<#/part>
_EOF_

    if [ "${pdf}" == "pdf" ] ; then
	cat  << _EOF_ >> ${mailingFileName}
<#part type="application/pdf" filename="./rel/${mailingDoc}.pdf" disposition=attachment description="Pdf File">
<#/part>
_EOF_
    fi
    
}



function vis_resultsRelease {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local mailingDoc=$( vis_mailingDoc )

    if [ ! -d ./rel ] ; then
	opDo mkdir -p ./rel
    fi

    opDo cp ./mailing.pdf  ./rel/${mailingDoc}.pdf
    
    opDo mkdir -p ./rel/mailing-html   
    opDo cp -r -p ./heveaHtml-mailing/*  ./rel/mailing-html

    opDo elispFilterHtml.sh -v -n showRun  -i deTitleCompletely ./rel/mailing-html/index.html

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


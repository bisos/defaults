#!/bin/bash

IimBriefDescription="mmUniteAudio.sh based on seedAudioPresProc.sh"

ORIGIN="
* Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
typeset RcsId="$Id: mmUniteAudio.sh,v 1.2 2018-01-17 01:40:06 lsipusr Exp $"
__copyLeft__="
* Copyleft:  This is a Halaal Poly-Existential. See http://www.freeprotocols.org
"
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

####+BEGIN: bx:bisos:bash:seed-spec :types "/bisos/core/lcnt/bin/seedAudioProc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/lcnt/bin/seedAudioProc.sh]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/defaults/begin/templates/purposed/lcnt/bash/mmUniteAudio.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/lcnt/bin/seedAudioProc.sh -l $0 "$@"
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
  return
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Extension Examples
_CommentEnd_

function examplesHookPost {
    cat  << _EOF_
$( examplesSeperatorTopLabel "EXTENSION EXAMPLES" )
${G_myName} ${extraInfo} -i describeUsage | emlVisit
${G_myName} ${extraInfo} -i frameNamesPrepare
${G_myName} ${extraInfo} -i frameRecordCmnd
${G_myName} ${extraInfo} -i framePlayCmnd
${G_myName} ${extraInfo} -i frameToMp3Length
${G_myName} ${extraInfo} -i fullClean
${G_myName} ${extraInfo} -i fullUpdate
${G_myName} ${extraInfo} -i formatVerify *.wav 2>&1 | sort
$( examplesSeperatorSection "Fireup Presentation Console and Voice Recorder" )
pdfpc -S presentationEnFa.pdf  # One Screen
$( examplesSeperatorSection "Initial Templates Development" )
diff ./mmUniteAudio.sh /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUniteAudio.sh
cp ./mmUniteAudio.sh /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUniteAudio.sh
cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUniteAudio.sh ./mmUniteAudio.sh
_EOF_
}

iimBeamerImpressiveEmacs="/de/bx/nne/dev-py/bin/iimBeamerImpressiveEmacs.py"

function vis_frameNamesPrepare {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset tmpWavFile="./${G_myName}_$$.wav"

    opDo vis_silenceGenWav 1 ${tmpWavFile}

    typeset filesList=$( inBaseDirDo .. ${iimBeamerImpressiveEmacs} -v 30 -i frameNamesList ./presentationEnFa.pdf 2> /dev/null | grep -v defaultParams )

    for thisLine in ${filesList} ; do    
	if [ ! -f ${thisLine}.wav ] ; then
	    #opDo touch ${thisLine}.wav
	    opDo cp ${tmpWavFile} ${thisLine}.wav
	fi
    done

    opDo /bin/rm ${tmpWavFile}
    
    lpReturn
}

function vis_frameRecordCmnd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -le 1 ]]

    typeset filesList=$( inBaseDirDo .. ${iimBeamerImpressiveEmacs} -v 30 -i frameNamesList ./presentationEnFa.pdf 2> /dev/null | grep -v defaultParams )

    for thisLine in ${filesList} ; do
	if [ $# -eq 0 ] ; then
	    echo audacity ${thisLine}.wav
	else
	    echo '[['elisp:\(lsip-local-run-command \"audacity ${thisLine}.wav\"\)']['audacity ${thisLine}.wav']]'
	fi
    done

    lpReturn
}

function vis_framePlayCmnd {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo .. ${iimBeamerImpressiveEmacs} -v 30 -i frameNamesList ./presentationEnFa.pdf 2> /dev/null | grep -v defaultParams | 
    while read thisLine ; do
	echo mplayer ${thisLine}.wav
	# cvlc --play-and-stop --play-and-exit ./screenCastExample.wav 
    done

    lpReturn
}

function vis_frameToMp3Length {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset filesList=$( inBaseDirDo .. ${iimBeamerImpressiveEmacs} -v 30 -i frameNamesList ./presentationEnFa.pdf 2> /dev/null | grep -v defaultParams | sort | uniq )

    for thisLine in ${filesList} ; do
	if [ -s "${thisLine}.wav" ] ; then
	    opDo avconv -y -i "${thisLine}.wav" "${thisLine}.mp3"
	    typeset audioLength=$(opDo eval lcaAudioManage.sh -i mp3LengthMilliSeconds ${thisLine}.mp3)
	    opDo fileParamManage.py -v 30  -i fileParamWritePath ./${thisLine}.length  ${audioLength}
	else
	    EH_problem "Missing ${thisLine}.wav -- Conversion and Length Skipped"
	fi
    done

    lpReturn
}



function vis_frameToMp3LengthOld {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo .. ${iimBeamerImpressiveEmacs} -v 30 -i frameNamesList ./presentationEnFa.pdf 2> /dev/null | grep -v defaultParams | sort | uniq |
    while read thisLine ; do
	if [ -s "${thisLine}.wav" ] ; then
	    opDo echo avconv -y -i "${thisLine}.wav" "${thisLine}.mp3"
	    #typeset audioLength=$(opDo eval lcaAudioManage.sh -i mp3LengthMilliSeconds ${thisLine}.mp3)
	    #opDo fileParamManage.py -v 30  -i fileParamWritePath ./${thisLine}.length  ${audioLength}
	else
	    EH_problem "Missing ${thisLine}.wav -- Conversion and Length Skipped"
	fi
    done

    lpReturn
}


function vis_formatVerify  {
    function describeF {  cat  << _EOF_
_EOF_
    }

    function procOne {
	EH_assert [[ $# -eq 1 ]]
	if [ ! -f "$1" ] ; then
	    ANT_raw "Missing File: $1"
	    lpReturn
	fi
	if [ ! -s "$1" ] ; then
	    ANT_raw "Empty File: $1"
	    lpReturn
	fi

	typeset samplingRate=$(soxi -r "$1")

	if [ "${samplingRate}" != 48000 ] ; then
	    ANT_raw "Bad Sampling Rate: $1 -- ${samplingRate}"
	else
	    ANT_raw "Verified: $1"
	fi
    }

    # NOTYET, Common Pattern, 
    # Put it in a library or make it be dblock or both
    if [ $# -gt 0 ] ; then
	typeset thisOne=""
	for thisOne in ${@} ; do
	    procOne ${thisOne}
	done
    else
	typeset thisLine=""
	while read thisLine ; do
	    if [ "${thisLine}" != "" ] ; then
		procOne ${thisLine}
	    fi
	done
    fi

    lpReturn
}


function vis_fullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo FN_fileRmIfThere *.mp3
    opDo FN_dirDeleteIfThere *.length

    lpReturn
}

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_frameNamesPrepare
    
    opDo vis_fullGens

    lpReturn
}


function vis_fullGens {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_frameToMp3Length

    lpReturn
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


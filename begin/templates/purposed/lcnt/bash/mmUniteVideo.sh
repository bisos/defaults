#!/bin/bash

IimBriefDescription="mmUniteAudio.sh based on seedAudioPresProc.sh"

ORIGIN="
* Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
typeset RcsId="$Id: mmUniteVideo.sh,v 1.2 2018-01-24 06:58:31 lsipusr Exp $"
__copyLeft__="
* Copyleft:  This is a Halaal Poly-Existential. See http://www.freeprotocols.org
"
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedAudioProc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedAudioProc.sh]] | 
"
FILE="
*  /This File/ :: /bisos/apps/defaults/lcnt/dispositions/mmUniteAudio.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedAudioProc.sh -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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
    local oneMasterFile=$( vis_masterVideoFilesListGet | head -1 )
    
    cat  << _EOF_
$( examplesSeperatorTopLabel "EXTENSION EXAMPLES" )
${G_myName} ${extraInfo} -i describeUsage | emlVisit
${G_myName} ${extraInfo} -i fullClean
${G_myName} ${extraInfo} -i fullUpdate
$( examplesSeperatorSection "Video Recordings Full Preparations" )
${G_myName} ${extraInfo} -i recordingsPrepClean
${G_myName} ${extraInfo} -i recordingsPrepUpdate
$( examplesSeperatorSection "Video Recordings Preparations -- screenstudio" )
screenstudioWebClientIcm.py
screenstudioWebClientIcm.py -i nuOfDisplaysGet
screenstudioWebClientIcm.py -v 20 --sessionType="liveSession"  -i screenstudioRcUpdate 
screenstudioWebClientIcm.py -v 20 --sessionType="narratedSession"  -i screenstudioRcUpdate 
screenstudioWebClientIcm.py -v 20 --sessionType="liveSession" --nuOfDisplays="3"  -i screenstudioRcStdout 
screenstudioWebClientIcm.py -v 20 --sessionType="narratedSession" --nuOfDisplays="3"  -i screenstudioRcStdout 
screenstudioWebClientIcm.py -v 20  -i screenstudioRun 
screenstudioWebClientIcm.py -v 20  -i recorderIsUp http://localhost:8080
$( examplesSeperatorSection "Video Recordings Start/Stop" )
http://localhost:8080
screenstudioWebClientIcm.py -v 20  -i recordingStart http://localhost:8080
screenstudioWebClientIcm.py -v 20  -i recordingStop http://localhost:8080
$( examplesSeperatorSection "Convert Master Video Files" )
${G_myName} ${extraInfo} -i masterVideoFilesListGet
${G_myName} ${extraInfo} -i avConvertTo144 ${oneMasterFile}
${G_myName} ${extraInfo} -i avConvertTo360 ${oneMasterFile}
${G_myName} ${extraInfo} -i avConvertTo720 ${oneMasterFile}
${G_myName} ${extraInfo} -i avConvertTo1080 ${oneMasterFile}
$( examplesSeperatorSection "Initial Templates Development" )
diff ./mmUniteVideo.sh /bisos/apps/defaults/begin/templates/purposed/lcnt/bash/mmUniteVideo.sh
cp ./mmUniteVideo.sh /bisos/apps/defaults/begin/templates/purposed/lcnt/bash/mmUniteVideo.sh
cp /bisos/apps/defaults/begin/templates/purposed/lcnt/bash/mmUniteVideo.sh ./mmUniteVideo.sh 
_EOF_
}


function vis_unMasterFileName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    echo ${1#master-}
    
    lpReturn
}


function vis_masterVideoFilesListGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset inFileName="$1"

    local filesList=$( ls master-*.mp4 )

    for each in ${filesList} ; do
	echo ${each}
    done

    lpReturn
}


function vis_avConvertToAll {
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
		       }

    function processEach {
	EH_assert [[ $# -eq 1 ]]
	local each="$1"

	opDo vis_avConvertTo144 ${each}
	opDo vis_avConvertTo360 ${each}
	opDo vis_avConvertTo720 ${each}
	opDo vis_avConvertTo1080 ${each}			
    }

    if [ $# -gt 0 ] ; then
	typeset thisOne=""
	for thisOne in ${@} ; do
	    opDo processEach ${thisOne}
	done
    else
	typeset thisLine=""
    
	while read thisLine ; do
	    if [ "${thisLine}" != "" ] ; then
		opDo processEach ${thisLine}
	    fi
	done
    fi

    lpReturn
}



function vis_avConvertTo144 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local inFileName="$1"
    local fileName=$(vis_unMasterFileName ${inFileName})
    local thisPrefix=$( FN_prefix ${fileName} )
    local thisExtension=$( FN_extension ${fileName} )

    opDo ffmpeg -i ${inFileName} -s 256x144 -c:v libx264 -crf 23 -c:a aac -strict -2 ${thisPrefix}-144.mp4

    lpReturn
}


function vis_avConvertTo360 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    
    local inFileName="$1"
    local fileName=$(vis_unMasterFileName ${inFileName})
    local thisPrefix=$( FN_prefix ${fileName} )
    local thisExtension=$( FN_extension ${fileName} )

    opDo ffmpeg -i ${inFileName} -s 640x360 -c:v libx264 -crf 23 -c:a aac -strict -2 ${thisPrefix}-360.mp4

    lpReturn
}



function vis_avConvertTo720 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local inFileName="$1"
    local fileName=$(vis_unMasterFileName ${inFileName})
    local thisPrefix=$( FN_prefix ${fileName} )
    local thisExtension=$( FN_extension ${fileName} )

    opDo ffmpeg -i ${inFileName} -s hd720 -c:v libx264 -crf 23 -c:a aac -strict -2 ${thisPrefix}-720.mp4

    lpReturn
}


function vis_avConvertTo1080 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local inFileName="$1"
    local fileName=$(vis_unMasterFileName ${inFileName})
    local thisPrefix=$( FN_prefix ${fileName} )
    local thisExtension=$( FN_extension ${fileName} )

    opDo cp ${inFileName} ${thisPrefix}-1080.mp4

    lpReturn
}


function vis_fullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo FN_fileRmIfThere *-144.mp4
    opDo FN_fileRmIfThere *-360.mp4
    opDo FN_fileRmIfThere *-720.mp4
    opDo FN_fileRmIfThere *-1080.mp4

    opDo vis_recordingsPrepClean    

    lpReturn
}

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo vis_fullGens

    opDo vis_recordingsPrepUpdate

    lpReturn
}


function vis_fullGens {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local filesList=$( vis_masterVideoFilesListGet )

    if [ -z ${filesList} ] ; then
	ANT_raw "No Master Files To Process -- Skipped"
    else
	opDo vis_avConvertToAll ${filesList}
    fi

    lpReturn
}

function vis_recordingsPrepClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo FN_fileRmIfThere screenstudio-*
    
    lpReturn
}


function vis_recordingsPrepUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    opDo screenstudioWebClientIcm.py --sessionType="liveSession"  --nuOfDisplays=1 -i screenstudioRcUpdate 
    opDo screenstudioWebClientIcm.py --sessionType="narratedSession"  --nuOfDisplays=1 -i screenstudioRcUpdate 
    opDo screenstudioWebClientIcm.py --sessionType="liveSession" --nuOfDisplays=3  -i screenstudioRcUpdate 
    opDo screenstudioWebClientIcm.py --sessionType="narratedSession" --nuOfDisplays=3  -i screenstudioRcUpdate

    opDo ls -l screenstudio-*
    
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


#!/bin/bash

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+minimal"
# {{{ DBLOCK-top-of-file
typeset RcsId="$Id: ocrProc.sh,v 1.1 2016-11-25 05:45:02 lsipusr Exp $"
#  This is a Halaal Poly-Existential. See http://www.freeprotocols.org
# }}} DBLOCK-top-of-file
####+END:


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedBueGenericProc.sh"
# {{{ DBLOCK-seed-spec
if [ "${loadFiles}X" == "X" ] ; then
    /opt/public/osmt/bin/seedBueGenericProc.sh -l $0 "$@" 
    exit $?
fi
# }}} DBLOCK-seed-spec
####+END:

leavesExcludes=""

leavesOrdered=""

nodesExcludes=""

nodesOrdered=""

####+BEGIN: bx:dblock:ploneProc:bash:leavesList :types ""
# {{{ DBLOCK-leavesList
leavesList="
"
# }}} DBLOCK-leavesList
####+END:

####+BEGIN: bx:dblock:ploneProc:bash:nodesList :types ""
# {{{ DBLOCK-nodesList
nodesList="
"
# }}} DBLOCK-nodesList
####+END:

# {{{ EXTRAs

function vis_description {
cat  << _EOF_
*   *HOW TO SCAN and REPUBLISH A BOOK*
** Create a base directory for publication scan and pdf publication
*** Say /lcnt/lgpc/mohsen/repub/politics/iran/gharbzadegi
** The Scan Process
*** Create a rawScan directory xxx/600dpi
*** Scan the book at 600dpi
** Publication Of Scanned Images (None OCR)
*** Batch rotate the pages (-i inListRotate90)
*** Re-Generate 600dpi.pdf with sane
*** Create xxx/150dpi directory
*** Reduce Sampling from 600dpi to 150dpi (-i inListResize 25% DestFolder)
*** Re-Generate 150dpi.pdf with sane
*** Publish the pdf file.
** Automated OCR Conversion
*** Create ./textOcr
*** Edit ocrProc.sh
*** Create the inList
*** Convert To Text
*** batch process (dashes blank lines)
*** Copy For Editining
** Human Editing
*** Create ./textOcrEdited
** LaTeX Process
_EOF_
}


startsBaseDir="/acct/employee/lsipusr/BUE/inserts/moded/sh-mode/startBase"

herePath=$( pwd )

function examplesHookPost {
    
    typeset oneImageFile=$( head -1 ./inFilesList.pnm )
cat  << _EOF_
--- EXTRAs ---
====== GENERAL =======
--- (1) Create ./inFilesList.pnm
${G_myName} ${extraInfo} -i inFilesListGen $( pwd )  pnm   # sorted .pnm files list
${G_myName} ${extraInfo} -i inFilesListGen txt   # 
lcnFileParamsAdmin.sh -i absoluteFilesListStdout ./galleriaPhotoSample.jpg > ./inFilesList.jpg
====== Image Publication (None OCR) =======
--- (1) Create ./inFilesList  (See GENERAL)
--- (2) Rotate 90 degrees If Needed
cat ./inFilesList.pnm | ${G_myName} ${extraInfo} -i inListRotate90
--- (3) Reduce Sampling (reduce dpi)
cat ./inFilesList.pnm | ${G_myName} ${extraInfo} -i inListResize "25%" ../150dpi
cat ./inFilesList.pnm | ${G_myName} ${extraInfo} -i inListResize "16%" ../100dpi
--- (4) Create pdf file with xsane -- NOTYET to be tested
cd ../100dpi; /opt/public/osmt/bin/pnms2pdf.sh ../100dpi/xsane-multipage-list
--- (5) Publish the pdf file
====== OCR -- Image To Text Conversion =======
--- (1) Create ./inFilesList  (See GENERAL)
--- (2) Specifiy The Language
echo "fra" > fv_Language
echo "eng" > fv_Language
--- (3) Pass All The Files Through  OCR
cat ./inFilesList | ${G_myName} ${extraInfo} -i inListOcrImageProc
echo test7.jpg | ${G_myName} ${extraInfo} -i inListOcrImageProc
====== Raw Text Automated Conversions =======
---  Identify and Origanize Text 
${G_myName} ${extraInfo} -i languageIdentify   ./image-0003-ocr.txt # If not a known language, then perhaps image to be ignored
${G_myName} ${extraInfo} -i languageIdentify   ./image-0007-ocr.txt
${G_myName} ${extraInfo} -i inFilesListGen txt  > ./romanPageNu.inList
${G_myName} ${extraInfo} -i inFilesListGen txt  > ./bodyPageNu.inList
${G_myName} ${extraInfo} -i inFilesListGen txt  > ./unUsedPageNu.inList
${G_myName} ${extraInfo} -i inFilesListGen txt  > ./frontCover.inList
${G_myName} ${extraInfo} -i inFilesListGen txt  > ./backCover.inList
---  Rename PageNumbered TeX Files
cat ./romanPageNu.inList | ${G_myName} ${extraInfo} -i inListOrderedRename 1 preface tex
cat ./bodyPageNu.inList  | ${G_myName} ${extraInfo} -i inListOrderedRename 1 body tex
---  Create TeX PageNu inList Files
find . -type f -print | egrep 'preface-.*\.tex' | sort -V > texPrefacePageNu.inList
find . -type f -print | egrep 'body-.*\.tex' | sort -V > texBodyPageNu.inList
---  Auto Process  TeX PageNu inList Files ---
cat ./texPrefacePageNu.inList | ${G_myName} ${extraInfo} -i inListOcrTextCommonProc
cat ./texBodyPageNu.inList | ${G_myName} ${extraInfo} -i inListOcrTextCommonProc
echo ./body-32.tex | ${G_myName} ${extraInfo} -i inListOcrTextCommonProc
---  Auto Process One TeX PageNu ---
${G_myName} ${extraInfo} -i ocrTextCommonProc ./body-32.tex ./body-32.proced
elispRun.sh ${extraInfo} -p el="${elispScriptFile}" -p exec=main -p inFile="${inFileName}" -p outFile="${outFileName}" -i emacs
====== Export Auto-Processed For Editing =======
echo *.proced | ${G_myName} ${extraInfo} -i inListExportProcessedToEdit ../edited
cat ./texBodyPageNu.inList | ${G_myName} ${extraInfo} -i inListExportProcessedToEdit ../edited
====== Full Update =======
${G_myName} ${extraInfo}  -i fullUpdate   # RawText Processes and Exports -- assumes {roman,body}PageNu.inList
${G_myName} ${extraInfo}  -i fromScratchUpdate fra
${G_myName} ${extraInfo}  -i exportToEditedUpdate
====== Tree Recurse ======
find  . -type f -print | egrep 'ocrProc.sh$' | bx-dblock -h -v -n showRun -i dblockUpdateFiles
${G_myName} ${extraInfo}  -i treeRecurse startObjectUpdateUnder
${G_myName} ${extraInfo}  -i treeRecurse fullUpdate
${G_myName} ${extraInfo}  -i treeRecurse fromScratchUpdate eng
${G_myName} ${extraInfo}  -i treeRecurse fromScratchUpdate fra
${G_myName} ${extraInfo}  -i treeRecurse exportToEditedUpdate
${G_myName} ${extraInfo}  -i treeRecurse cleanFull
${G_myName} ${extraInfo}  -i treeRecurse cleanDist
====== CLEANING  =======
${G_myName} ${extraInfo}  -i cleanFull
${G_myName} ${extraInfo}  -i cleanDist
====== Template Start =======
${G_myName} ${extraInfo}  -i underBaseRunCommand . pwd
${G_myName} ${extraInfo}  -i underBaseRunCommand . vis_startObjectUpdateInCwd
${G_myName} ${extraInfo}  -i startObjectUpdateUnder
${G_myName} ${extraInfo}  -i startObjectUpdateInCwd
${G_myName} ${extraInfo}  -i startLeaf
${G_myName} ${extraInfo}  -i startNode
====== Template Syncronization =======
diff ./ocrProc.sh  ${startsBaseDir}/ocrProc.sh
cp   ./ocrProc.sh  ${startsBaseDir}/ocrProc.sh 
cp   ${startsBaseDir}/ocrProc.sh  ./ocrProc.sh  
_EOF_
     return
}

function vis_inFilesListGen {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset baseDir=$1
    typeset fileExtension=$2

    if [ -f ./inFilesList.${fileExtension} ] ; then
	ANT_cooked "./inFilesList.${fileExtension} In Place, inFilesListGen Skipped"
    else
	relativeFilesList=$( find ${baseDir} -print | egrep -i '\.'${fileExtension}'$' )
	#opDo lcnFileParamsAdmin.sh -i absoluteFilesListStdout ./*.jpg > ./inFilesList
	if [ -z "${relativeFilesList}" ] ; then
	    EH_problem "Empty relativeFilesList"
	    lpReturn 101
	fi
	opDo lcnFileParamsAdmin.sh -i absoluteFilesListStdout ${relativeFilesList} | sort > ./inFilesList.${fileExtension}
	opDo ls -l  ./inFilesList.${fileExtension}
    fi

    lpReturn
}



function vis_inListRotate90 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
See also: convert -rotate 90 -- mogrify -rotate 90 
See also: /opt/public/osmt/share/gimp/scripts/rotate-img.scm 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

    if [ "${inFilesList}_" == "_" ] ; then
	ANT_raw "No Files To Process"
	lpReturn 101
    fi

    for thisFile in ${inFilesList}; do

	if [ ! -f "${thisFile}" ] ; then
	    EH_problem "Missing ${thisFile} -- Skipped"
	    continue
	fi

	opDo mogrify -rotate 90 ${thisFile}

    done
}


function vis_inListResize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
See also: convert -rotate 90 -- mogrify -rotate 90 
See also: /opt/public/osmt/share/gimp/scripts/rotate-img.scm 
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset resizeFactor=$1
    typeset destDirBase=$( FN_absolutePathGet $2 )

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

    if [ "${inFilesList}_" == "_" ] ; then
	ANT_raw "No Files To Process"
	lpReturn 101
    fi

    if [ ! -d "${destDirBase}" ] ; then
	opDo mkdir -p "${destDirBase}"
    fi


    for thisFile in ${inFilesList}; do

	if [ ! -f "${thisFile}" ] ; then
	    EH_problem "Missing ${thisFile} -- Skipped"
	    continue
	fi

	typeset thisNonDirsPart=$( FN_nonDirsPart "${thisFile}" )

	opDo convert -resize "${resizeFactor}" "${thisFile}" "${destDirBase}"/"${thisNonDirsPart}"

    done

    if [ -f ./xsane-multipage-list ] ; then
	FN_fileSafeKeep "${destDirBase}"/xsane-multipage-list
	cp ./xsane-multipage-list "${destDirBase}"/xsane-multipage-list
    fi

}



function vis_inListOcrImageProc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

    if [ "${inFilesList}_" == "_" ] ; then
	ANT_raw "No Files To Process"
	lpReturn 101
    fi

    typeset fv_Language

    if [ -f ./fv_Language ] ; then
	fv_Language=$( cat ./fv_Language  )
    else
	EH_problem "Missing ./fv_Language  -- fv_Language=eng"
	fv_Language="eng"
    fi

    for thisFile in ${inFilesList}; do

	if [ ! -f "${thisFile}" ] ; then
	    EH_problem "Missing ${thisFile} -- Skipped"
	    continue
	fi

	typeset thisPrefix=$( FN_prefix ${thisFile} )
	typeset thisExtension=$( FN_extension ${thisFile} )
	typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
	typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )

	#echo ${thisPrefix} ${thisExtension} ${thisDirsPart} ${thisNonDirsPart}

	typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}
	#typeset ocrFileName="${thisPathPrefix}-ocr"
	typeset ocrFileName=./"${thisPrefix}-ocr"

	opDo tesseract  "${thisPathPrefix}.${thisExtension}" "${ocrFileName}" -l ${fv_Language}

    done
}


function vis_languageIdentify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
langident comes from apt-get install liblingua-identify-perl
size can be determined with -- stat --printf="%s" file.any
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset inFileName=$1

    if [ ! -f "${inFileName}" ] ; then
	EH_problem "Missing ${inFileName} -- Skipped"
	lpReturn 101
    fi

    typeset fv_Language

    if [ -f ./fv_Language ] ; then
	fv_Language=$( cat ./fv_Language  )
    else
	EH_problem "Missing ./fv_Language  -- fv_Language=eng"
	fv_Language="eng"
    fi

    if [ "${fv_Language}" == "eng" ] ; then
	langCode2Letter="en"
    elif [ "${fv_Language}" == "fra" ] ; then
	langCode2Letter="fr"
    else
	EH_problem "UnSupported Language"
	lpReturn 101
    fi

    opDo  langident -o ${langCode2Letter} ${inFileName}

    typeset fileLang=$( langident -o ${langCode2Letter} ${inFileName}  2> /dev/null | cut -d ':' -f 2 )

    if [ "${fileLang}" != "${langCode2Letter}" ] ; then
	ANT_raw "Other Than Language=${langCode2Letter}: ${inFileName}"
	lpReturn 1
    fi

    lpReturn 0
}


function vis_inListOrderedRename {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]

    startPage=$1
    resultPrefix=$2
    resultExtension=$3

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

    if [ "${inFilesList}_" == "_" ] ; then
	ANT_raw "No Files To Process"
	lpReturn 101
    fi

    (( pageNu=${startPage} ))

    for thisFile in ${inFilesList}; do

	if [ ! -f "${thisFile}" ] ; then
	    EH_problem "Missing ${thisFile} -- Skipped"
	    continue
	fi


	if vis_languageIdentify ${thisFile} ; then
	    function originalOcrResultPointer {  
		cat  << _EOF_
%
% Tagged By ${G_myFullName}::vis_inListOrderedRename:originalOcrResultPointer
%
% (find-file "${thisFile}")
% (insert-file "${thisFile}")
% __END_OF_TAG__
%
_EOF_
	    }

	    opDo eval originalOcrResultPointer \> ${resultPrefix}-${pageNu}.${resultExtension}
	    opDo eval cat ${thisFile} \>\>  ${resultPrefix}-${pageNu}.${resultExtension}
	else
	    function likelyNotText {  
		cat  << _EOF_
%
% Machine Generated By ${G_myFullName}:vis_inListOrderedRename:likelyNotText
%
% This page was likely not text. 
% (find-file "${thisFile}")
% (insert-file "${thisFile}")
%
_EOF_
	    }

	    opDo eval likelyNotText \> ${resultPrefix}-${pageNu}.${resultExtension}
	fi	    

	(( pageNu++ ))
    done
}


function vis_inListOcrTextCommonProc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

    if [ "${inFilesList}_" == "_" ] ; then
	ANT_raw "No Files To Process"
	lpReturn 101
    fi

    for thisFile in ${inFilesList}; do

	if [ ! -f "${thisFile}" ] ; then
	    EH_problem "Missing ${thisFile} -- Skipped"
	    continue
	fi

	typeset thisPrefix=$( FN_prefix ${thisFile} )
	typeset thisExtension=$( FN_extension ${thisFile} )
	typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
	typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )
	typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

	#echo ${thisPrefix} ${thisExtension} ${thisDirsPart} ${thisNonDirsPart}

	opDo vis_ocrTextCommonProc ${thisFile} ${thisDirsPart}/${thisPrefix}.proced

    done
}


function vis_ocrTextCommonProc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset inFileName=$( FN_absolutePathGet $1 )
    typeset outFileName=$( FN_absolutePathGet $2 )

    elispScriptFile=$( FN_absolutePathGet "/opt/public/osmt/bin/elispFilterOcr.el" )

    FN_fileRmIfThere ${outFileName}

    opDo elispRun.sh -v -n showRun  ${extraInfo} -p el="${elispScriptFile}" -p exec=main -p inFile="${inFileName}" -p outFile="${outFileName}" -i emacs

    lpReturn
}

#
#====== Export Auto Processed For Editing =======
#

#echo *.proced | ${G_myName} ${extraInfo} -i inListExportProcessedToEdit ../gharbzadegiTextOcrEdited

function vis_inListExportProcessedToEdit {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset exportBaseDir=$( FN_absolutePathGet $1 )

    filesLines=$( cat )
    inFilesList=$( echo ${filesLines} )

    if [ "${inFilesList}_" == "_" ] ; then
	ANT_raw "No Files To Process"
	lpReturn 101
    fi

    if [ ! -d "${exportBaseDir}" ] ; then
	opDo mkdir ${exportBaseDir}
    fi

    typeset thisFile

    for thisFile in ${inFilesList}; do
	
	thisFile=$( FN_absolutePathGet ${thisFile} )

	if [ ! -f "${thisFile}" ] ; then
	    EH_problem "Missing ${thisFile} -- Skipped"
	    continue
	fi

	typeset thisPrefix=$( FN_prefix ${thisFile} )
	typeset thisExtension=$( FN_extension ${thisFile} )
	typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
	typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )
	typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

	FN_fileSafeKeep ${exportBaseDir}/${thisPrefix}.tex

	opDo cp ${thisFile} ${exportBaseDir}/${thisPrefix}.tex
    done

    lpReturn
}

#
#====== Full Updates =======
#

function vis_fullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
RawText Processes and Exports -- assumes {roman,body}PageNu.inList
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset thisFunc=${G_thisFunc}

    if vis_nodeTherePredicate . ; then
	ANT_raw "${G_myName}:${thisFunc}:  Node -- Skipped Processing"
	lpReturn 0
    fi

    if [ ! -f ./romanPageNu.inList ] ; then
	EH_problem "Missing ./romanPageNu.inList"
	lpReturn 101
    fi

    if [ ! -f ./bodyPageNu.inList ] ; then
	EH_problem "Missing ./bodyPageNu.inList"
	lpReturn 101
    fi

    #---  Rename PageNumbered TeX Files
    opDo eval cat ./romanPageNu.inList \| ocrProc.sh -v -n showRun -i inListOrderedRename 1 preface tex
    opDo eval cat ./bodyPageNu.inList  \| ocrProc.sh -v -n showRun -i inListOrderedRename 1 body tex

    #---  Create TeX PageNu inList Files
    opDo eval find . -type f -print \| egrep 'preface-.*\.tex' \| sort -V \> texPrefacePageNu.inList
    opDo eval find . -type f -print \| egrep 'body-.*\.tex' \| sort -V \> texBodyPageNu.inList

    #---  Auto Process  TeX PageNu inList Files ---
    opDo eval cat ./texPrefacePageNu.inList \| ocrProc.sh -v -n showRun -i inListOcrTextCommonProc
    opDo eval cat ./texBodyPageNu.inList \| ocrProc.sh -v -n showRun -i inListOcrTextCommonProc

    lpReturn
}



function vis_fromScratchUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    typeset thisLang=$1

    typeset thisFunc=${G_thisFunc}

    if vis_nodeTherePredicate . ; then
	ANT_raw "${G_myName}:${thisFunc}:  Node -- Skipped Processing"
	lpReturn 0
    fi

    opDo eval echo "${thisLang}" \> fv_Language

    opDo vis_inFilesListGen pnm    # creates ./inFilesList.pnm

    opDo eval cat ./inFilesList.pnm \| ${G_myName} ${extraInfo} -i inListOcrImageProc

    opDo vis_inFilesListGen txt    # creates ./inFilesList.txt

    opDo eval cat ./inFilesList.txt  \| ${G_myName} -v -n showRun -i inListOrderedRename 1 body tex

    opDo eval find . -type f -print \| egrep 'body-.*\.tex' \| sort -V \> texBodyPageNu.inList

    opDo eval cat ./texBodyPageNu.inList \|  ${G_myName} -v -n showRun -i inListOcrTextCommonProc

    lpReturn
}


function vis_exportToEditedUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset thisFunc=${G_thisFunc}

    if vis_nodeTherePredicate . ; then
	ANT_raw "${G_myName}:${thisFunc}:  Node -- Skipped Processing"
	lpReturn 0
    fi

    opDo eval cat ./texBodyPageNu.inList \| vis_inListExportProcessedToEdit ../edited

    lpReturn
}


#
# Cleaning 
#

function vis_cleanFull {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]  

    typeset thisFunc=${G_thisFunc}

    if vis_nodeTherePredicate . ; then
	ANT_raw "${G_myName}:${thisFunc}:  Node -- Skipped Processing"
	lpReturn 0
    fi

    opDo eval find . -type f -print \| egrep 'preface-.*\.tex' \| sort -V \| xargs /bin/rm 
    opDo eval find . -type f -print \| egrep 'body-.*\.tex' \| sort -V \| xargs /bin/rm 

    opDo eval find . -type f -print \| egrep 'preface-.*\.proced' \| sort -V \| xargs /bin/rm 
    opDo eval find . -type f -print \| egrep 'body-.*\.proced' \| sort -V \| xargs /bin/rm 

    lpReturn
}

function vis_cleanDist {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset thisFunc=${G_thisFunc}

    if vis_nodeTherePredicate . ; then
	ANT_raw "${G_myName}:${thisFunc}:  Node -- Skipped Processing"
	lpReturn 0
    fi

    opDo vis_cleanFull

    opDo eval find . -type f -print \| egrep -- '-ocr.txt' \|  xargs /bin/rm 

    opDo FN_fileRmIfThere texBodyPageNu.inList
    opDo FN_fileRmIfThere inFilesList.pnm
    opDo FN_fileRmIfThere inFilesList.txt

    lpReturn
}

#
#====== Template Start =======
#


function vis_startLeaf {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_leafThereTag ${cwd} "ocrProc.sh"

    opDo FN_fileSafeKeep ./ocrProc.sh 

    opDo cp ${startsBaseDir}/ocrProc.sh .

    opDo bx-dblock -i dblockUpdateFiles ./ocrProc.sh

    lpReturn
}

function vis_startNode {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset cwd=$( pwd )

    vis_nodeThereTag ${cwd} "ocrProc.sh"

    opDo FN_fileSafeKeep ./ocrProc.sh 

    opDo cp ${startsBaseDir}/ocrProc.sh .

    opDo bx-dblock -i dblockUpdateFiles ./ocrProc.sh

    lpReturn
}



function vis_startObjectUpdateInCwd {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
    }

    EH_assert [[ $# -eq 0 ]]

    typeset pnmFilesList=$( find . -maxdepth 1 -type f -print |  egrep -i \.pnm$ )

    if [ -z "${pnmFilesList}" ] ; then
	# Consider it a node
	opDo vis_startNode
    else
	# Consider it a leaf
	opDo vis_startLeaf
    fi

    lpReturn
}


# }}} EXTRAs


####+BEGIN: bx:dblock:bash:end-of-file :types ""
# {{{ DBLOCK-end-of-file
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
# }}} DBLOCK-end-of-file
####+END:

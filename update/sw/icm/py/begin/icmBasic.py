#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""\
* TODO *[Summary]* :: An =ICM=: a basic starting point for developing Interactive Control Modules
"""

####+BEGIN: bx:icm:python:top-of-file :partof "bystar" :copyleft "halaal+minimal"
"""
*  This file:/de/bx/nne/dev-py/pypi/pkgs/bisos/bx-bases/dev/bin/bx-pip2.py :: [[elisp:(org-cycle)][| ]]
** is part of The Libre-Halaal ByStar Digital Ecosystem. http://www.by-star.net
** *CopyLeft*  This Software is a Libre-Halaal Poly-Existential. See http://www.freeprotocols.org
** A Python Interactively Command Module (PyICM). Part Of ByStar.
** Best Developed With COMEEGA-Emacs And Best Used With Blee-ICM-Players.
** Warning: All edits wityhin Dynamic Blocks may be lost.
"""
####+END:

"""
*  [[elisp:(org-cycle)][| *ICM-INFO:* |]] :: Author, Copyleft and Version Information
"""
####+BEGIN: bx:icm:python:name :style "fileName"
__icmName__ = "bx-pip2"
####+END:

####+BEGIN: bx:global:timestamp:version-py :style "date"
__version__ = "201712234050"
####+END:

####+BEGIN: bx:global:icm:status-py :status "Production"
__status__ = "Production"
####+END:

__credits__ = [""]

####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/update/sw/icm/py/icmInfo-mbNedaGpl.py"
icmInfo = {
    'authors':         ["[[http://mohsen.1.banan.byname.net][Mohsen Banan]]"],
    'copyright':       "Copyright 2017, [[http://www.neda.com][Neda Communications, Inc.]]",
    'licenses':        ["[[https://www.gnu.org/licenses/agpl-3.0.en.html][Affero GPL]]", "Libre-Halaal Services License", "Neda Commercial License"],
    'maintainers':     ["[[http://mohsen.1.banan.byname.net][Mohsen Banan]]",],
    'contacts':        ["[[http://mohsen.1.banan.byname.net/contact]]",],
    'partOf':          ["[[http://www.by-star.net][Libre-Halaal ByStar Digital Ecosystem]]",]
}
####+END:

####+BEGIN: bx:icm:python:topControls :partof "bystar" :copyleft "halaal+minimal"
"""
*  [[elisp:(org-cycle)][|/Controls/| ]] :: [[elisp:(org-show-subtree)][|=]] [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
"""
####+END:

####+BEGIN: bx:icm:python:section :title "ContentsList"
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *ContentsList*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:

####+BEGIN: bx:icm:python:icmItem :itemType "=Imports=" :itemTitle "*IMPORTS*"
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || =Imports=      :: *IMPORTS*  [[elisp:(org-cycle)][| ]]
"""
####+END:

import sys
import os

import collections

from unisos import ucf
from unisos import icm2 as icm

from bisos.common import bxpBaseDir


####+BEGIN: bx:icm:python:section :title "= =Framework::= ICM  Description (Overview) ="
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *= =Framework::= ICM  Description (Overview) =*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:


####+BEGIN: bx:icm:python:cmnd:classHead :modPrefix "new" :cmndName "icmOverview" :parsMand "" :parsOpt "" :argsMin "0" :argsMax "3" :asFunc "" :interactiveP ""
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || ICM-Cmnd       :: /icmOverview/ parsMand= parsOpt= argsMin=0 argsMax=3 asFunc= interactive=  [[elisp:(org-cycle)][| ]]
"""
class icmOverview(icm.Cmnd):
    cmndParamsMandatory = [ ]
    cmndParamsOptional = [ ]
    cmndArgsLen = {'Min': 0, 'Max': 3,}

    @icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
    def cmnd(self,
        interactive=False,        # Can also be called non-interactively
        argsList=None,         # or Args-Input
    ):
        cmndOutcome = self.getOpOutcome()
        if interactive:
            if not self.cmndLineValidate(outcome=cmndOutcome):
                return cmndOutcome
            effectiveArgsList = G.icmRunArgsGet().cmndArgs
        else:
            effectiveArgsList = argsList

        callParamsDict = {}
        if not icm.cmndCallParamsValidate(callParamsDict, interactive, outcome=cmndOutcome):
            return cmndOutcome
####+END:

        moduleDescription="""
*       [[elisp:(org-show-subtree)][|=]]  [[elisp:(org-cycle)][| *Description:* | ]]
**  [[elisp:(org-cycle)][| ]]  [Xref]          :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]

**  [[elisp:(org-cycle)][| ]]	Model and Terminology 					   :Overview:
*** See BISOS Documentation for ICM's model and terminology
**      [End-Of-Description]
"""
        
        moduleUsage="""
*       [[elisp:(org-show-subtree)][|=]]  [[elisp:(org-cycle)][| *Usage:* | ]]

**      How-Tos:
*** TODO Edit icmInfo to identify author, etc
*** TODO Select ICM type in g_icmChars
*** TODO Enhance g_argsExtraSpecify for your parameters
*** TODO Add your Commands
*** TODO Enhance Examples Cmnd
**      [End-Of-Usage]
"""
        
        moduleStatus="""
*       [[elisp:(org-show-subtree)][|=]]  [[elisp:(org-cycle)][| *Status:* | ]]
**  [[elisp:(org-cycle)][| ]]  [Info]          :: *[Current-Info:]* Status/Maintenance -- General TODO List [[elisp:(org-cycle)][| ]]
** TODO [[elisp:(org-cycle)][| ]]  Current         :: Just getting started [[elisp:(org-cycle)][| ]]
**      [End-Of-Status]
"""
        cmndArgsSpec = {"0&-1": ['moduleDescription', 'moduleUsage', 'moduleStatus']}
        cmndArgsValid = cmndArgsSpec["0&-1"]
        for each in effectiveArgsList:
            if each in cmndArgsValid:
                print each
                if interactive:
                    #print( str( __doc__ ) )  # This is the Summary: from the top doc-string
                    #version(interactive=True)
                    exec("""print({})""".format(each))
                
        return(format(str(__doc__)+moduleDescription))
    

####+BEGIN: bx:icm:python:section :title "= =Framework::= ICM Hooks ="
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *= =Framework::= ICM Hooks =*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:

####+BEGIN: bx:icm:python:func :funcName "g_icmChars" :comment "ICM Characteristics Spec" :funcType "FrameWrk" :retType "Void" :deco "" :argsList ""
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Func-FrameWrk  :: /g_icmChars/ =ICM Characteristics Spec= retType=Void argsList=nil  [[elisp:(org-cycle)][| ]]
"""
def g_icmChars(
):
####+END:
    icmInfo['panel'] = "{}-Panel.org".format(__icmName__)
    icmInfo['groupingType'] = "IcmGroupingType-pkged"
    icmInfo['cmndParts'] = "IcmCmndParts[common] IcmCmndParts[param]"
    
g_icmChars()


####+BEGIN: bx:icm:python:func :funcName "g_icmPreCmnds" :funcType "FrameWrk" :retType "Void" :deco "default" :argsList ""
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Func-FrameWrk  :: /g_icmPreCmnds/ retType=Void argsList=nil deco=default  [[elisp:(org-cycle)][| ]]
"""
@icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
def g_icmPreCmnds(
):
####+END:
    """ PreHook """
    pass


####+BEGIN: bx:icm:python:func :funcName "g_icmPostCmnds" :funcType "FrameWrk" :retType "Void" :deco "default" :argsList ""
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Func-FrameWrk  :: /g_icmPostCmnds/ retType=Void argsList=nil deco=default  [[elisp:(org-cycle)][| ]]
"""
@icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
def g_icmPostCmnds(
):
####+END:
    """ PostHook """
    pass


####+BEGIN: bx:icm:python:section :title "= =Framework::= Options, Arguments and Examples Specifications ="
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *= =Framework::= Options, Arguments and Examples Specifications =*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:


####+BEGIN: bx:icm:python:func :funcName "g_argsExtraSpecify" :comment "FrameWrk: ArgsSpec" :funcType "FrameWrk" :retType "Void" :deco "" :argsList "parser"
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Func-FrameWrk  :: /g_argsExtraSpecify/ =FrameWrk: ArgsSpec= retType=Void argsList=(parser)  [[elisp:(org-cycle)][| ]]
"""
def g_argsExtraSpecify(
    parser,
):
####+END:
    """Module Specific Command Line Parameters.
    g_argsExtraSpecify is passed to G_main and is executed before argsSetup (can not be decorated)
    """
    G = icm.IcmGlobalContext()
    icmParams = icm.ICM_ParamDict()

    icmParams.parDictAdd(
        parName='moduleVersion',
        parDescription="Module Version",
        parDataType=None,
        parDefault=None,
        parChoices=list(),
        parScope=icm.ICM_ParamScope.TargetParam,
        argparseShortOpt=None,
        argparseLongOpt='--version',
    )

    icmParams.parDictAdd(
        parName='pkgSrc',
        parDescription="Package Source",
        parDataType=None,
        parDefault=None,
        parChoices=list(),
        parScope=icm.ICM_ParamScope.TargetParam,
        argparseShortOpt=None,
        argparseLongOpt='--pkgSrc',
    )
    
    bxpBaseDir.commonParamsSpecify(icmParams)
       
    icm.argsparseBasedOnIcmParams(parser, icmParams)

    # So that it can be processed later as well.
    G.icmParamDictSet(icmParams)
    
    return


####+BEGIN: bx:icm:python:cmnd:classHead :modPrefix "new" :cmndName "examples" :cmndType "ICM-Cmnd-FWrk"  :comment "FrameWrk: ICM Examples" :parsMand "" :parsOpt "" :argsMin "0" :argsMax "0" :asFunc "" :interactiveP ""
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || ICM-Cmnd-FWrk  :: /examples/ =FrameWrk: ICM Examples= parsMand= parsOpt= argsMin=0 argsMax=0 asFunc= interactive=  [[elisp:(org-cycle)][| ]]
"""
class examples(icm.Cmnd):
    cmndParamsMandatory = [ ]
    cmndParamsOptional = [ ]
    cmndArgsLen = {'Min': 0, 'Max': 0,}

    @icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
    def cmnd(self,
        interactive=False,        # Can also be called non-interactively
    ):
        cmndOutcome = self.getOpOutcome()
        if interactive:
            if not self.cmndLineValidate(outcome=cmndOutcome):
                return cmndOutcome

        callParamsDict = {}
        if not icm.cmndCallParamsValidate(callParamsDict, interactive, outcome=cmndOutcome):
            return cmndOutcome
####+END:
	def cmndDesc(): """
"""
        myName=self.myName()
        #G = icm.IcmGlobalContext()        
        thisOutcome = icm.OpOutcome(invokerName=myName)

        G_myFullName = sys.argv[0]
        G_myName = os.path.basename(G_myFullName)
        icm.icmExampleMyName(G_myName, os.path.abspath(G_myFullName))
        icm.G_commonBriefExamples()    
        #icm.G_commonExamples()
        #g_curFuncName = icm.FUNC_currentGet().__name__
        logControler = icm.LOG_Control()
        logControler.loggerSetLevel(20)

        #cmndThis = icm.FUNC_currentGet().__name__

        logControler = icm.LOG_Control()
        logControler.loggerSetLevel(20)

        #verboseDebug = " -v  1"
        #verboseWarning = " -v 30"        
        #verboseError = " -v 30"

        selectedPipPkg = "unisos.marme"

        icm.cmndExampleMenuChapter('*General Dev and Testing CMNDs*')

        cmndName = "unitTest" ; cmndArgs = "" ;
        cps = collections.OrderedDict() ; # cps['icmsPkgName'] = icmsPkgName 
        icm.ex_gCmndMenuItem(cmndName, cps, cmndArgs, verbosity='little')
        icm.ex_gCmndMenuItem(cmndName, cps, cmndArgs, verbosity='full')        
        
        icm.cmndExampleMenuChapter('*Start Template Maintenence*')

        def execLineEx(cmndStr): icm.ex_gExecMenuItem(execLine=cmndStr)

        templateFile = "/bisos/apps/defaults/update/sw/icm/py/start/icmBasic.py"
        thisFile = __file__

        execLineEx("""diff {thisFile} {templateFile}""".format(thisFile=thisFile, templateFile=templateFile))
        execLineEx("""cp {thisFile} {templateFile}""".format(thisFile=thisFile, templateFile=templateFile))
        execLineEx("""cp {templateFile} {thisFile}""".format(thisFile=thisFile, templateFile=templateFile))                
  
        return(thisOutcome)

    
####+BEGIN: bx:dblock:global:file-insert :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/G_examples.bottom.py"
    # Intentionally Left Blank -- previously: lhip.G_devExamples(G_myName)

####+END:


####+BEGIN: bx:icm:python:section :title "ICM Commands"
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *ICM Commands*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:

####+BEGIN: bx:icm:python:cmnd:classHead :modPrefix "new" :cmndName "unitTest" :parsMand "" :parsOpt "" :argsMin "0" :argsMax "1" :asFunc "" :interactiveP ""
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || ICM-Cmnd       :: /unitTest/ parsMand= parsOpt= argsMin=0 argsMax=1 asFunc= interactive=  [[elisp:(org-cycle)][| ]]
"""
class unitTest(icm.Cmnd):
    cmndParamsMandatory = [ ]
    cmndParamsOptional = [ ]
    cmndArgsLen = {'Min': 0, 'Max': 1,}

    @icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
    def cmnd(self,
        interactive=False,        # Can also be called non-interactively
        argsList=None,         # or Args-Input
    ):
        cmndOutcome = self.getOpOutcome()
        if interactive:
            if not self.cmndLineValidate(outcome=cmndOutcome):
                return cmndOutcome
            effectiveArgsList = G.icmRunArgsGet().cmndArgs
        else:
            effectiveArgsList = argsList

        callParamsDict = {}
        if not icm.cmndCallParamsValidate(callParamsDict, interactive, outcome=cmndOutcome):
            return cmndOutcome
####+END:

        myName=self.myName()
        thisOutcome = icm.OpOutcome(invokerName=myName)

        print G.icmInfo

        for eachArg in effectiveArgsList:
            icm.ANN_here("{}".format(eachArg))

        print (icm.__file__)
        print sys.path

        import imp
        print(imp.find_module('unisos/icm'))

        @ucf.runOnceOnly
        def echo(str):
            print str
            
        echo("first")
        echo("second")  # Should not run
    
        return thisOutcome
    
    def cmndDocStr(self): return """
** Place holder for ICM's experimental or test code.  [[elisp:(org-cycle)][| ]]
*** You can use this Cmnd for rapid prototyping and testing of newly developed functions.
"""


    

####+BEGIN: bx:icm:python:section :title "Supporting Classes And Functions"
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *Supporting Classes And Functions*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:
"""
*       /Empty/  [[elisp:(org-cycle)][| ]]
"""
    
####+BEGIN: bx:icm:python:section :title "Common/Generic Facilities -- Library Candidates"
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *Common/Generic Facilities -- Library Candidates*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:
"""
*       /Empty/  [[elisp:(org-cycle)][| ]]
"""

    
####+BEGIN: bx:icm:python:section :title "= =Framework::=   G_main -- Instead Of ICM Dispatcher ="
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *= =Framework::=   G_main -- Instead Of ICM Dispatcher =*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:

####+BEGIN: bx:icm:python:func :funcName "G_main" :funcType "FrameWrk" :retType "Void" :deco "" :argsList ""
"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children)][|V]] [[elisp:(org-tree-to-indirect-buffer)][|>]] [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Func-FrameWrk  :: /G_main/ retType=Void argsList=nil  [[elisp:(org-cycle)][| ]]
"""
def G_main(
):
####+END:
    """ 
** Replaces ICM dispatcher for other command line args parsings.
"""
    print sys.argv
    return

####+BEGIN: bx:icm:python:subSection :title "= =Framework::= g_ Settings -- ICMs Imports ="
"""
*  [[elisp:(beginning-of-buffer)][Top]] ================ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]          *= =Framework::= g_ Settings -- ICMs Imports =*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:


g_examples = examples  # or None 
g_mainEntry = G_main # or None
g_importedCmnds = {        # Enumerate modules from which CMNDs become invokable
    'bxpBaseDir': bxpBaseDir.__file__,
}

####+BEGIN: bx:dblock:global:file-insert :file "/bisos/apps/defaults/update/sw/icm/py/icm2.G_main.py"
"""
*  [[elisp:(beginning-of-buffer)][Top]] # /Dblk-Begin/ # [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *= =Framework::= ICM main() =*
"""

def classedCmndsDict():
    """
** Should be done here, can not be done in icm library because of the evals.
"""
    callDict = dict()
    for eachCmnd in icm.cmndList_mainsMethods().cmnd(
            interactive=False,
            importedCmnds=g_importedCmnds,
            mainFileName=__file__,
    ):
        try:
            callDict[eachCmnd] = eval("{}".format(eachCmnd))
            continue
        except NameError:
            pass

        for mod in g_importedCmnds:
            try:
                eval("{mod}.{cmnd}".format(mod=mod, cmnd=eachCmnd))
            except AttributeError:
                continue
            try:                
                callDict[eachCmnd] = eval("{mod}.{cmnd}".format(mod=mod, cmnd=eachCmnd))
                break
            except NameError:
                pass
    return callDict

icmInfo['icmName'] = __icmName__
icmInfo['version'] = __version__
icmInfo['status'] = __status__
icmInfo['credits'] = __credits__

G = icm.IcmGlobalContext()
G.icmInfo = icmInfo

def g_icmMain():
    """This ICM's specific information is passed to G_mainWithClass"""
    sys.exit(
        icm.G_mainWithClass(
            inArgv=sys.argv[1:],                 # Mandatory
            extraArgs=g_argsExtraSpecify,        # Mandatory
            G_examples=g_examples,               # Mandatory            
            classedCmndsDict=classedCmndsDict(),   # Mandatory
            mainEntry=g_mainEntry,
            g_icmPreCmnds=g_icmPreCmnds,
            g_icmPostCmnds=g_icmPostCmnds,
        )
    )

g_icmMain()

"""
*  [[elisp:(beginning-of-buffer)][Top]] ## /Dblk-End/ ## [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *= =Framework::= ICM main() =*
"""

####+END:

####+BEGIN: bx:icm:python:section :title "Unused Facilities -- Temporary Junk Yard"
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *Unused Facilities -- Temporary Junk Yard*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:
"""
*       /Empty/  [[elisp:(org-cycle)][| ]]
"""

####+BEGIN: bx:icm:python:section :title "End Of Editable Text"
"""
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *End Of Editable Text*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
"""
####+END:

####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/endOfFileControls.org"
#+STARTUP: showall
####+END:

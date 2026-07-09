#!/bin/env python
# -*- coding: utf-8 -*-

""" #+begin_org
* ~[Summary]~ :: A =CSXU= for initiating AI collaborative development templates.
#+end_org """

""" #+begin_org
* [[elisp:(org-cycle)][| ~Description~ |]] :: [[file:/bisos/panels/bisos-core/bisos-pip/bisos.tocsModules/_nodeBase_/fullUsagePanel-en.org][BISOS Panel]]   [[elisp:(org-cycle)][| ]]

** Status: In use with BISOS
** /[[elisp:(org-cycle)][| Planned Improvements |]]/ :
*** TODO Review Panel's Design and Evolution section.
#+end_org """


####+BEGIN: b:py3:cs:file/dblockControls :classification "cs-mu"
""" #+begin_org
* [[elisp:(org-cycle)][| /Control Parameters Of This File/ |]] :: dblk ctrls classifications=cs-mu
#+BEGIN_SRC emacs-lisp
(setq-local b:dblockControls t) ; (setq-local b:dblockControls nil)
(put 'b:dblockControls 'py3:cs:Classification "cs-mu") ; one of cs-mu, cs-u, cs-lib, bpf-lib, pyLibPure
#+END_SRC
#+RESULTS:
: cs-mu
#+end_org """
####+END:

####+BEGIN: b:prog:file/proclamations :outLevel 1
""" #+begin_org
* *[[elisp:(org-cycle)][| Proclamations |]]* :: Libre-Halaal Software --- Part Of BISOS ---  Poly-COMEEGA Format.
** This is Libre-Halaal Software. © Neda Communications, Inc. Subject to AGPL.
** It is part of BISOS (ByStar Internet Services OS)
** Best read and edited  with Blee in Poly-COMEEGA (Polymode Colaborative Org-Mode Enhance Emacs Generalized Authorship)
#+end_org """
####+END:

####+BEGIN: b:prog:file/particulars :authors ("./inserts/authors-mb.org")
""" #+begin_org
* *[[elisp:(org-cycle)][| Particulars |]]* :: Authors, version
** This File: /bisos/apps/defaults/ai-templates/startAiAt.cs/startAiAt.cs
** Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
#+end_org """
####+END:

####+BEGIN: b:py3:file/particulars-csInfo :status "inUse"
""" #+begin_org
* *[[elisp:(org-cycle)][| Particulars-csInfo |]]*
#+end_org """
import typing
csInfo: typing.Dict[str, typing.Any] = { 'moduleName': ['startAiAt'], }
csInfo['version'] = '202507081500'
csInfo['status']  = 'inUse'
csInfo['panel'] = 'startAiAt-Panel.org'
csInfo['groupingType'] = 'IcmGroupingType-pkged'
csInfo['cmndParts'] = 'IcmCmndParts[common] IcmCmndParts[param]'
####+END:


####+BEGIN: b:prog:file/orgTopControls :outLevel 1
""" #+begin_org
* [[elisp:(org-cycle)][| Controls |]] :: [[elisp:(delete-other-windows)][(1)]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]

#+end_org """
####+END:

####+BEGIN: b:py3:file/workbench :outLevel 1
""" #+begin_org
* [[elisp:(org-cycle)][| Workbench |]] :: [[elisp:(python-check (format "/bisos/venv/py3/bisos3/bin/python -m pyclbr %s" (bx:buf-fname))))][pyclbr]] || [[elisp:(python-check (format "/bisos/venv/py3/bisos3/bin/python -m pydoc ./%s" (bx:buf-fname))))][pydoc]] || [[elisp:(python-check (format "/bisos/pipx/bin/pyflakes %s" (bx:buf-fname)))][pyflakes]] | [[elisp:(python-check (format "/bisos/pipx/bin/pychecker %s" (bx:buf-fname))))][pychecker (executes)]] | [[elisp:(python-check (format "/bisos/pipx/bin/pycodestyle %s" (bx:buf-fname))))][pycodestyle]] | [[elisp:(python-check (format "/bisos/pipx/bin/flake8 %s" (bx:buf-fname))))][flake8]] | [[elisp:(python-check (format "/bisos/pipx/bin/pylint %s" (bx:buf-fname))))][pylint]]  [[elisp:(org-cycle)][| ]]
#+end_org """
####+END:

####+BEGIN: b:py3:cs:framework/imports :basedOn "classification"
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  CsFrmWrk   [[elisp:(outline-show-subtree+toggle)][||]] *Imports* =Based on Classification=cs-mu=
#+end_org """
from bisos import b
from bisos.b import cs
from bisos.b import b_io
from bisos.common import csParam

import collections
####+END:

import pathlib
import shutil
import subprocess
import typing

####+BEGIN: b:py3:cs:framework/csuListProc :pyImports t :csuImports t :csuParams t :csxuParams nil
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  CsFrmWrk   [[elisp:(outline-show-subtree+toggle)][||]] ~Process CSU List~ with /0/ in csuList pyImports=t csuImports=t csuParams=t
#+end_org """

csuList = [ ]

g_importedCmndsModules = cs.csuList_importedModules(csuList)

def g_extraParams():
    csParams = cs.param.CmndParamDict()
    commonParamsSpecify(csParams)
    cs.csuList_commonParamsSpecify(csuList, csParams)
    cs.argsparseBasedOnCsParams(csParams)

####+END:

####+BEGIN: b:py3:cs:orgItem/section :title "Common Parameters Specification"
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  /Section/    [[elisp:(outline-show-subtree+toggle)][||]] *Common Parameters Specification*  [[elisp:(org-cycle)][| ]]
#+end_org """
####+END:

def commonParamsSpecify(
        csParams: cs.param.CmndParamDict,
) -> None:
    csParams.parDictAdd(
        parName='root',
        parDescription="Target root: 'repo' for repo base, 'curDir' for current project directory.",
        parDataType=None,
        parDefault='curDir',
        parChoices=['repo', 'curDir'],
        argparseShortOpt=None,
        argparseLongOpt='--root',
    )
    csParams.parDictAdd(
        parName='activity',
        parDescription="Template activity type matching a directory under ai-templates/.",
        parDataType=None,
        parDefault=None,
        parChoices=[],
        argparseShortOpt=None,
        argparseLongOpt='--activity',
    )


g_templatesBase = pathlib.Path('/bisos/apps/defaults/ai-templates')


####+BEGIN: b:py3:cs:main/outcomeReportControl :disabled? nil :cmnd t :ro nil
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  CsFrmWrk   [[elisp:(outline-show-subtree+toggle)][||]] ~Invokation's Outcome Reporting Control~ with /cmnd=t/ /ro=nil/
#+end_org """
# cs.invOutcomeReportControl(cmnd=True, ro=True)
####+END:


####+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :sep nil :title "CmndSvcs" :anchor ""  :extraInfo "Command Services Section"
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*     [[elisp:(outline-show-subtree+toggle)][| _CmndSvcs_: |]]  Command Services Section  [[elisp:(org-shifttab)][<)]] E|
#+end_org """
####+END:

####+BEGIN: b:py3:cs:cmnd/classHead :cmndName "examples" :extent "verify" :ro "noCli" :comment "FrameWrk: CS-Main-Examples" :parsMand "" :parsOpt "" :argsMin 0 :argsMax 0 :pyInv ""
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  CmndSvc-   [[elisp:(outline-show-subtree+toggle)][||]] <<examples>>  *FrameWrk: CS-Main-Examples*  =verify= ro=noCli   [[elisp:(org-cycle)][| ]]
#+end_org """
class examples(cs.Cmnd):
    cmndParamsMandatory = [ ]
    cmndParamsOptional = [ ]
    cmndArgsLen = {'Min': 0, 'Max': 0,}
    rtInvConstraints = cs.rtInvoker.RtInvoker.new_noRo() # NO RO From CLI

    @cs.track(fnLoc=True, fnEntry=True, fnExit=True)
    def cmnd(self,
             rtInv: cs.RtInvoker,
             cmndOutcome: b.op.Outcome,
    ) -> b.op.Outcome:
        """FrameWrk: CS-Main-Examples"""
        failed = b_io.eh.badOutcome
        callParamsDict = {}
        if self.invocationValidate(rtInv, cmndOutcome, callParamsDict, None).isProblematic():
            return failed(cmndOutcome)
####+END:
        self.cmndDocStr(f""" #+begin_org
***** [[elisp:(org-cycle)][| *CmndDesc:* | ]]  Conventional top level example.
        #+end_org """)

        cs.examples.myName(cs.G.icmMyName(), cs.G.icmMyFullName())
        cs.examples.commonBrief()

        cs.examples.menuChapter('=initiate=  *AI Template Initiation*')

        od = collections.OrderedDict
        cmnd = cs.examples.cmndEnter

        cmnd('initiate',
             pars=od([('root', 'curDir'), ('activity', 'bisos-pip')]),
             comment="# Install bisos-pip templates into current directory")
        cmnd('initiate',
             pars=od([('root', 'repo'), ('activity', 'xu-single')]),
             comment="# Install xu-single templates at repo base")

        return(cmndOutcome)


####+BEGIN: b:py3:cs:cmnd/classHead :cmndName "initiate" :comment "Install AI templates via symlinks and safe-copy" :extent "verify" :ro "cli" :parsMand "activity" :parsOpt "root" :argsMin 0 :argsMax 0 :pyInv ""
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  CmndSvc-   [[elisp:(outline-show-subtree+toggle)][||]] <<initiate>>  =verify= parsMand=activity parsOpt=root ro=cli   [[elisp:(org-cycle)][| ]]
#+end_org """
class initiate(cs.Cmnd):
    cmndParamsMandatory = [ 'activity', ]
    cmndParamsOptional = [ 'root', ]
    cmndArgsLen = {'Min': 0, 'Max': 0,}

    @cs.track(fnLoc=True, fnEntry=True, fnExit=True)
    def cmnd(self,
             rtInv: cs.RtInvoker,
             cmndOutcome: b.op.Outcome,
             activity: typing.Optional[str]=None,  # Cs Mandatory Param
             root: typing.Optional[str]=None,       # Cs Optional Param
    ) -> b.op.Outcome:

        failed = b_io.eh.badOutcome
        callParamsDict = {'activity': activity, 'root': root, }
        if self.invocationValidate(rtInv, cmndOutcome, callParamsDict, None).isProblematic():
            return failed(cmndOutcome)
        activity = csParam.mappedValue('activity', activity)
        root = csParam.mappedValue('root', root)
####+END:
        self.cmndDocStr(f""" #+begin_org
** [[elisp:(org-cycle)][| *CmndDesc:* | ]]  Install AI collaborative development templates.
Symlinks constant files from bystar/. Symlinks AI-Activity.org from <activity>/.
Safe-copies AI-DevStatus.org and AI-WorkPlan.org from <activity>/.
        #+end_org """)

        activityDir = g_templatesBase / activity
        if not activityDir.is_dir():
            b_io.eh.problem_usageError(f"Activity directory not found: {activityDir}")
            return failed(cmndOutcome)

        if root == 'repo':
            result = subprocess.run(
                ['git', 'rev-parse', '--show-toplevel'],
                capture_output=True, text=True,
            )
            if result.returncode != 0:
                b_io.eh.problem_usageError("Could not determine repo root (not in a git repo?)")
                return failed(cmndOutcome)
            targetDir = pathlib.Path(result.stdout.strip())
        else:
            targetDir = pathlib.Path.cwd()

        bystarDir = g_templatesBase / 'bystar'

        # Constant files — always symlinked to bystar/
        constantFiles = ['CLAUDE.md', 'AI-AGENTS.org', 'AI-WORKFLOW.org']
        for fname in constantFiles:
            src = bystarDir / fname
            dst = targetDir / fname
            if dst.exists() or dst.is_symlink():
                b_io.ann.note(f"SKIP (exists): {dst}")
            else:
                dst.symlink_to(src)
                b_io.ann.note(f"SYMLINKED: {dst} -> {src}")

        # AI-Activity.org — symlinked to activity/
        generalSrc = activityDir / 'AI-Activity.org'
        generalDst = targetDir / 'AI-Activity.org'
        if generalDst.exists() or generalDst.is_symlink():
            b_io.ann.note(f"SKIP (exists): {generalDst}")
        else:
            generalDst.symlink_to(generalSrc)
            b_io.ann.note(f"SYMLINKED: {generalDst} -> {generalSrc}")

        # Initial files — safe-copied from activity/
        initialFiles = ['AI-DevStatus.org', 'AI-WorkPlan.org']
        for fname in initialFiles:
            src = activityDir / fname
            dst = targetDir / fname
            if dst.exists():
                b_io.ann.note(f"SKIP (exists): {dst}")
            else:
                shutil.copy2(src, dst)
                b_io.ann.note(f"COPIED: {src} -> {dst}")
                result = subprocess.run(
                    ['bx-dblock', '-i', 'dblockUpdateFiles', str(dst)],
                    capture_output=True, text=True,
                )
                if result.returncode == 0:
                    b_io.ann.note(f"DBLOCK-UPDATED: {dst}")
                else:
                    b_io.ann.note(f"DBLOCK-UPDATE FAILED: {dst}: {result.stderr.strip()}")

        # .claude/ — install settings.json and commands/
        # Source is _claude/ in templates (visible); installed as .claude/ in target
        # Use activity-specific _claude/ if it exists, else fall back to bystar/_claude/
        activityClaudeDir = activityDir / '_claude'
        bystarClaudeDir = g_templatesBase / 'bystar' / '_claude'
        claudeSrcDir = activityClaudeDir if activityClaudeDir.is_dir() else bystarClaudeDir

        for claudeSrcFile in claudeSrcDir.rglob('*'):
            if not claudeSrcFile.is_file():
                continue
            relPath = claudeSrcFile.relative_to(claudeSrcDir)
            claudeDst = targetDir / '.claude' / relPath
            claudeDst.parent.mkdir(parents=True, exist_ok=True)
            if claudeDst.exists():
                b_io.ann.note(f"SKIP (exists): {claudeDst}")
            else:
                shutil.copy2(claudeSrcFile, claudeDst)
                b_io.ann.note(f"COPIED: {claudeSrcFile} -> {claudeDst}")

        return cmndOutcome.set(
            opError=b.op.OpError.Success,
            opResults=f"AI templates initiated for activity={activity} at {targetDir}",
        )


####+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :sep nil :title "Main" :anchor ""  :extraInfo "Framework DBlock"
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*     [[elisp:(outline-show-subtree+toggle)][| _Main_: |]]  Framework DBlock  [[elisp:(org-shifttab)][<)]] E|
#+end_org """
####+END:

####+BEGIN: b:py3:cs:framework/main :csInfo "csInfo" :noCmndEntry "examples" :extraParamsHook "g_extraParams" :importedCmndsModules "g_importedCmndsModules"
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  CsFrmWrk   [[elisp:(outline-show-subtree+toggle)][||]] =g_csMain= (csInfo, _examples_, g_extraParams, g_importedCmndsModules)
#+end_org """

if __name__ == '__main__':
    cs.main.g_csMain(
        csInfo=csInfo,
        noCmndEntry=examples,
        extraParamsHook=g_extraParams,
        ignoreUnknownParams=False,
        importedCmndsModules=g_importedCmndsModules,
    )

####+END:

####+BEGIN: b:py3:cs:framework/endOfFile :basedOn "classification"
""" #+begin_org
* [[elisp:(org-cycle)][| *End-Of-Editable-Text* |]] :: emacs and org variables and control parameters
#+end_org """

#+STARTUP: showall

### local variables:
### no-byte-compile: t
### end:
####+END:
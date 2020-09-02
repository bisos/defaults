"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || FrmWrk-IIF   ::  examples    [[elisp:(org-cycle)][| ]]
"""

@iim.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
def examples(interactive=False):
    G_myFullName = sys.argv[0]
    G_myName = os.path.basename(G_myFullName)
    iim.iimExampleMyName(G_myName, os.path.abspath(G_myFullName))
    iim.G_commonBriefExamples()    
    #iim.G_commonExamples()
    #g_curFuncName = iim.FUNC_currentGet().__name__
    logControler = iim.LOG_Control()
    logControler.loggerSetLevel(20)

"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || =G_example=  ::  examples    [[elisp:(org-cycle)][| ]]
"""
@lhip.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
def examples(interactive=False):
    G_myFullName = sys.argv[0]
    G_myName = os.path.basename(G_myFullName)
    lhip.iimExampleMyName(G_myName, os.path.abspath(G_myFullName))
    lhip.G_commonBriefExamples()    
    #lhip.G_commonExamples()
    #g_curFuncName = lhip.FUNC_currentGet().__name__
    logControler = lhip.LOG_Control()
    logControler.loggerSetLevel(20)

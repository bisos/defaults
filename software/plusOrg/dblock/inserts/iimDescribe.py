"""
*  [[elisp:(org-cycle)][| ]]  Describe      :: /[dblock] -i describe/  [[elisp:(org-cycle)][| ]]
"""
    
# Can't be decorated in Native-SON-Modules
#@lhip.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
def describe(interactive=False):
    """"""
    if lhip.Interactivity().interactiveInvokation(interactive):
        print(str(__doc__))  # This is the Summary: from the top doc-string
        print(moduleDescription)
        return
    else:
        return(format(str(__doc__)+moduleDescription))

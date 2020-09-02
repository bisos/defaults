"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Dblk-Begin/ ::  g_invokesProc (g_invokesProc(args))   [[elisp:(org-cycle)][| ]]
"""

def g_invokesProc():
    """Invoke the specified function.

This is here and not in iim.g_invokesProc because of naming scopes.
Can't -- eval(invoke + '()') -- from within iim library.
    """

    G = iim.IimGlobalContext()
    iimRunArgs = G.iimRunArgsGet()

    for invoke in iimRunArgs.invokes:

        #func = iim.FUNC_strToFunc(invoke)
        try:
            eval(invoke + '(interactive=True)')
            #func(args)
        except Exception as e:
            iim.EH_critical_exception(e)
            iim.EH_problem_info("Invalid Action: {invoke}"
                                 .format(invoke=invoke))            
            raise
    return


"""
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Dblk-End/   ::   [[elisp:(org-cycle)][| ]]
"""
    

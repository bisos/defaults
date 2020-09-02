"""
*  [[elisp:(org-cycle)][| ]]  [InvokesProc] :: /[dblock] -- invokesProc (g_invokesProc(args))/ [[elisp:(org-cycle)][| ]]
"""

def g_invokesProc():
    """Invoke the specified function.

This is here and not in lhip.g_invokesProc because of naming scopes.
Can't -- eval(invoke + '()') -- from within lhip library.
    """

    G = lhip.IimGlobalContext()
    iimRunArgs = G.iimRunArgsGet()

    for invoke in iimRunArgs.invokes:

        #func = lhip.FUNC_strToFunc(invoke)
        try:
            eval(invoke + '(interactive=True)')
            #func(args)
        except Exception as e:
            lhip.EH_critical_exception(e)
            lhip.EH_problem_info("Invalid Action: {invoke}"
                                 .format(invoke=invoke))            
            raise
    return

def g_nson_invokesProc(iifFunc):
    """Invoke the specified function.
    """
    try:
        eval(iifFunc + '(interactive=True)')
    except Exception as e:
        lhip.EH_critical_exception(e)
        lhip.EH_problem_info("Invalid Action: {invoke}"
                             .format(invoke=iifFunc))            
        raise

    try: iim.callableEntryEnhancer(type='iif')
    except StopIteration:  return

    G = iim.IimGlobalContext()
    G.curFuncNameSet(iim.FUNC_currentGet().__name__)

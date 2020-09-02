    try: lhip.callableEntryEnhancer(type='iif')
    except StopIteration:  return

    G = lhip.IimGlobalContext()
    G.curFuncNameSet(lhip.FUNC_currentGet().__name__)

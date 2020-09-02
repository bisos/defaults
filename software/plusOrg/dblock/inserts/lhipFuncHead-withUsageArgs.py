    try: lhip.callableEntryEnhancer(type='withUsageArgs')
    except StopIteration:  return

    G = lhip.IimGlobalContext()
    G.curFuncNameSet(lhip.FUNC_currentGet().__name__)

    try: lhip.callableEntryEnhancer(type='iif')
    except StopIteration:  return

    print( str( __doc__ ) )  # This is the Summary: from the top doc-string
    lhip.callableEntryEnhancer(type='describe')

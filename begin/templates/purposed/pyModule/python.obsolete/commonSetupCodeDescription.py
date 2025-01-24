import setuptools
import re
import inspect
import pathlib

def pkgName():
    """ From this eg., filepath=.../bisos-pip/PkgName/py3/setup.py, extract PkgName. """
    filename = inspect.getframeinfo(inspect.currentframe()).filename
    grandMother = pathlib.Path(filename).resolve().parent.parent.name
    return f"bisos.{grandMother}"

def description():
    """ Extract title from ./_description.org which is expected to have a title: line. """
    try:
        with open('./_description.org') as file:
            while line := file.readline():
                if match := re.search(r'^#\+title: (.*)',  line.rstrip()):
                    return match.group(1)
                return "MISSING TITLE in ./_description.org"
    except IOError:
        return  "ERROR: Could not read ./_description.org file."

def longDescription():
    """ Convert _description.org to .rst. """
    try:
        import pypandoc
    except ImportError:
        result = "WARNING: pypandoc module not found, could not convert to RST"
        return result
    if (result := pypandoc.convert_file('_description.org', 'rst')) is None:
        result = "ERROR: pypandoc.convert_file('_description.org', 'rst') Failed."
    return result

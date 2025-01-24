
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
    """ Extract title from ./README.org which is expected to have a title: line. """
    try:
        with open('./README.org') as file:
            while line := file.readline():
                if match := re.search(r'^#\+title: (.*)',  line.rstrip()):
                    return match.group(1)
                return "MISSING TITLE in ./README.org"
    except IOError:
        return  "ERROR: Could not read ./README.org file."

def longDescription():
    """ Convert README.org to README.rst. """
    try:
        import pypandoc
    except ImportError:
        result = "WARNING: pypandoc module not found, could not convert to RST"
        return result
    if (result := pypandoc.convert_file('README.org', 'rst')) is None:
        result = "ERROR: pypandoc.convert_file('README.org', 'rst') Failed."
    return result

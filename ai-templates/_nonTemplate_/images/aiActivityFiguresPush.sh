#!/bin/bash
#
# Push the rendered workflow figures of this directory to bisos.aiActivity, whose README.org
# includes them (py3/images/fromTemplates/).
#
# Its presence here is the reminder: after re-rendering a figure in this directory
# (*-graphviz.pcs -i ngProcess ...), push the copies, then commit+push both repos.
#
# The copy itself is done by the receiver's own script --- one implementation, usable from
# either side: this pushes, refreshFromTemplates.sh (run there) pulls.

receiver=/bisos/git/bxRepos/bisos-pip/aiActivity/py3/images/fromTemplates/refreshFromTemplates.sh

if [ ! -x "$receiver" ] ; then
    echo "ERROR: $receiver not found or not executable --- is bisos.aiActivity cloned here?" >&2
    exit 1
fi

exec "$receiver" "$@"

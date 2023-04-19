(TeX-add-style-hook
 "presArtFrontEnFa.ttytex"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("beamer" "ignorenonframetext")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("beamerposter" "orientation=landscape" "size=custom" "width=16" "height=9" "scale=0.5" "debug")))
   (add-to-list 'LaTeX-verbatim-environments-local "semiverbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "./bodyPresArtEnFa"
    "beamer"
    "beamer10"
    "comment"
    "hevea"
    "pdfpcnotes"
    "beamerthemesplit"
    "beamerposter"
    "color"
    "hyperref"
    "url"
    "fontspec"
    "xltxtra"
    "xunicode"
    "bidi"
    "bystarpersian"
    "bystarpresentation")
   (LaTeX-add-environments
    "bidiSepBeforeHevea"
    "bidiSepAfterHevea")
   (LaTeX-add-bibliographies
    "/lcnt/outputs/all/plpcUrl"
    "/usr/local/lib/bib/rfcs")
   (LaTeX-add-xcolor-definecolors
    "darkred"
    "darkgreen"
    "darkblue"))
 :latex)


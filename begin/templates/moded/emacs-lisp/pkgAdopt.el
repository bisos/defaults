;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "moduleName" "fv-lib")  (replace-string "moduleTag:" "fv:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (moduleTag:), for handelling File_Var [[elisp:(org-cycle)][| ]]
* 
")


;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
*      ================
")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
")
;;;#+END:

(lambda () "
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")


(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "moduleName"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message moduleName [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: moduleName")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: moduleTag:main-init [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (moduleTag:main-init) [[elisp:(org-cycle)][| ]]
")

(defun moduleTag:main-init ()
  "Desc:"
  nil
  )


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "moduleName"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'moduleName)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

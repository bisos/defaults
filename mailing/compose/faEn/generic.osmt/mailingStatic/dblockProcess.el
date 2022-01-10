(defun bx:dblock:body-process ()
  ""
  (goto-char (point-min))
  (replace-string  "@dateString@"
		   (time-stamp-string "%:y-%02m-%02d %02H:%02M:%02S %u")
		   )  
  )


;;;;+BEGIN: bx:dblock:global:file-insert-process :file "/dev/null" :load "./dblockProcess.el" :exec "bx:dblock:subject-process"
;;;;+END:

(defun bx:dblock:subject-process ()
  ""  
  (goto-char (point-min))
  (insert (format "Subject: Test Message Generated On %s"
	   (time-stamp-string "%:y-%02m-%02d %02H:%02M:%02S %u")))
  )


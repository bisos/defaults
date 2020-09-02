;;;    ======== bxms-compose-MailingName           -- Originate A Fresh Message -- Or Augment An Existing Message
;;;    ======== bxms-batch-MailingName          -- = bx-msend-MailingName + (msend-mail-and-exit)
;;;    ========
;;;    ======== bxms-web-url-MailingName            -- BROWSER ORIGINATION -- (Send Link)
;;;    ======== bxms-web-mailto-MailingName         -- BROWSER ORIGINATION -- (Click On A mailto: URL)
;;;    ========
;;;    ======== x bxms-compose-MailingName         -- BBDB ORIGINATION  -- Interactive on One or on Each one-by-one
;;;    ======== x bxms-batch-MailingName        -- BBDB ORIGINATION  -- Batch on One or on Each one-by-one
;;;    ======== x bxms-toall-MailingName          -- BBDB ORIGINATION  -- Interactive on ALL
;;;    ========
;;;    ======== bxms-bbdb-compose-MailingName  -- BBDB USAGE        -- Interactive on One
;;;    ======== bxms-bbdb-batch-MailingName    -- BBDB USAGE        -- Batch on One
;;;    ======== bxms-bbdb-toall-MailingName    -- BBDB USAGE        -- Interactive on ALL in To:


(defun bxms-compose-@thisMailingName@ (n)
  " "
  (interactive "p")
  (bxms-compose-from-base "@thisMailingBaseDir@" n)
)

(defun bxms-batch-@thisMailingName@ (n)
  " "
  (interactive "p")
  (bxms-compose-@thisMailingName@ n)

  (msend-mail-and-exit)
)


(defun bxms-bbdb-compose-@thisMailingName@ (n)
  ""
  (interactive "p")
  (bx:mailing:bbdb:compose "@thisMailingBaseDir@" n)
)

(defun bxms-bbdb-batch-@thisMailingName@ (n)
  ""
  (interactive "p")
  (bx:mailing:bbdb:batch "@thisMailingBaseDir@" n)
)


(defun bxms-bbdb-toall-@thisMailingName@ (n)
  ""
  (interactive "p")
  (bx:mailing:bbdb:toall "@thisMailingBaseDir@" n)
)


(defun bxms:bbdb:compose:@thisMailingName@ (records) 
  ""
  (bxms-bbdb-compose-from-base "@thisMailingBaseDir@" records)
)


(setq bbdb-action-alist 
  (append 
   bbdb-action-alist
   '(("bxms-compose-@thisMailingName@" 
      ;;
      (setq bbdb-action-hook nil)
      (add-hook 'bbdb-action-hook 'bxms:bbdb:compose:@thisMailingName@)
      ))))

(defun bxms:bbdb:toall:@thisMailingName@ (records) 
  ""
  (bbdb-mall-from-base "@thisMailingBaseDir@" records)
)

(setq bbdb-action-alist 
  (append 
   bbdb-action-alist
   '(("bxms-toall-@thisMailingName@" 
      ;;
      (setq bbdb-action-hook nil)
      (add-hook 'bbdb-action-hook 'bxms:bbdb:toall:@thisMailingName@)
      ))))

(defun bxms:bbdb:batch:@thisMailingName@ (records) 
  ""
  (bxms-bbdb-batch-from-base "@thisMailingBaseDir@" records)
)

(setq bbdb-action-alist 
  (append 
   bbdb-action-alist
   '(("bxms-batch-@thisMailingName@" 
      ;;
      (setq bbdb-action-hook nil)
      (add-hook 'bbdb-action-hook 'bxms:bbdb:batch:@thisMailingName@)
      ))))


(defun bxms:web:mailto:@thisMailingName@-pre ()
  ""
  (bx-mmailto-from-base-pre "@thisMailingBaseDir@")
  )

(defun bxms:web:mailto:@thisMailingName@-post ()
  ""
  (bx-mmailto-from-base-post "@thisMailingBaseDir@")
  )

(defun bxms-web-mailto-@thisMailingName@ ()
  ""
  (interactive)

  (setq  a-murl-pre-hook nil)
  (add-hook 'a-murl-pre-hook 'bxms:web:mailto:@thisMailingName@-pre)

  (setq  a-murl-post-hook nil)
  (add-hook 'a-murl-post-hook 'bxms:web:mailto:@thisMailingName@-post)
  )

(defun bxms:web:url:@thisMailingName@-pre ()
  ""
  (bx-murl-from-base-pre "@thisMailingBaseDir@")
  )

(defun bxms:web:url:@thisMailingName@-post ()
  ""
  (bx-murl-from-base-post "@thisMailingBaseDir@")
  )

(defun bxms-web-url-@thisMailingName@ ()
  ""
  (interactive)

  (setq  a-murl-pre-hook nil)
  (add-hook 'a-murl-pre-hook 'bxms:web:url:@thisMailingName@-pre)

  (setq  a-murl-post-hook nil)
  (add-hook 'a-murl-post-hook 'bxms:web:url:@thisMailingName@-post)
  )



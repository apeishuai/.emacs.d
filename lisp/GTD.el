(require 'cl)
(require 'org-clock)

;;Files
(setq org-directory "/media/shuai/wxf files/shuai-files/GTD/")
(setq time-scan-files (list
		       (concat org-directory "next.org")
		       (concat org-directory "finished.org")
		       (concat org-directory "projects.org")))

(setq org-agenda-files (list (concat org-directory "inbox.org")
			     (concat org-directory "next.org")
			     (concat org-directory "projects.org")
			     (concat org-directory "finished.org")
			     (concat org-directory "Someday_Maybe.org")
			     (concat org-directory "Reference.org")
			     (concat org-directory "agenda.org")
			     "/media/shuai/wxf files/shuai-files/wxf`s blog/posts/wxfs-booklist.org"
			     (concat org-directory "Trash.org")
			     ))

;;Capture
(setq org-capture-templates
      `(("i" "Inbox" entry  (file "inbox.org")
        ,(concat "* TODO %?\n"
                 "/Entered on/ %U\n" "\n"))

        ("c" "org-protocol-capture" entry  (file "inbox.org")
        ,(concat "* TODO %a\n"
                 "/Entered on/ %U\n" "\n" "%?" ))
	;;:immediate-finish t

	("b" "Books" entry  (file "../wxf`s blog/posts/wxfs-booklist.org")
         ,(concat "* Title: 《%?》\n"
		  " Tags: \n"
		  " Status: \n"
                  " Start-Time: %U\n"
		  " End-Time:  %U\n"
		  " Intro: \n"))
	))
(setq org-protocol-default-template-key "c")
(setq org-agenda-hide-tags-regexp ".")


;; TODO
(setq org-todo-keywords
      '((sequence "TODO(T!)"  "|" "DONE(D!)")))
(defun log-todo-next-creation-date (&rest ignore)
  "Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
  (when (and (string= (org-get-todo-state) "TODO")
             (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))
(add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)

;; Refile
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-targets
      '((org-agenda-files :maxlevel . 3)))

;; Agenda
(setq org-agenda-custom-commands
      '(("g" "Get Things Done (GTD)"
	 ((agenda ""
                  (
		   (org-agenda-span 'day)
		   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'todo '("TODO" "DONE")))
                   (org-deadline-warning-days 10)
		   ))
          (tags-todo "inbox"
                     ((org-agenda-prefix-format "%T:  %?-12t% s")
                      (org-agenda-overriding-header "\nTo Refile\n")))
          (tags-todo "next"
                     ((org-agenda-prefix-format "%T:  %?-12t% s")
                      (org-agenda-overriding-header "\nIn Progress\n")))
	  (tags-todo "projects"
                     ((org-agenda-prefix-format "%T:  %?-12t% s")
                      (org-agenda-overriding-header "\nProjects\n")))
	  (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "\nCompleted today\n")))))))

;;basic settings
;(setq org-agenda-start-day "+20d")
(setq org-agenda-include-diary t)
(setq org-log-done 'time)

;;key bindings
(define-key global-map (kbd "C-c i") 'org-capture-inbox)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map  (kbd "C-c c") 'org-capture)


;;appoint ontime
(setq appt-message-warning-time 0)      ; 0 minute time before warning

(defun org-capture-inbox ()
     (interactive)
     (call-interactively 'org-store-link)
     (org-capture nil "i"))

(setq org-agenda-prefix-format
      '((agenda . " %i %-12:c%?-12t% s")
        (todo   . " %i %-12:c")
        (tags   . " %i %-12:c")
        (search . " %i %-12:c")))

;; Save the corresponding buffers
(defun gtd-save-org-buffers ()
  "Save `org-agenda-files' buffers without user confirmation.
See also `org-save-all-org-buffers'"
  (interactive)
  (message "Saving org-agenda-files buffers...")
  (save-some-buffers t (lambda () 
			 (when (member (buffer-file-name) org-agenda-files) 
			   t)))
  (message "Saving org-agenda-files buffers... done"))

;; Add it after refile
(advice-add 'org-refile :after
	    (lambda (&rest _)
	      (gtd-save-org-buffers)))

(provide 'GTD)


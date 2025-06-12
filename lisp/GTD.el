(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


(cond
 ((eq system-type 'gnu/linux)
  (message "Detected Linux system")
  (setq org-directory "~/")
  (setq org-refile-files (directory-files "~/" t "\\.org$"))
  )

 ((eq system-type 'windows-nt)
  (message "Detected Windows system")
  (setq org-directory "/c/Users/whens/Nutstore/1/docs/GTD")
  (setq org-refile-files (directory-files "/c/Users/whens/Nutstore/1/docs/GTD" t "\\.org$"))
 )
)

(setq org-capture-templates
      `(("i" "Inbox" entry  (file "inbox.org")
        ,(concat "* TODO %?\n"
                 "/Entered on/ %U\n" "\n"))))
(setq org-todo-keywords
      '((sequence "TODO(T!)"  "|" "DONE(D!)")))


(setq org-agenda-files '("inbox.org" "area.org"  "rsc.org"))



;; Refile
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-targets
      '((org-refile-files :maxlevel . 3)))

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

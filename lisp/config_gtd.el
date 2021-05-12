(setq org-directory "~/shuai-files/org-directory")
(setq org-agenda-files (list "inbox.org"))

(setq org-capture-templates
      '(("i""Inbox" entry (file "inbox.org")
	 "* TODO %?\n %i %a")))


(define-key global-map  (kbd "C-c c") 'org-capture)

(provide 'config_gtd)


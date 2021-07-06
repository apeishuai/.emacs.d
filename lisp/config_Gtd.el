;;Files
(setq org-directory "~/shuai-files/GTD")
(setq org-agenda-files (list "~/shuai-files/GTD/inbox.org" "~/shuai-files/GTD/agenda.org"
			     "~/shuai-files/GTD/notes.org"  "~/shuai-files/GTD/projects.org"))

;;Capture
(setq org-capture-templates
      `(("i" "Inbox" entry  (file "inbox.org")
        ,(concat "* TODO %?\n"
                 "/Entered on/ %U"))

	("m" "Meeting" entry  (file+headline "agenda.org" "Future")
        ,(concat "* %? :meeting:\n"
                 "<%<%Y-%m-%d %a %H:00>>"))

        ("n" "Note" entry  (file "notes.org")
        ,(concat "* Note (%a)\n"
                 "/Entered on/ %U\n" "\n" "%?"))

        ("c" "org-protocol-capture" entry  (file "Capture.org")
        ,(concat "* Capture %a\n"
                 "/Entered on/ %U\n" "\n" "%?"))))
(setq org-protocol-default-template-key "c")

;;key bindings
(define-key global-map (kbd "C-c i") 'org-capture-inbox)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map  (kbd "C-c c") 'org-capture)

;; Refile
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-targets
      '((org-agenda-files :maxlevel . 3)("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)")))

;; TODO
(setq org-todo-keywords
      '((sequence "TODO(T!)" "NEXT(N!)" "HOLD(H!)" "|" "DONE(D!)")))
(defun log-todo-next-creation-date (&rest ignore)
  "Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
  (when (and (string= (org-get-todo-state) "NEXT")
             (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))
(add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)

;; Agenda
(setq org-agenda-custom-commands
      '(("g" "Get Things Done (GTD)"
         ((agenda ""
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
                   (org-deadline-warning-days 0)))
          (todo "NEXT"
                ((org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'deadline))
                 (org-agenda-prefix-format "  %i %-12:c [%e] ")
                 (org-agenda-overriding-header "\nTasks\n")))
          (agenda nil
                  ((org-agenda-entry-types '(:deadline))
                   (org-agenda-format-date "")
                   (org-deadline-warning-days 7)
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'notregexp "\\* NEXT"))
                   (org-agenda-overriding-header "\nDeadlines")))
          (tags-todo "inbox"
                     ((org-agenda-prefix-format "  %?-12t% s")
                      (org-agenda-overriding-header "\nInbox\n")))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "\nCompleted today\n")))))))



(provide 'config_Gtd)


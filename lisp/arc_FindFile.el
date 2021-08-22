(require 'ivy)
(defun my-file-interal(directory &optional grep-p git-grep-p)
  "Find/Search file in DIRECTORY
If GREP-P is t,grep files
If GREP-P is nil, find files"
  (let* ((keyword (read-string "Please input keyword: ")))
    (when (and keyword (not (string= keyword "")))
      (let* ((find-cmd (format "find . -path \"*/.git\" -prune -o -type f -iname \"*%s*\" -print" keyword))
             (git-cmd-fmt (if git-grep-p "git grep -n \"%s\"" "grep -rsn \"%s\" *" ))
             (grep-cmd (format git-cmd-fmt keyword))
	     (default-directory directory)
             (output (shell-command-to-string (if grep-p grep-cmd find-cmd)))
	     ;;(lines (split-string output "*"))
	     ;;(lines (split-string output "[\n\t]+"))
	     (hint (if grep-p "Grep file in %s:" "Find file in %s:"))
	     selected-line
	     selected-file
	     linenum
	     )
	(unless grep-p (setq lines (cdr lines)))
	(message "default-directory:%s" default-directory)
	(message "output:%s" output)
	(message "lines:%s legth_output:%s" lines (length output))
	(setq selected-line (ivy-read (format hint default-directory) lines))
	(message "selected-file:%s" selected-file)

	(cond
	 (grep-p
	  (when (string-match "^\\([^:]*\\):\\([0-9]*\\):" selected-line)
	    (setq selected-file (match-string 1 selected-line))
	    (setq linenum (match-string 2 selected-line))))
	 (t
	  (setq selected-file selected-line)))
	(when (and selected-line (file-exists-p selected-file))
	  (find-file selected-file)
	  (goto-char (point-min))
	  (forward-line(1- (string-to-number linenum)))
	  )
	))))
(defun my-search-text-in-project()
  "Search text in project root directory"
  (interactive)
  (my-file-interal (locate-dominating-file default-directory ".git") t t)  
)

(defun my-search-text(&optional level)
  "Search text in current directory or LEVEL parent directory."
  (interactive "P")
  (unless level (setq level 0))
  ;; default-directory
  (let* ((parent-directory default-directory)
	  (i 0))
	 (while (< i level)
	 (setq parent-directory
	       (file-name-directory(directory-file-name parent-directory))
	       )
	 ;; directory-file-name
	 ;; file-name-directory
	 (setq i (+ i 1)))
	 ;; 2,xf
	 (my-file-interal parent-directory t t)))


(defun my-find-file-in-project()
  "Find file in project root directory"
  (interactive)
  (my-file-interal (locate-dominating-file default-directory ".git") nil nil)  
)

(defun my-find-file(&optional level)
  "Find file in current directory or LEVEL parent directory."
  (interactive "P")
  (unless level (setq level 0))
  ;; default-directory
  (let* ((parent-directory default-directory)
	  (i 0))
	 (while (< i level)
	 (setq parent-directory
	       (file-name-directory(directory-file-name parent-directory))
	       )
	 ;; directory-file-name
	 ;; file-name-directory
	 (setq i (+ i 1)))
	 ;; 2,xf
	 (my-file-interal parent-directory)))

(provide 'my-find-file)

(defun company-mytags-scan-project-root()
  (let* ((root-dir (locate-dominating-file default-directory ".git"))
	 (default-dir root-dir)
	 (find-cmd (format "find . -path \"\" -prune -o -type f -iname \"*.el\" -print"))
	 (output (shell-command-to-string find-cmd))
         (files (split-string output "[\n\r]+"))
	 (all-content "")
              rlt)
    (dolist (file files)
      (when (and(not (string= file ""))
 	(file-exists-p file))
	      (setq all-content (concat all-content
			    (with-temp-buffer
			      (insert-file-contents file)
			      (buffer-string))))))
   ;;scan root-dir
    (setq rlt (delq nil (delete-dups (sort (split-string all-content "[^a-zA-Z_-]") 'string<))))
   rlt))

(defun company-mytags (prefix)
  (let* ((all-items (company-mytags-scan-project-root))
	 (i 0)
	 (pattern "^")
	 rlt)

    (while (< i (length prefix))
      (setq pattern (concat pattern (substring prefix i (1+ i)) ".*"))
      (setq i (+ 1 i)))
    (dolist (item all-items)
      (when (string-match pattern item)
	(push item rlt))
	)
    rlt))

(defun company-prefix()
  )

(defun company-fftags (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-fftags))
    (prefix (company-grab-symbol))
    (candidates (company-mytags arg))))



(setq company-backends  '(company-fftags))
(provide 'company-tags)
;;; company-mytags.el ends here

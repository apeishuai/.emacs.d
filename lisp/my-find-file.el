(require 'ivy);optional

(defun ff1(directory &optional grep-p)
    ;;find file intrenal
   (interactive)
  (let*
      ((keyword (read-string "Please input keyword: ")))
    (when (and keyword (not (string= keyword "")))
      (let*
	  (
	   (find-cmd (format "find . -path \"*/.git\" -prune -o -type f -iname \"*%s*\" -print" keyword))
	   (grep-cmd (format "grep -rsn \"*%s*\ * " keyword))
	   (default-directory directory)
       (output (shell-command-to-string (if grep-p grep-cmd find-cmd)))
       (lines (cdr (split-string output "[\n\r]+")))
       selected-line
       )
    (message "lines = %s" lines)
    (setq selected-line (ivy-read (format "find-file in %s:" default-directory) lines))
    (when (and selected-line (file-exists-p selected-line)
	       (find-file selected-line)))
    ))))


(defun abc()
  (interactive)
  (let*
      (
       (keyword (read-string "please input: "))
       (cmd (format "find \"*%s*\" " keyword))
       ;;(cmd (format "grep -rsn \"*%s*\" *" keyword))
       (output (shell-command-to-string cmd))
       (lines (cdr (split-string output "[\n\r]+")))
       )
    (message lines)
   ))


(defun ffi(directory)
    ;;find file intrenal
   (interactive)
  (let*
      ((keyword (read-string "Please input keyword: ")))
    (when (and keyword (not (string= keyword "")))
      (let*
       ((cmd (format "find . -path \"*/.git\" -prune -o -type f -iname \"*%s*\" -print" keyword))
       (default-directory directory)
       (output (shell-command-to-string cmd))
       (lines (cdr (split-string output "[\n\r]+")))
       selected-line
       )
    (message "lines = %s" lines)
    (setq selected-line (ivy-read (format "find-file in %s:" default-directory) lines))
    (when (and selected-line (file-exists-p selected-line)
	       (find-file selected-line)))
    ))))


(defun ffr()
  ;;find file root
  (interactive)
  (ffi (locate-dominating-file default-directory ".git"))
  )

(defun fft(&optional level)
  ;;find file there or level parent directory
  (interactive "P")
  (unless level (setq level 0))
  ;;default directory
  (let*
      ((parent-directory default-directory)
       (i 0))
    (while (< i level)
      (setq parent-directory
      (file-name-directory (directory-file-name default-directory)))
      ;;directory-file-name
      ;;file-name-directory
      (setq i (+ i 1)))
    (ffi parent-directory)))

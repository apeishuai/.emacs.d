
(require 'ivy)
(defun my-find-file()
  ;;glob pattern *.c
  (interactive)
  (let* ((cmd "find . -path \"*/.git\" -prune -o -print -type f -name \"*.*\"")
         (output (shell-command-to-string cmd))
         (lines (cdr (split-string output "[\n\r]+")))
         selected-line)
    (setq selected-line (ivy-read "find-file:" lines))
    (message "selected-line=%s" selected-line)
    (when (and selected-line (file-exists-p selected-line))
    (find-file selected-line))
    ))







(defun peng-highlight-region ()
  "highlight region"
  (interactive)
  (let* ((regexp (buffer-substring (region-beginning)
                                   (region-end)))
	 (hi-lock-auto-select-face t)
	 (face (hi-lock-read-face-name)))
    (or (facep face) (setq face 'hi-yellow))
    (unless hi-lock-mode (hi-lock-mode 1))
    (hi-lock-set-pattern regexp face)))

(defun peng-unhighlight-all ()
  (interactive)
  (unhighlight-regexp t))


(provide 'my-find-file)

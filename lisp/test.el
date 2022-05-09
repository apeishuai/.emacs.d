(defun c-sort-text ()
  (interactive)

  (unless (minibufferp)
    (let ((pt (point)) (v-skip-chars "\n"))
      (if (use-region-p)

	  (save-restriction
	    (let ((bg (region-beginning))
		  (ed (region-end))
		  recfun)
	      (goto-char bg)

	      (setq recfun (if (bolp) (cons 'forward-line 'end-of-line)
			     (cons 'f-skip-chars 'forward-sexp)))

	      (narrow-to-region bg ed)

	      (f-skip-chars)
	      (sort-subr nil (car recfun) (cdr recfun))))


	(when (y-or-n-p "Sort all paragraphs?")
	  (goto-char (point-min))
	  (sort-subr nil 'f-skip-chars 'forward-paragraph)))
      (goto-char pt))))

(defun f-skip-chars (&optional start)
  (when start (goto-char start))
  (skip-chars-forward (concat " \t" v-skip-chars)))




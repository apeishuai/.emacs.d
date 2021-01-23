;;auctex conf
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

(add-hook 'LaTeX-mode-hook (lambda()
(turn-off-auto-fill)
(linum-mode 1)
(LaTeX-math-mode 1)

(setq TeX-fold-env-spec-list
      (quote ("[figure]" ("figure"))
	     ("[table]" ("table"))
	     ("[itemize]" ("itemize"))
	     ("overpic" ("overpic")))
      )


(setq TeX-view-program-list '(("zathura" "zathura %o")))
(setq TeX-view-program-selection '((output-pdf "zathura")))
(setq TeX-show-compilation nil)
(setq TeX-clean-confirm nil)
(setq TeX-save-query nil)

(setq TeX-global-PDF-mode t
      TeX-engine 'xetex)

(add-to-list 'TeX-command-list
	     '("XeLaTeX" "%'xelatex%(mode)%' %t"
	       TeX-run-TeX nil t))
(setq TeX-command-default "XeLaTeX")
			     ))


;;cdltax conf
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(add-hook 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)




(provide 'init-latexx)


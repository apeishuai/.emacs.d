(server-start)

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(require 'Racket)
(require 'StartUp)
(require 'Elpa)
(require 'Latex)
(require 'GTD)
(require 'RSS)

(custom-set-variables
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Evince")
     (output-html "xdg-open")))
 '(ledger-reports
   '(("report1" "ledger ")
     ("xx" "ledger ")
     ("test1" "ledger ")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)")))
 '(package-selected-packages
   '(ledger-mode ledger company-lsp elfeed-org nikola xpm org2blog ivy org-download auto-complete auto-company ccls lsp-mode cdlatex auto-complete-auctex geiser auctex keyfreq use-package))
 '(tool-bar-mode nil))


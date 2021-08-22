(server-start)
(add-to-list 'load-path "~/shuai-files/GTD/")
(require 'org-protocol)

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(require 'Racket)
(require 'StartUp)
(require 'Elpa)
(require 'Latex)
(require 'GTD)
(require 'RSS)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
   '(evil which-key company try ledger-mode ledger company-lsp elfeed-org nikola xpm org2blog ivy org-download auto-complete auto-company ccls lsp-mode cdlatex auto-complete-auctex geiser auctex keyfreq use-package))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

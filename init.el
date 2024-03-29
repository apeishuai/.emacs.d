(server-start)
(require 'org-protocol)

(setq org-modules '(maybe-some-module org-habit-pus maybe-some-other-module))
(setq default-directory "/media/shuai/wxf files/shuai-files/")
(setq config-directory "~/.emacs.d/lisp/")


(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))
(add-hook 'after-init-hook 'global-company-mode)

(require 'Racket)
(require 'StartUp)
(require 'Elpa)
(require 'Latex)
(require 'GTD)
(require 'RSS)
(require 'my-find-file)
;;(require 'company-mytags)
(require 'org-habit-plus)

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
   '(("balace" "ledger ")
     ("balance" "ledger")
     ("demo" "ledger ")
     ("report1" "ledger ")
     ("xx" "ledger ")
     ("test1" "ledger ")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)")))
 '(org-agenda-files
   '("/media/shuai/wxf files/shuai-files/GTD/inbox.org" "/media/shuai/wxf files/shuai-files/GTD/next.org" "/media/shuai/wxf files/shuai-files/GTD/projects.org" "/media/shuai/wxf files/shuai-files/GTD/finished.org" "/media/shuai/wxf files/shuai-files/GTD/Reference.org" "/media/shuai/wxf files/shuai-files/GTD/Trash.org"))
 '(package-selected-packages
   '(setnu mu4e-alert mu4e-views evil-mu4e mu4e winum evil which-key company try ledger-mode ledger company-lsp elfeed-org nikola xpm org2blog ivy org-download auto-complete auto-company ccls lsp-mode cdlatex auto-complete-auctex geiser auctex keyfreq use-package))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'erase-buffer 'disabled nil)

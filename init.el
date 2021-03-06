(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))


(require 'racket-mode)
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

(require 'startup)
(require 'init-elpa)
(require 'my-find-file)
(require 'ChaDefuApp)
(require 'init-racket)
(require 'init-latexx)
(require 'init-lsp)
(require 'iimage)

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
 '(package-selected-packages
   '(org-download auto-complete auto-company ccls lsp-mode cdlatex auto-complete-auctex geiser auctex keyfreq ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


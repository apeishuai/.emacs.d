(require 'package)
(setq package-enable-at-startup nil)
(setq package-check-signature nil)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                       ("melpa" . "http://elpa.emacs-china.org/melpa/")))


(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config(which-key-mode))

(use-package evil
  :ensure t
  :config(evil-mode))

(use-package keyfreq
  :ensure t
  :config
  (keyfreq-mode)
  (keyfreq-autosave-mode))

(use-package graphviz-dot-mode
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4))

(use-package cnfonts
  :ensure t
)

;;latex-package
(use-package cdlatex 
  :ensure t)

;;(use-package auto-complete-auctex 
;;  :ensure t)

(use-package auctex
  :defer t
  :ensure t)

;;scheme-package
(use-package racket-mode 
  :ensure t)

(use-package paredit
  :ensure t)



;;programming lsp environment
(use-package lsp-mode
  :ensure t
  :commands lsp)

(use-package flycheck
    :ensure t)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (push 'company-lsp company-backends))

(use-package lsp-ui
    :ensure t)


;;C++ programming
(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disable-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook((c-mode c++-mode objc-mode) . (lambda () (require 'ccls) (lsp))))



(provide 'init-elpa)
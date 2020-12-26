(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://elpa.emacs-china.org/melpa/"))


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

(use-package lsp-mode
  :ensure t
  :hook(
  (XXX-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  (c-mode . lsp-deferred))
  :commands lsp lsp-deferred)

(use-package lsp-clangd
  :load-path
  "/usr/bin/"
  :init
  (add-hook 'c-mode--hook #'lsp-clangd-c-enable)
  (add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
  (add-hook 'objc-mode-hook #'lsp-clangd-objc-enable))


(provide 'elpa)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)
(split-window-right)
(auto-image-file-mode t)

(other-window 1)
(switch-to-next-buffer)

(other-window 1)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) 
(add-hook 'window-setup-hook #'toggle-frame-maximized)


(provide 'startup)



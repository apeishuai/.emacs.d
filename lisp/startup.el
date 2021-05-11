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

(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode))

(provide 'startup)



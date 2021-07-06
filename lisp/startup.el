;; 路径设置
(add-to-list 'load-path "~/htmlize")
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))



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

(defun position-to-kill-ring ()
  "Copy to the kill ring a string in the format \"file-name:line-number\"
for the current buffer's file name, and the line number at point."
  (interactive)
  (kill-new
   (format "%s:%d" (buffer-file-name) (save-restriction
                                        (widen) (line-number-at-pos)))))

(define-key global-map (kbd "C-c p") 'position-to-kill-ring)

(provide 'startup)



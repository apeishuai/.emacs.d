;;picture-show
(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

(blink-cursor-mode 0)
;;环境变量设置
(setenv "root-linux-shuai-files" "/media/shuai/wxf files/shuai-files/")
(setenv "root-windows-shuai-files" "/media/shuai/wxf files/shuai-files/")

;; 路径设置
(add-to-list 'load-path "~/htmlize")
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)
;;(split-window-right)
(auto-image-file-mode t)

;;(other-window 1)
;;(switch-to-next-buffer)
;;(other-window 1)

(tool-bar-mode 0)
(menu-bar-mode 0)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) 
(add-hook 'window-setup-hook 'toggle-frame-maximized)

(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode))


(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-16"))

(defun position-to-kill-ring ()
  "Copy to the kill ring a string in the format \"file-name:line-number\"
for the current buffer's file name, and the line number at point."
  (interactive)
  (kill-new
   (format "%s:%d" (buffer-file-name) (save-restriction
                                        (widen) (line-number-at-pos)))))

(define-key global-map (kbd "C-c p") 'position-to-kill-ring)
(define-key global-map (kbd "C-c m") 'position-to-kill-ring)

(autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

;;open link using google-chrome
(setq browse-url-generic-program
       (executable-find "google-chrome"))

;;winum (windows)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))


;;显示行号
(require 'display-line-numbers)
(set 'display-line-numbers-certain-modes '(org-mode))
(defun display-line-numbers--turn-on ()
  "turn on line numbers in certain majore modes defined in `display-line-numbers-certain-modes'"
  (if (and
       (member major-mode display-line-numbers-certain-modes)
       (not (minibufferp)))
      (display-line-numbers-mode)))

(global-display-line-numbers-mode t)

;;自动保存
(require 'auto-save)            ;; 加载自动保存模块

(auto-save-enable)              ;; 开启自动保存功能
;;(setq auto-save-slient t)       ;; 自动保存的时候静悄悄的， 不要打扰我


;;文本排序 读书列表
(defun sort-booklist ()
"
sort structed entry
1 title 2 tags 3 status 4 start-time 5 end-time 6 intro
"
(interactive)
(let* (
       (keyword (read-string "1 title 2 tags 3 status 4 start-time 5 end-time 6 intro \nplease input sort methods: " ))
       (key-regexp (concat "\\" keyword))
       (record-regexp "* Title: 《\\(.*\\)》\n.*Tags: \\(.*\\)\n.*Status: \\(.*\\)\n.*Start-Time: \\(.*\\)\n.*End-Time: \\(.*\\)\n.*Intro: \\(.*\\)"))
  (sort-regexp-fields nil record-regexp key-regexp
                      (region-beginning)
                      (region-end))))




(provide 'StartUp)



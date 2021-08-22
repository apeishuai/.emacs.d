;; use an org file to organise feeds
(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")
	))


(setq elfeed-show-entry-switch #'elfeed-display-buffer)
(defun elfeed-display-buffer (buf &optional act)
  (pop-to-buffer buf)
  (set-window-text-height (get-buffer-window) (round (* 0.7 (frame-height)))))


(defun elfeed-search-show-entry-pre (&optional lines)
  "Returns a function to scroll forward or back in the Elfeed
  search results, displaying entries without switching to them."
    (lambda (times)
      (interactive "p")
      (forward-line (* times (or lines 0)))
      (recenter)
      (call-interactively #'elfeed-search-show-entry)
      (select-window (previous-window))
      (unless elfeed-search-remain-on-entry (forward-line -1))))


(defun elfeed-scroll-up-command (&optional arg)
  "Scroll up or go to next feed item in Elfeed"
  (interactive "^P")
  (let ((scroll-error-top-bottom nil))
    (condition-case-unless-debug nil
        (scroll-up-command arg)
      (error (elfeed-show-next)))))

(defun elfeed-scroll-down-command (&optional arg)
  "Scroll up or go to next feed item in Elfeed"
  (interactive "^P")
  (let ((scroll-error-top-bottom nil))
    (condition-case-unless-debug nil
        (scroll-down-command arg)
      (error (elfeed-show-prev)))))


(defun elfeed-tag-selection-as (mytag)
    "Returns a function that tags an elfeed entry or selection as
MYTAG"
    (lambda ()
      "Toggle a tag on an Elfeed search selection"
      (interactive)
      (elfeed-search-toggle-all mytag)))

;;Tag with a single letter keybind:


(defun elfeed-show-eww-open (&optional use-generic-p)
  "open with eww"
  (interactive "P")
  (let ((browse-url-browser-function #'eww-browse-url))
    (elfeed-show-visit use-generic-p)))

(defun elfeed-search-eww-open (&optional use-generic-p)
  "open with eww"
  (interactive "P")
  (let ((browse-url-browser-function #'eww-browse-url))
    (elfeed-search-browse-url use-generic-p)))
;;key-binding
(global-set-key (kbd "C-x r") 'elfeed)
(define-key elfeed-show-mode-map (kbd "b") 'efleed-show-eww-open)
(define-key elfeed-search-mode-map (kbd "B") 'efleed-search-eww-open)
(define-key elfeed-search-mode-map (kbd "n") (elfeed-search-show-entry-pre +1))
(define-key elfeed-search-mode-map (kbd "p") (elfeed-search-show-entry-pre -1))
(define-key elfeed-search-mode-map (kbd "C-RET") (elfeed-search-show-entry-pre))
(define-key elfeed-show-mode-map (kbd "SPC") 'elfeed-scroll-up-command)
(define-key elfeed-show-mode-map (kbd "C-SPC") 'elfeed-scroll-down-command)
(define-key elfeed-search-mode-map "l" (elfeed-tag-selection-as 'readlater))
(define-key elfeed-search-mode-map "d" (elfeed-tag-selection-as 'junk))


(provide 'RSS)

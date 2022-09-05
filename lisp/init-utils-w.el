;;; init-utils-w.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Open shell sanityly
(defun wullic/eshell (&optional arg)
  "Split vertical window sanity and open eshell"
  (interactive "P")
  (let ((height (/ (window-total-height) 4)))
    (split-window-vertically (- height))
    (switch-window)
    (eshell arg)))

;; @see https://github.com/kyagi/shell-pop-el
(when (maybe-require-package 'shell-pop)
  (setq shell-pop-term-type "eshell")
  (global-set-key (kbd "<C-M-return>") 'shell-pop))

(provide 'init-utils-w)
;;; init-utils-w.el ends here

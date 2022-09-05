;;; init-view-w.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; highlight-indent-guides
(when (maybe-require-package 'highlight-indent-guides)
  ;; (setq highlight-indent-guides-method 'bitmap)
  ;; (setq highlight-indent-guides-bitmap-function 'highlight-indent-guides--bitmap-dots)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character ?\u254e)
  (add-hook 'prog-mode-hook (lambda ()
                              (highlight-indent-guides-mode t)
                              (set-face-background 'highlight-indent-guides-character-face (face-attribute 'default :background))
                              (set-face-background 'highlight-indent-guides-odd-face "darkgray")
                              (set-face-background 'highlight-indent-guides-even-face "dimgray")
                              (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
                              )))

(provide 'init-view-w)
;;; init-view-w.el ends here

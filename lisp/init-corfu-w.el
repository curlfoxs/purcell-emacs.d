;;; init-corfu-w.el --- interactive completion in buffers -*- lexical-binding: t -*-
;;; commentary:
;;; code:

;; waiting: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; todo default sort order should place [a-z] before punctuation


(when (maybe-require-package 'corfu)
  (setq-default corfu-auto-delay 0.1)
  (setq corfu-auto-prefix 2)
  ;; TODO: https://github.com/jdtsmith/kind-icon
  )


(provide 'init-corfu-w)
;;; init-corfu-w.el ends here

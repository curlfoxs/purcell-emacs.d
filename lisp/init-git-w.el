;;; init-git-w.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; delta
;;---------------------------------------------------------------------
;; @see delta https://github.com/dandavison/delta
;; Install package delta and add following lines to .gitconfig
;; [core]
;;     pager = delta

;; [interactive]
;;     diffFilter = delta --color-only
;; [add.interactive]
;;     useBuiltin = false # required for git 2.37.0

;; [delta]
;;     navigate = true    # use n and N to move between diff sections
;;     light = false      # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)

;; [merge]
;;     conflictstyle = diff3

;; [diff]
;;     colorMoved = default
;;---------------------------------------------------------------------

(when (and (executable-find "delta") (maybe-require-package 'magit-delta))
  (add-hook 'magit-mode-hook (lambda() (magit-delta-mode +1))))


;; Solve "Not a valid starting-point" in creating new branch
;; @see https://github.com/magit/magit/issues/3647
(setq magit-branch-read-upstream-first 'fallback)

(provide 'init-git-w)
;;; init-git-w.el ends here

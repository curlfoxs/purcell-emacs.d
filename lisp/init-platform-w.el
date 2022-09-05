;;; init-platform-w.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Emacs support for MS Windows
;; @see https://www.emacswiki.org/emacs/EmacsForWindows
;; @see http://www.manpagez.com/info/emacs/emacs_651.php
;; @see https://www.gnu.org/software/emacs/manual/html_mono/efaq-w32.html
(defconst *is-a-ms-win* (eq system-type 'windows-nt))

(when *is-a-ms-win*
  ;; make CTRL+ALT valid in MS windows
  (setq w32-recognize-altgr nil))



;; Emacs support for Macbook
;; Option as meta key
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(provide 'init-platform-w)
;;; init-platform-w.el ends here

;;; init-minibuffer-w.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(with-eval-after-load 'vertico
  (define-key vertico-map (kbd "RET") 'vertico-directory-enter)
  (define-key vertico-map (kbd "DEL") 'vertico-directory-delete-char)
  (define-key vertico-map (kbd "M-DEL") 'vertico-directory-delete-word)
  (define-key vertico-map (kbd "C-c C-o") 'embark-export)
  (define-key vertico-map (kbd "C-c C-c") 'embark-act)
  (define-key vertico-map (kbd "C-.") 'embark-act))



(require-package 'consult-dir)
(require-package 'consult-yasnippet)
(require-package 'consult-projectile)


;; embark-split-action
(with-eval-after-load 'embark
  (eval-when-compile
    (defmacro my/embark-split-action (fn split-type)
      `(defun ,(intern (concat "my/embark-"
                               (symbol-name fn)
                               "-"
                               (car (last  (split-string
                                            (symbol-name split-type) "-"))))) ()
         (interactive)
         (funcall #',split-type)
         (call-interactively #',fn))))

  ;; (define-key embark-)
  (embark-define-keymap embark-file-map     (kbd "3") (my/embark-split-action find-file sanityinc/split-window))
  (embark-define-keymap embark-file-map     (kbd "e") 'wullic/eshell)
  (embark-define-keymap embark-buffer-map   (kbd "3") (my/embark-split-action switch-to-buffer sanityinc/split-window))
  (embark-define-keymap embark-bookmark-map (kbd "3") (my/embark-split-action bookmark-jump sanityinc/split-window)))

(provide 'init-minibuffer-w)
;;; init-minibuffer-w.el ends here

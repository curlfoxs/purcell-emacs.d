;;; init-evil.el --- Insert description here -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

;;---------------------------------------------------------------------
;; Cpp Headerise
;;---------------------------------------------------------------------
(defun curlfoxs/headerise-cpp ()
  "Add minimal header and footer to an elisp buffer in order to placate flycheck."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert  "#include<bits/stdc++.h>\n\n"
             "using namespace std;\n\n"
             "#define ll long long\n#define ar array\n\nconst int mxN=2e5;\nint n;\n"
             "int main() {\n\n}"))
  )

;;---------------------------------------------------------------------
;; Commands needed in these packages
;;---------------------------------------------------------------------
(require-package 'general)
(require-package 'expand-region)
(require-package 'evil)


(global-set-key (kbd "C-;") nil)
(global-set-key (kbd "C-M-;") 'avy-goto-char-timer)
(global-set-key (kbd "C-v") nil)
(global-set-key (kbd "C-v") 'yank);
;;---------------------------------------------------------------------
;; Other config
;;---------------------------------------------------------------------
;; (global-linum-mode t)
(tab-bar-mode 1)
(setq display-line-numbers-type 'relative)

(defun compileandrun()
  (interactive)
  (let* ((src (file-name-nondirectory (buffer-file-name)))
         (exe (file-name-sans-extension src)))
    (if *is-a-ms-win*
        (compile (concat "g++ " src " -o " exe " &&  " exe ) t)
      (compile (concat "g++ " src " -o " exe " &&timeout 1s ./" exe ) t)
      )))
(global-unset-key (kbd "C-v"))
(global-set-key (kbd "C-v") 'clipboard-yank)
(global-unset-key (kbd "C-v"))
(global-set-key (kbd "C-a") 'evil-first-non-blank)
;;---------------------------------------------------------------------
;; Evil package config
;;---------------------------------------------------------------------
;; Use emacs basic bindings
(setq evil-disable-insert-state-bindings t)
;; (setq evil-move-beyond-eol t)
;; (setq evil-move-cursor-back nil)
(setq evil-want-minibuffer t)

(add-hook 'after-init-hook 'evil-mode)

(defvar wullic-leader-map (make-sparse-keymap)
  "Keymap for \" Wullic leader key\" shortcuts")

(defun wullic/evil-return (arg)
  (interactive "p")
  (evil-insert 1)
  (newline-and-indent)
  (evil-normal-state))

(with-eval-after-load 'evil
  (evil-define-key 'normal 'org-mode-map (kbd "TAB") 'org-cycle)
  (evil-define-key '(normal insert) 'global     (kbd "C-u") 'evil-force-normal-state)
  (evil-define-key '(normal motion) 'global
    (kbd "C-v") 'scroll-up-command
    (kbd "C-k") 'paredit-kill
    (kbd "C-o") 'open-line
    (kbd "C-r") 'isearch-repeat-backward
    (kbd "C-y") 'yank
    (kbd "C-e") 'move-end-of-line
    (kbd "C-n") 'next-line
    (kbd "C-p") 'previous-line
    (kbd "C-f") 'forward-char
    (kbd "C-b") 'backward-char
    (kbd "C-x C-p") 'mark-page
    (kbd "C-t") 'transpose-chars
    (kbd "C-d") 'paredit-forward-delete
    (kbd "C-a") 'move-beginning-of-line
    (kbd "C-w") 'kill-region
    (kbd "C-i") 'indent-for-tab-command

    (kbd "C-.") nil
    (kbd "M-.") nil
    (kbd "M-y") 'yank-pop
    (kbd "C-m") 'wullic/evil-return
    (kbd "e") 'er/expand-region
    (kbd "m") 'set-mark-command
    (kbd "M") 'exchange-point-and-mark
    (kbd "H") 'paredit-backward
    (kbd "L") 'paredit-forward
    (kbd "J") 'paredit-backward-up
    (kbd "K") 'kill-sexp
    (kbd ",") (general-simulate-key "C-x")
    (kbd "C-,") (general-simulate-key "C-x")
    (kbd "C-x ,") 'exchange-point-and-mark
    ;; (kbd ".") (general-simulate-key "C-c")
    (kbd "SPC") wullic-leader-map))


;; Leader key config
(add-hook 'special-mode-hook
          (lambda () (define-key special-mode-map (kbd ",") (general-simulate-key "C-x"))))
;; (add-hook 'special-mode-hook
;; (lambda () (define-key special-mode-map (kbd ".") (general-simulate-key "C-c"))))
(add-hook 'special-mode-hook
          (lambda () (define-key special-mode-map (kbd "SPC") wullic-leader-map)))
(add-hook 'help-mode-hook
          (lambda () (define-key special-mode-map (kbd "SPC") wullic-leader-map)))
(when (maybe-require-package 'magit)
  (add-hook 'magit-mode-hook
            (lambda () (define-key magit-mode-map (kbd "SPC") wullic-leader-map))))
(add-hook 'magit-diff-mode-hook (lambda () (define-key magit-diff-mode-map (kbd "SPC") wullic-leader-map)))
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "SPC") wullic-leader-map)))
(add-hook 'org-agenda-mode-hook (lambda () (define-key org-agenda-mode-map (kbd "SPC") wullic-leader-map)))
;; (add-hook 'org-agenda-mode-hook (lambda () (define-key org-agenda-mode-map (kbd "SPC") wullic-leader-map)))

(general-evil-setup)
(general-auto-unbind-keys)
(general-nmap
  :state '(normal motion visual emacs)
  :override t
  :prefix "SPC"
  :prefix-map 'wullic-leader-map
  ;; "bb" 'previous-buffer
  ;; "bf" 'next-buffer
  "0" 'delete-window
  "1" 'delete-other-windows
  "2" 'split-window-below
  "3" 'split-window-right
  "4" (general-simulate-key "C-x 4")
  "5" (general-simulate-key "C-x 5")
  ;; "c" 'my-query-replace-prefix
  "a" 'comment-line
  "d" 'dired-jump
  "ee" 'sanityinc/eval-last-sexp-or-region
  "el" 'sanityinc/load-this-file
  "ff" 'find-file
  "fr" 'consult-recent-file
  "fd" 'consult-dir
  "fR" 'rename-this-file-and-buffer
  "fD" 'delete-this-file
  "fs" 'consult-buffer
  "fp" 'previous-buffer
  "fn" 'next-buffer
  "fk" 'kill-buffer
  "gr" 'consult-ripgrep
  "ga" 'consult-ag
  "gg" 'consult-git-grep
  "h" 'help-command
  "i" 'curlfoxs/headerise-cpp
  ;; "jx" 'exchange-point-and-mark
  ";" 'avy-goto-char-timer 
  ;; ";l" 'avy-goto-line ;;
  "jc" 'avy-copy-line;; 「j」 Means jump
  "jl" 'consult-goto-line
  "jd" 'xref-find-definitions
  "jo" 'consult-outline
  "js" 'xref-find-apropos
  "jr" 'xref-find-references
  "k"  'consult-buffer
  ;; "lgg" 'conslut-git-grep ;; 「l」 Meas list， 它和consult的意思有异曲同工之妙。
  ;; "lgr" 'consult-ripgrep
  "ll" 'consult-line
  "lm" 'consult-line-multi
  "lo" 'consult-outline
  "li" 'consult-imenu
  "ly" 'consult-yasnippet
  "le" 'consult-flymake
  ;; "lim" 'consult-imenu-multi
  ;; "ls" 'consult-buffer
  "mm" 'magit-status ;; 「m」 Means magit
  "mc" 'magit-clone
  "mh" 'magit-log-buffer-file
  "md" 'magit-file-dispatch
  "mx" 'magit-file-checkout
  "mb" 'consult-bookmark  ;; 「m」 Means mark
  "mf" 'bookmark-set ;; mark file
  "mr" 'consult-register
  "ml" 'consult-register-store  ;; mark line
  "o" 'switch-window
  "p" (general-simulate-key "C-c p")
  "q" 'save-buffers-kill-emacs
  "r" 'consult-recent-file
  "s" 'save-buffer
  "t" 'consult-buffer
  "wo" 'wg-open-workgroup
  "wk" 'wg-kill-workgroup
  "wc" 'wg-create-workgroup
  "wp" 'winner-undo
  "wn" 'winner-redo
  ;; "x" #'compileandrun
  "x" 'quickrun-shell
  "y" 'browse-kill-ring
  "SPC" 'cycle-spacing
  "," 'winner-undo
  "." 'winner-redo
  "u" 'undo-redo)
;; (general-auto-unbind-keys t)

(global-set-key (kbd "C-'") 'undo-redo)
(global-set-key (kbd "M-<left>") 'previous-buffer)
(global-set-key (kbd "M-<right>") 'next-buffer)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)

(provide 'init-evil-w)
;;; init-evil.el ends here

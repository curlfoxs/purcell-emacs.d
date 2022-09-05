;;; init-yasnippet-w.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package yasnippet
  :ensure t
  :hook
  (prog-mode . yas-minor-mode)
  (text-mode . yas-minor-mode)
  :config
  ;; (yas-global-mode 1)
  (use-package yasnippet-snippets
    :ensure t)
  ;; (yas-reload-all)
  )

(with-eval-after-load 'yasnippet
  (diminish 'yas-global-mode)
  (diminish 'yas-minor-mode))

(provide 'init-yasnippet-w)
;;; init-yasnippet-w.el ends here

;;; init-eglot-w.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; For Emacs >= 27
(setq read-process-output-max (* 1024 1024))


(when (maybe-require-package 'eglot)
  (maybe-require-package 'consult-eglot)
  ;; Add execute file findding
  (with-eval-after-load 'eglot
    (when (executable-find "typescript-language-server")
      (add-to-list 'eglot-server-programs '((js-mode typescript-mode) . ("typescript-language-server"))))
    (when (and *is-a-mac*  (executable-find "ccls"))
      ;;---------------------------------------------------------------------
      ;; c++-mode
      ;;---------------------------------------------------------------------
      (add-to-list 'eglot-server-programs '(c++-mode . ("ccls"
                                                        "--init"
                                                        "{
\"clang\": {
\"extraArgs\": [
\"--stdlib=libc++\",
\"-isystem/usr/local/include\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0/include\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks\"
],
\"resourceDir\": \"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0\"
}
}")))
      ;;---------------------------------------------------------------------
      ;; c-mode
      ;;---------------------------------------------------------------------

      (add-to-list 'eglot-server-programs '(c-mode . ("ccls"
                                                      "--init"
                                                      "{
\"clang\": {
\"extraArgs\": [
\"-isystem/usr/local/include\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0/include\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include\",
\"-isystem/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks\"
],
\"resourceDir\": \"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0\"
}
}")))

      )

    (when (and *is-a-ms-win* (executable-find "clangd"))
      (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

    (when (executable-find "omnisharp")
      (add-to-list 'eglot-server-programs '(csharp-mode . ( "omnisharp" "-lsp"))))
    )

  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'csharp-mode-hook 'eglot-ensure)
  (add-hook 'js-mode-hook 'eglot-ensure)
  (add-hook 'typescript-mode-hook 'eglot-ensure)

  )

;;---------------------------------------------------------------------
;; js-mode
;;---------------------------------------------------------------------
(when (maybe-require-package 'js2-mode)
  (with-eval-after-load 'js-mode
    (define-key js-mode-map (kbd "M-h") 'js2-mark-defun)
    (define-key js2-mode-map (kbd "M-h") 'js2-mark-defun)))


;;---------------------------------------------------------------------
;; tabwidth
;;---------------------------------------------------------------------
;; (setq-default c-basic-offset 4)
(require-package 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;;---------------------------------------------------------------------
;; Quickrun
;;---------------------------------------------------------------------
(require-package 'quickrun)
(add-hook 'c-mode-common-hook (lambda()
                                (quickrun-add-command "c++/c11"
                                  '((:command . "g++")
                                    (:exec    . ("%c -std=c++11 %o -o %e %s"
                                                 "%e %a"))
                                    (:remove  . ("%e")))
                                  :default "c++")))

(global-set-key (kbd "<f5>") 'quickrun-shell)





(provide 'init-eglot-w)
;;; init-eglot.el ends here

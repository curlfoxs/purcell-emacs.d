;;; init-themes-w.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; Font customize

;; (set-frame-font "Iosevka-14" nil t)
;; (set-frame-font "DejaVu Sans Mono-10" nil t)
;; (set-frame-font "Menlo-14" nil t)


;; Random color themes

;; (require-package 'modus-themes)
(require-package 'doom-themes)
(require-package 'tangotango-theme)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'leuven-theme)
(require-package 'srcery-theme)
(require-package 'solarized-theme)
(require-package 'spacemacs-theme)


;;---------------------------------------------------------------------
;; Theme
;;---------------------------------------------------------------------
(defun counsel-load-theme (theme)
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme)
  )

(defun reapply-themes-spec (theme)
  (interactive)
  (setq custom-enabled-themes '(theme))
  (reapply-themes))


;;---------------------------------------------------------------------
;; dimmer config
;;---------------------------------------------------------------------
(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.3))


;;---------------------------------------------------------------------
;; redguardtoo themes config
;;---------------------------------------------------------------------
(defun pickup-random-color-theme (themes)
  "Pickup random color theme from THEMES."
  (let* ((available-themes (mapcar 'symbol-name themes))
	 (theme (nth (random (length available-themes)) available-themes)))
    (counsel-load-theme (intern theme))
    (message "Color theme [%s] loaded." theme)))

(defvar wullic-favorite-dark-themes
  '(
    ;; modus-operandi
    ;; srcery
    ;; doom-dracula
    ;; doom-gruvbox
    ;; doom-molokai
    ;; doom-monokai-classic
    ;; doom-monokai-machine
    ;; doom-monokai-octagon
    ;; doom-monokai-pro
    ;; doom-monokai-spectrum
    ;; doom-material-dark
    ;; doom-moonlight
    ;; doom-xcode
    ;; ;; doom-nova
    ;; doom-nord
    ;; doom-zenburn
    ;; deeper-blue
    ;; tango-dark
    ;; leuven-dark
    ;; solarized-dark-high-contrast
    ;; solarized-gruvbox-dark
    ;; sanityinc-solarized-dark
    ;; sanityinc-tomorrow-blue
    ;; sanityinc-tomorrow-eighties
    ;; sanityinc-tomorrow-night
    spacemacs-dark)
  "My favorite dark themes.")

(defvar wullic-favorite-light-themes
  '(
    ;; solarized-gruvbox-light
    ;; modus-vivendi
    ;; sanityinc-solarized-light
    ;; sanityinc-tomorrow-day
    spacemacs-dark
    )
  "My favorite light themes.")

(defvar wullic-favorite-color-themes
  (append wullic-favorite-dark-themes wullic-favorite-light-themes)
  "My favorite color themes.")

;; random color theme
(defun wullic/random-favorite-color-theme ()
  "Random color theme."
  (interactive)
  (pickup-random-color-theme (or wullic-favorite-color-themes
				    (custom-enable-themes))))

(defun wullic/random-favorite-light-theme ()
  "Random light theme."
  (interactive)
  (pickup-random-color-theme (or wullic-favorite-light-themes
				 (custom-enable-themes))))

(defun wullic/random-favorite-dark-theme ()
  "Random dark theme."
  (interactive)
  (pickup-random-color-theme (or wullic-favorite-color-themes
				    (custom-enable-themes))))

(wullic/random-favorite-color-theme)


(provide 'init-themes-w)
;;; init-themes-w.el ends here


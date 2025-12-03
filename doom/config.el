;; User
(setq user-full-name "Zakky"
      user-mail-address "niku.raul@gmail.com")

;; Theme
(add-to-list 'custom-theme-load-path "~/.config/doom/themes/")
(load-theme 'doom-nord t)
(after! doom-themes
  (unless (display-graphic-p)
    (set-face-background 'default "undefined")))

;; Remove Top Frame
(add-to-list 'default-frame-alist '(undecorated . t))

;; Fonts
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 16 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 16)
      doom-big-font (font-spec :family "Iosevka Nerd Font" :size 26 :weight 'bold))

;; Bar
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-lsp-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-height 33
      doom-modeline-bar-width 5)

;; Syntax Highlighting in SRC Blocks
(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-hide-block-startup nil
      org-src-preserve-indentation nil
      org-edit-src-content-indentation 0)

;; Line Numbers/Wrapping & Confirm Emacs On Close
(setq display-line-numbers-type t)
(global-visual-line-mode t)
(setq confirm-kill-emacs nil)

;; Org Directory & Beautiful Org Headers
(setq org-directory "~/Org/")
(after! org
  (add-hook 'org-mode-hook #'org-superstar-mode)
  (setq org-superstar-headline-bullets-list
        '("◉" "●" "○" "◆" "●" "○" "◆")))

;; Org Fancy Priorities
(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚑" "▲" "»")))

;; Org Tangle
(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

;; Browser
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "zen")

;; Version Control
(setq vc-handled-backends '(Git))

;; Optimizations
(setq gc-cons-threshold (* 256 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq comp-deferred-compilation t)
(setq comp-async-jobs-number 8)

;; Fix Xorg Issues
(setq x-no-window-manager t)
(setq frame-inhibit-implied-resize t)
(setq focus-follows-mouse nil)

;; Auto Save & Auto Clean Garbage
(setq delete-by-moving-to-trash t)
(setq auto-save-default t)

;; Some More Optimizations
(setq gcmh-idle-delay 5)
(setq gcmh-high-cons-threshold (* 1024 1024 1024))

;; TreeSitter
(after! tree-sitter
  (require 'tree-sitter-langs)
  (add-to-list 'tree-sitter-major-mode-language-alist '(org-mode . go)))

;; Lsp
(after! lsp-mode
  (setq lsp-idle-delay 0.5
        lsp-log-io nil
        lsp-completion-provider :capf
        lsp-enable-file-watchers nil
        lsp-enable-folding nil
        lsp-enable-text-document-color nil
        lsp-enable-on-type-formatting nil
        lsp-enable-snippet nil
        lsp-enable-symbol-highlighting nil
        lsp-enable-links nil
        lsp-go-hover-kind "Synopsis"
        lsp-go-analyses '((fieldalignment . t)
                          (nilness . t)
                          (unusedwrite . t)
                          (unusedparams . t))
        lsp-gopls-completeUnimported t
        lsp-gopls-staticcheck t
        lsp-gopls-analyses '((unusedparams . t)
                             (unusedwrite . t))))
(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-max-height 8
        lsp-ui-doc-max-width 72
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-delay 0.5
        lsp-ui-sideline-enable nil
        lsp-ui-peek-enable t))

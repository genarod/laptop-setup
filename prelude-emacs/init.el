;;; init.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025 Genaro Díaz
;;
;; Author: Genaro Díaz <genarodiazchourio@gmail.com>
;; Maintainer: Genaro Díaz <genarodiazchourio@gmail.com>
;; Created: March 09, 2025
;; Modified: March 09, 2025
;; Version: 0.0.1
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary: init file for Prelude Emacs
;;; to be used instead of Doom Emacs
;;
;;  Description
;;
;;; Code:

;; This file should be placed in ~/.emacs.d/personal/init.el

;; This section is for selecting utf-8 as encoding
;; Needed to dismiss early warnings
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)
(set-language-environment "UTF-8")

;; Enable desktop save mode to restore previous session
(desktop-save-mode 1)
(setq desktop-restore-eager 5) ;; Load the first 5 buffers eagerly
(setq desktop-save t) ;; Always save desktop without asking

;; Enable visual line mode (line wrapping) in Org mode
(add-hook 'org-mode-hook #'auto-fill-mode)
(setq truncate-lines 1)

;; Changes to improve Org mode
(require 'prelude-org)
(setq org-hide-leading-stars t)
(setq org-startup-indented t)
(setq org-todo-keywords '((sequence "TODO" "WAIT" "DONE")))

;; Change font
(setq default-frame-alist '((font . "PT Mono")))

;; Add doom-modeline
(doom-modeline-mode 1)

;;; init.el ends here

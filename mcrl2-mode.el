;;; mcrl2-mode.el --- Major mode for mCRL2 specifications. -*- lexical-binding: t -*-

;; Copyright (C) 2017 Erik Post

;; Author   : Erik Post <erik@shinsetsu.nl>
;; Homepage : https://github.com/epost/mcrl2-mode
;; Version  : 0.1.0
;; Keywords : languages

;;; Commentary:

;; Emacs integration for mCRL2 specifications

;;; Code:


;; TODO Inside your hook put this: (setq comment-start "% "). Also, this will explain why:
(defconst mcrl2-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?% "< 1" table)
    (modify-syntax-entry ?\n "> " table)
    table))


;;(set-face-foreground 'font-lock-type-face "LightSlateGrey")

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html
(setq mcrl2-highlights
      '(("sort\\|act\\|proc\\|init\\|struct\\|sum" . font-lock-keyword-face)
        ("Bool\\|Nat" . font-lock-type-face)
        ("allow\\|comm" . font-lock-builtin-face)
        (":\\|\\.\\|\\+\\|\|\\|!\\|#\\|\<\>" . font-lock-constant-face)))

(define-derived-mode mcrl2-mode fundamental-mode "mcrl2"
  "major mode for editing mCRL2 specifications."
  :syntax-table mcrl2-mode-syntax-table
  (setq font-lock-defaults '(mcrl2-highlights))

  (setq-local comment-start "\%")
  (setq-local comment-end "")
)

(provide 'mcrl2)

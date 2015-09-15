;; modes I want all the time

;; ---- ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; ---- Textmate mode
(require 'textmate)
(textmate-mode)

;; ---- dired
(setq ls-lisp-use-insert-directory-program t)
(setq insert-directory-program "gls")

;; --- tabs
(setq-default indent-tabs-mode nil)

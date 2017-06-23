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
;; hack so that tabs don't end up in my Elixir code
(add-hook 'before-save-hook (lambda () (untabify (point-min) (point-max))))

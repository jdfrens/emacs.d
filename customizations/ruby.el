;; ---- Ruby

(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)

(require 'ruby-tools)
(require 'ruby-electric)
(ruby-electric-mode t)
(require 'ruby-block)
(ruby-block-mode t)
;; (require 'rails)

(setq ruby-insert-encoding-magic-comment nil)

(defun my-ruby-mode-hook ()
  (flymake-ruby-load)
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  )

(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;; rbenv
(setenv "PATH"
        (concat
         (getenv "HOME") "/.rbenv/shims:"
         (getenv "HOME") "/.rbenv/bin:"
         (getenv "PATH")))
(setq exec-path
      (cons (concat (getenv "HOME") "/.rbenv/shims")
            (cons (concat (getenv "HOME") "/.rbenv/bin")
                  exec-path)))

;; auto mode
(mapc
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . ruby-mode)))
 '("\\.rb\\'"  "\\.rake\\'" "\\.gemspec\\'" "\\.ru\\'"
   "Gemfile\\'" "Rakefile\\'" "Guardfile\\'"))

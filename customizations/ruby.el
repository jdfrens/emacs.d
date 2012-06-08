;; ---- Ruby

(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)

(require 'ruby-tools)
(require 'ruby-electric)
(ruby-electric-mode t)
(require 'ruby-block)
(ruby-block-mode t)

(setq ruby-insert-encoding-magic-comment nil)

(defun my-ruby-mode-hook ()
  (flymake-ruby-load)
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  )

(defadvice compile (around set-default-directory (command &optional comint))
  "Use the textmate default directory"
  (let ((default-directory (textmate-project-root)))
    ad-do-it))
(ad-activate 'compile)

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

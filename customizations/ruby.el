(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

;; ---- Ruby

(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)

(setq ruby-deep-indent-paren nil)

;; (require 'ruby-tools)
;; (require 'ruby-electric)
;; (ruby-electric-mode t)
;; (require 'ruby-block)
;; (ruby-block-mode t)
(require 'ruby-compilation)

(setq ruby-insert-encoding-magic-comment nil)

(defun my-ruby-mode-hook ()
  (flymake-ruby-load)
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (local-set-key (kbd "C-c a r")
                 (lambda () (interactive)
                   (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))
  (local-set-key (kbd "C-c t a")
                 (lambda () (interactive)
                   (run-rails-tests)))
  (local-set-key (kbd "C-c t f")
                 (lambda () (interactive)
                   (run-rails-file-tests)))
  (local-set-key (kbd "C-c t g")
                 (lambda () (interactive)
                   (run-rails-group-tests)))
  )
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

(defun bundle-exec-rake-test-command (&optional test-group args)
  "concats a rake command for running tests"
  (concat
   "bundle exec rake test"
   (if test-group (concat ":" test-group) "")
   " "
   args
   )
  )

(defun run-rails-tests ()
  "Run the rails tests."
  (interactive)
  (compile (bundle-exec-rake-test-command))
  )

(defvar rails-test-environments-alist
  '(("unit" . "units")
    ("functional" . "functionals")
    ("integration" . "integration")
    ("external" . "externals")
    ))

(defun buffer-test-environment ()
  (let ((path (split-string (buffer-file-name-project-relative) "/")))
    (unless (string-match-p "test" (car path))
      (error "Not in a test directory in your project!"))
    (cdr (assoc (cadr path) rails-test-environments-alist))
    ))

(defun run-rails-group-tests (&optional args)
  "Run a group of rails tests."
  (interactive)
  (compile (bundle-exec-rake-test-command (buffer-test-environment) args))
  )

(defun run-rails-file-tests ()
  "Run a single file of rails tests."
  (interactive)
  (run-rails-group-tests (concat "TEST=" (buffer-file-name-project-relative)))
  )

;; rbenv
(setenv "PATH"
        (concat
         (getenv "PATH")
         (getenv "HOME") "/.rbenv/shims:"
         (getenv "HOME") "/.rbenv/bin:"
         ))
(setq exec-path
      (append
       exec-path
       (list (concat (getenv "HOME") "/.rbenv/shims")
             (concat (getenv "HOME") "/.rbenv/bin"))
       ))

;; https://gist.github.com/fujin/5173680
;; don't indent so much!
(setq ruby-deep-indent-paren nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; auto mode
(mapc
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . ruby-mode)))
 '("\\.rb\\'"  "\\.rake\\'" "\\.gemspec\\'" "\\.ru\\'" "\\.god\\'" "\\.rabl\\'"
   "Gemfile\\'" "Rakefile\\'" "Guardfile\\'"))

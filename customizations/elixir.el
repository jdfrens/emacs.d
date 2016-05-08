(require 'elixir-mode)

(add-to-list 'elixir-mode-hook
             (defun auto-activate-ruby-end-mode-for-elixir-mode ()
               (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
                    "\\(?:^\\|\\s-+\\)\\(?:do\\)")
               (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
               (ruby-end-mode +1)))

(defun my-elixir-mode-hook ()
  (setq indent-tabs-mode nil)
  )
(add-hook 'elixir-mode-hook 'my-elixir-mode-hook)

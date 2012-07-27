;; ---- Markdown

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(defun my-markdown-mode-hook ()
  (auto-fill-mode "off")
  (longlines-mode)
  (longlines-show-hard-newlines)
  )

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)

;; auto mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

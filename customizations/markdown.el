;; ---- Markdown

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

;; auto mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; ---- Markdown

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(defun my-markdown-mode-hook ()
  (auto-fill-mode -1)
  (visual-line-mode t)
  )

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)

;; auto mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

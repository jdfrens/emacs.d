;; ---- compilation mode
(global-set-key (kbd "C-c C-c") 'recompile)

(defadvice compile (around set-default-directory (command &optional comint))
  "Use the textmate default directory"
  (let ((default-directory (textmate-project-root)))
    ad-do-it))
(ad-activate 'compile)

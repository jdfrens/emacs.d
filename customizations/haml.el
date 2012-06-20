(defun my-haml-mode-hook ()
  (setq indent-tabs-mode nil)
  )

(add-hook 'haml-mode-hook 'my-haml-mode-hook)

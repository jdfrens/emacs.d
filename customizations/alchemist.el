;; auto mode
(add-hook 'alchemist-mode-hook
          (lambda ()
            (if (string-suffix-p "_spec.exs" (buffer-name)) (alchemist-test-mode))
            ))

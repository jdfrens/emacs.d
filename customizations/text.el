;; ---- Text mode

(add-hook 'text-mode-hook
          (function
           (lambda ()
             (auto-fill-mode t)
             (setq fill-column 70)
             )))

;; start in text mode...
(setq initial-major-mode 'text-mode)

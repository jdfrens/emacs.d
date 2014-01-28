;; auto mode
(mapc
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . scss-mode)))
 '("\\.scss\\'")
 )

(setq scss-compile-at-save nil)

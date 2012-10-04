;; auto mode
(mapc
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . scss-mode)))
 '("\\.scss\\'")
 )

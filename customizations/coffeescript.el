(defun my-coffee-mode-hook ()
  "coffee-mode-hook"

  ;; CoffeeScript uses two spaces.
  (make-local-variable 'tab-width)
  (set 'tab-width 2)
  )

(add-hook 'coffee-mode-hook 'my-coffee-mode-hook)

;; auto mode
(mapc
 (lambda (pattern)
   (add-to-list 'auto-mode-alist `(,pattern . coffee-mode)))
 '("\\.coffee\\'" "Cakefile\\'")
 )

;; ---- Matlab

(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)

(defun my-matlab-mode-hook ()
  (setq matlab-function-indent t)
  (setq fill-column 76)
  (turn-on-auto-fill))

(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;; auto mode
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))

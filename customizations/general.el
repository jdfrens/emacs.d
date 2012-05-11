;; --- window functions
(defun development-windows ()
  "setup the windows I like for development"
  (interactive)
  (set-frame-size (selected-frame) 200 65)
  (split-window-right)
  (split-window-below)
  )

;; ---- indentation settings and functions
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; ---- autopair settings
(require 'autopair)
(setq autopair-autowrap t)

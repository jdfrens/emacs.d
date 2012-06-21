(defun buffer-file-name-project-relative ()
  "Returns the relative path from the project's root as determined by textmate.el."
  (substring (buffer-file-name) (length (textmate-project-root)))
  )

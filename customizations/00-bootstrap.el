(set-face-attribute 'default nil :font "SourceCodePro-Regular")

;; ---- Global Defaults and Preferences

(setq inhibit-startup-message t)

;; ---- key bindings

;; NONSTANDARD, but incredibly useful
(global-set-key "\C-\\" 'call-last-kbd-macro)

;; use S-left, S-right, etc. to move between windows
(windmove-default-keybindings)

;; to move buffers to different windows
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)
(global-unset-key [(super p)])

;; ---- general preferences

;; NONSTANDARD
;; To prevent emacs from immediately dying if I accidentally hit C-x C-c
;; with all of my files saved.
(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "Really kill Emacs? "))
            kill-emacs-query-functions))
(fset 'yes-or-no-p (symbol-function 'y-or-n-p))

(global-auto-revert-mode t)

;; parentheses
(show-paren-mode 1)

;; line numbers in gutter
(setq linum-format "%4d ")
(global-linum-mode 1)

;; disable dangerous commands
(put 'capitalize-region 'disabled t)
(put 'downcase-region   'disabled t)
(put 'upcase-region     'disabled t)
;; enable useful commands
(put 'eval-expression   'disabled nil)
(put 'zap-to-char       'disabled nil)

;; whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; backup files hidden away
(setq backup-directory-alist
      '(("." . "~/.emacs.d/backup")))
;; clean out old backup files
(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files "~/.emacs.d/backup" t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))

;; file for in-app settings
(setq custom-file "~/.emacs.d/emacs-customizations.el")
(load custom-file)

;; executable path
(exec-path-from-shell-initialize)

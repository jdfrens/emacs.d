;; ---- Global Defaults and Preferences

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

;; ---- general preferences

;; NONSTANDARD
;; To prevent emacs from immediately dying if I accidentally hit C-x C-c
;; with all of my files saved.
(setq kill-emacs-query-functions
      (cons (lambda () (yes-or-no-p "Really kill Emacs? "))
            kill-emacs-query-functions))

(global-auto-revert-mode t)
(show-paren-mode 1)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p (symbol-function 'y-or-n-p))
(linum-mode 1)

;; disable dangerous commands
(put 'capitalize-region 'disabled t)
(put 'downcase-region   'disabled t)
(put 'upcase-region     'disabled t)
;; enable useful commands
(put 'eval-expression   'disabled nil)
(put 'zap-to-char       'disabled nil)

;; ---- whitespace handling
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; backup files hidden away
(setq backup-directory-alist
      '(("." . "~/.emacs.d/backup")))

;; file for in-app settings
(setq custom-file "~/.emacs.d/emacs-customizations.el")
(load custom-file)

(require 'cl)

;; --- Make sure the required packages are installed

(defvar packages-list
  '(textmate

    ace-jump-mode
    clojure-mode
    clojure-test-mode
    coffee-mode
    css-mode
    elixir-mode
    haml-mode
    haskell-mode
    markdown-mode
    nyan-mode
    rspec-mode
    ruby-mode
    rust-mode
    sass-mode
    scss-mode
    yaml-mode

    yasnippet
    clojure-snippets
    elixir-yasnippets

    flymake
    flymake-easy
    flymake-elixir
    flymake-ruby

    inf-ruby
    rinari
    ruby-block
    ruby-compilation
    ruby-electric
    ruby-tools

    ack-and-a-half
    auctex
    auctex-latexmk
    autopair
    buffer-move
    cider
    dash
    dired+
    elein
    epl
    ess
    ess-smart-underscore
    exec-path-from-shell
    expand-region
    findr
    iedit
    inflections
    jump
    mark-multiple
    multiple-cursors
    nrepl
    pkg-info
    s
    volatile-highlights)
  "List of packages needs to be installed at launch")

(defun has-package-not-installed ()
  (loop for p in packages-list
        when (not (package-installed-p p)) do (return t)
        finally (return nil)))
(when (has-package-not-installed)
  ;; Check for new packages (package versions)
  (message "%s" "Get latest versions of all packages...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (dolist (p packages-list)
    (when (not (package-installed-p p))
      (package-install p))))

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

;; Otherwise starts in root directory
(setq command-line-default-directory "~/")

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
               (> (- current (float-time (nth 5 (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))

;; file for in-app settings
(setq custom-file "~/.emacs.d/emacs-customizations.el")
(load custom-file)

;; executable path
(exec-path-from-shell-initialize)

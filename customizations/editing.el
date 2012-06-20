;; Better join-lin keybinding
(global-set-key (kbd "M-j") (lambda () (interactive) (forward-line) (join-line)))

;; keybinding for dired-jump
(global-set-key (kbd "C-x C-j") 'dired-jump)

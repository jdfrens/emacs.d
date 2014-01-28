;; Better join-line keybinding
(global-set-key (kbd "M-j") (lambda () (interactive) (forward-line) (join-line)))

;; keybinding for dired-jump
(global-set-key (kbd "C-x C-j") 'dired-jump)

;; Move more quickly
;; http://whattheemacsd.com//key-bindings.el-02.html
(global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f") (lambda () (interactive) (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") (lambda () (interactive) (ignore-errors (backward-char 5))))

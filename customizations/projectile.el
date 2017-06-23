(require 'projectile)

(setq projectile-enable-caching t)
(setq projectile-globally-ignored-directories
      (append
       '("node_modules" ".svn")
       projectile-globally-ignored-directories))

(projectile-mode t)
(projectile-global-mode)

(setq projectile-sort-order (quote recently-active))

(setq projectile-switch-project-action 'neotree-projectile-action)

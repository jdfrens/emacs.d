;; ----- yaml

(autoload 'yaml-mode "yaml-mode" "YAML mode" t)

;; auto mode
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$"  . yaml-mode))

;; ---- YASnippets

(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory '("~/.emacs.d/mysnippets"
                           "~/.emacs.d/elpa/yasnippet-0.6.1/snippets"))
(mapc 'yas/load-directory yas/root-directory)

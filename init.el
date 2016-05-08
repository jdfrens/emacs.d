;; -*- mode: Emacs-Lisp -*-

;;You may use this file as specified under the GNU General Public License
;; .gnuemacs file

;; Author: Jeremy D. Frens (jdfrens@gmail.com)
;; parts of these files maybe date from the early 1990s
;; part were (inspired by)/(stolen from) Erik Hilsdale

;; ---- the load path

(add-to-list 'load-path "~/.emacs.d/icicles/")

;; ---- use emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; ---- packages

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t) ;; from emacs-prelude
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/"))

;; load my customizations
(mapc
 (function
  (lambda (file)
    (load (substring file 0 -3))))
 (file-expand-wildcards "~/.emacs.d/customizations/*.el"))

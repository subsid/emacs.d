(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/eyecandy"))

(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)

(setq package-enable-at-startup nil)
(setq use-package-always-ensure t)
(setq inhibit-compacting-font-caches t)

;; Activate installed packages
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'my-gen)
(require 'my-global)
; (require 'my-mac-clipboard-seperation)
; (require 'my-projects)
(require 'my-eyecandy)
;;(require 'my-evil)
;;(require 'evil-bypass-clipboard)
; (require 'my-elisp)
; (require 'my-dired)
; (require 'my-ibuffer)
;; (require 'my-magit)
(require 'my-helm)
(require 'my-org)
(require 'my-org-roam)
(require 'my-auto-complete)
;; (require 'my-coffee)
; (require 'my-leader-keys)
; (require 'my-path)
; (require 'my-parens)

;; Language
;; (require 'my-clojure)
;; (require 'my-sml)

;; snippets
;; (require 'my-snippets)


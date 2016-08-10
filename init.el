(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/eyecandy"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)

(setq package-enable-at-startup nil)
(setq use-package-always-ensure t)

;; Activate installed packages
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(require 'my-gen)
(require 'my-mac-clipboard-seperation)
(require 'my-projects)
(require 'my-eyecandy)
;;(require 'my-evil)
;;(require 'evil-bypass-clipboard)
(require 'my-elisp)
(require 'my-dired)
(require 'my-ibuffer)
(require 'my-magit)
(require 'my-helm)
(require 'my-org)
(require 'my-auto-complete)
(require 'my-coffee)
(require 'my-leader-keys)
(require 'my-path)
(require 'my-parens)
;; Language
(require 'my-clojure)
(require 'my-sml)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands
   (quote
    (("x" "custom agenda view"
      ((agenda "" nil)
       (tags "TODO=\"INPROGRESS\"" nil)
       (tags "TODO=\"TODO\"+SCHEDULED=\"\"" nil))
      nil nil)
     ("h" "Daily habits"
      ((agenda "" nil))
      ((org-agenda-show-log t)
       (org-agenda-ndays 7)
       (org-agenda-log-mode-items
	(quote
	 (state)))
       (org-agenda-skip-function
	(quote
	 (org-agenda-skip-entry-if
	  (quote notregexp)
	  ":daily:")))))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-string-face ((t (:foreground "#CC9393")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

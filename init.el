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
; (require 'my-auto-complete)
;; (require 'my-coffee)
; (require 'my-leader-keys)
; (require 'my-path)
; (require 'my-parens)

;; Language
;; (require 'my-clojure)
;; (require 'my-sml)

;; snippets
;; (require 'my-snippets)

; (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ; '(package-selected-packages
 ;   '(zoom-window zenburn-theme yaml-mode whole-line-or-region use-package undo-tree smartparens ox-reveal org-superstar nlinum neotree markdown-mode ledger-mode htmlize helm-projectile helm-cider helm-ag expand-region exec-path-from-shell elisp-slime-nav dired-subtree company-ycmd ace-window)))
; (custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-custom-commands
   (quote
    (("x" "daily status"
      ((agenda ""
	       ((org-agenda-prefix-format " %i %-12:c%?-12t% s %?e ")
		(org-agenda-skip-function
		 (quote
		  (org-agenda-skip-entry-if
		   (quote todo)
		   (quote
		    ("INPROGRESS")))))))
       (tags "TODO=\"INPROGRESS\"-work" nil)
       (tags "work+TODO=\"INPROGRESS\"|work+TODO=\"TODO\"" nil)
       (tags "TODO=\"TODO\"+SCHEDULED=\"\"-work-chores" nil))
      nil nil)
     ("l" "Tasks closed in last week" tags "CLOSED>=\"<-1w>\""
      ((org-agenda-view-columns-initially t))))))
 '(package-selected-packages
   '(zoom-window zenburn-theme yaml-mode whole-line-or-region use-package undo-tree smartparens org-superstar nlinum neotree markdown-mode ledger-mode htmlize expand-region exec-path-from-shell elisp-slime-nav dired-subtree company-ycmd ace-window))
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

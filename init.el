(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/eyecandy"))

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
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
(require 'my-global)
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
    (("x" "daily status"
      ((agenda ""
	       ((org-agenda-prefix-format " %i %-12:c%?-12t% s %?e ")))
       (tags "TODO=\"INPROGRESS\"" nil)
       (tags "work+TODO=\"INPROGRESS\"|work+TODO=\"TODO\"" nil)
       (tags "TODO=\"TODO\"+SCHEDULED=\"\"-work" nil))
      nil nil)
     ("l" "Tasks closed in last week" tags "CLOSED>=\"<-1w>\""
      ((org-agenda-view-columns-initially t))))))
 '(org-columns-default-format
   "%25ITEM %TODO %Effort{:}(Estimated Effort) %CLOCKSUM(Time Spent) %CLOSED %SCHEDULED %DEADLINE"))
 '(package-selected-packages
   (quote
    (ycmd elpy zoom-window zenburn-theme yaml-mode whole-line-or-region use-package tangotango-theme sml-mode smartparens org-pomodoro org-journal org-bullets org ob-ipython nlinum neotree move-text markdown-mode magit htmlize helm-swoop helm-projectile helm-flycheck helm-cider helm-ag flycheck-ycmd expand-region evil-leader elisp-slime-nav company-ycmd coffee-mode ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-string-face ((t (:foreground "#CC9393")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

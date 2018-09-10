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
(require 'my-tex)

;; Language
(require 'my-clojure)
(require 'my-sml)

;; snippets
(require 'my-snippets)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ledger-reports
   (quote
    (("liabilities-reimbursements" "ledger -f /Users/subsid/Dropbox/notes/ledger.dat bal Assets:Reimbursements:Roommates:Cedar402 Liabilities:Roommates:Cedar402")
     ("budget-all" "%(binary) --budget --add-budget -p \"this year\" -f /Users/subsid/Dropbox/notes/ledger.dat register Expenses")
     ("bal" "ledger -f /Users/subsid/Dropbox/notes/ledger.dat bal --depth 2")
     ("personal-budget" "%(binary) --budget -p \"this month\" -f /Users/subsid/Dropbox/notes/ledger.dat register Expenses:Personal")
     ("stock" "%(binary) -f /Users/subsid/Dropbox/notes/ledger.dat bal IRA")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)")
     ("budget" "%(binary) -f /Users/subsid/Dropbox/notes/ledger.dat --budget --add-budget -p \"this month\" register not Expenses:Phone and not Expenses:Holiday and not Expenses:Fees:Masters and Expenses")
     ("creditcard" "ledger -f ~/Dropbox/notes/ledger.dat bal Liabilities:Creditcard"))))
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
 '(org-columns-default-format
   "%25ITEM %TODO %Effort{:}(Estimated Effort) %CLOCKSUM(Time Spent) %CLOSED %SCHEDULED %DEADLINE")
 '(package-selected-packages
   (quote
    (ox-reveal org-reveal org-reveal-root latex-preview-pane dired-subtree tex auctex yasnippet ledger-mode ox-rss zoom-window zenburn-theme yaml-mode whole-line-or-region use-package tangotango-theme sml-mode smartparens org-pomodoro org-journal org-bullets org ob-ipython nlinum neotree move-text markdown-mode magit htmlize helm-swoop helm-projectile helm-flycheck helm-cider helm-ag flycheck-ycmd expand-region evil-leader elpy elisp-slime-nav company-ycmd coffee-mode ace-window))))
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

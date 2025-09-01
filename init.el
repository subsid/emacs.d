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
(require 'my-keychain)
(require 'use-package)
(require 'my-gen)
(require 'my-global)
;; (require 'my-mac-clipboard-seperation)
;; (require 'my-projects)
;;(require 'my-evil)
;;(require 'evil-bypass-clipboard)
;; (require 'my-elisp)
;; (require 'my-dired)
;; (require 'my-ibuffer)
;; (require 'my-magit)
;; (require 'my-helm)
(require 'my-org)
(require 'my-org-roam)
(require 'my-auto-complete)
;; (require 'my-coffee)
;; (require 'my-leader-keys)
;; (require 'my-path)
;; (require 'my-parens)

;; Language
;; (require 'my-clojure)
;; (require 'my-sml)

;; snippets
;; (require 'my-snippets)
(require 'my-eyecandy)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7"
     default))
 '(ledger-accounts-file "/home/ssubramaniyam/Dropbox/notes/finance/accounts.dat")
 '(ledger-reports
   '(("monthly-budget"
      "/home/ssubramaniyam/.local/bin/ledger [[ledger-mode-flags]] -f ~/Dropbox/notes/finance/ledger.dat budget -p \"this month\" not '(Expenses:Holiday|Expenses:Urgent|Expenses:Purchases|Expenses:Personal:Learning|Expenses:CreditCard|Expenses:Personal:Memberships|Expenses:Govt:USA:Taxes:Turbotax|Expenses:Giveback)' and Expenses -X $")
     ("yearly-expenses"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat -p \"this year\" reg Expenses")
     ("liabilities-reimbursements"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal Liabilities --depth 2")
     ("bal"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --depth 2")
     ("monthly-expenses"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat -p \"this month\" reg not Expenses:Taxes and Expenses")
     ("monthly-include-unbudgeted"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat budget -p \"this month\" --add-budget not '(Expenses:Holiday|Expenses:Urgent|Expenses:Purchases|Expenses:Personal:Learning|Expenses:CreditCard|Expenses:Personal:Memberships|Expenses:Govt:USA:Taxes:Turbotax|Expenses:Giveback)' and Expenses -X $")
     ("yearly-only-budget"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat budget -p \"this year\" '(Expenses:Holiday|Expenses:Urgent|Expenses:Purchases|Expenses:Personal:Learning|Expenses:CreditCard|Expenses:Personal:Memberships|Expenses:Govt:USA:Taxes:Turbotax|Expenses:Giveback)' -X $")
     ("creditcard"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat cleared Liabilities:CreditCard --empty --depth 3")
     ("networth"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --depth 2 ^assets ^liabilities --market")
     ("investments"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --flat Assets:Bank:Schwab:Brokerage Assets:Investments")
     ("revenue"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal -p \"this year\" --depth 2 Revenues")
     ("investment-portfolio"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --percent --market --depth 3 Assets:Bank Assets:Investments")
     ("yearly-budget-all"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat budget -p \"this year\"  --depth 2 --add-budget not Expenses:Taxes and not Expenses:Benefits and Expenses -X $")
     ("revenue-nonsalary"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --depth 3 not Revenues:.*:Paycheck and Revenues")
     ("revenue-minus-taxes"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --depth 2 Revenues Expenses:Taxes:")
     ("bank-bals"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --flat Assets:Bank:* Assets:Investments:Fixed:Cash:* Assets:Venmo Assets:Giftcard")
     ("yearly-holiday"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --depth 5 Expenses:Holiday:2025")
     ("benefits"
      "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal -p \"this year\" --depth 4 Expenses:Benefits")))
 '(org-agenda-custom-commands
   '(("x" "daily status - what is happening this week"
      ((agenda ""
	       ((org-agenda-prefix-format " %i %-12:c%?-12t% s %?e ")
		(org-agenda-skip-function
		 '(org-agenda-skip-entry-if 'todo '("DOING")))))
       (tags "TODO=\"DOING\"" nil))
      nil)
     ("l" "Tasks closed in last week" tags "CLOSED>=\"<-1w>\""
      ((org-agenda-view-columns-initially t)))
     ("t" "Unplanned TODOs   " tags-todo
      "TODO=\"TODO\"-CATEGORY=\"Chores\"+DEADLINE=\"\"+SCHEDULED=\"\""
      nil)))
 '(org-agenda-files
   '("~/workspace/subsid.github.io/content/posts/2019-02-20-sed-rename.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20230120234155-linux_hacks.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20221230110743-wedding.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20221230163349-tasks.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20221229153746-karpathy_videos.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20230106090140-12in23.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20221230163215-emacs.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20230110003719-dad_visa.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20221230162940-chores.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20230106010312-taxes.org"
     "/home/ssubramaniyam/Dropbox/notes/org_roam/pages/20230101115035-elisp.org"))
 '(package-selected-packages
   '(ace-window beacon company consult doom-themes exec-path-from-shell
		expand-region ledger-mode orderless org-roam
		org-superstar ox-reveal sqlite3 undo-tree vertico
		whole-line-or-region zenburn-theme zoom-window))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

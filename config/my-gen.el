;; Plugins
; (use-package markdown-mode
;   :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (progn
    (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
    (when (daemonp)
      (exec-path-from-shell-initialize))
    ))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (global-set-key (kbd "C-\\") 'beacon-blink)
)

(use-package ledger-mode
  :ensure t
  :init
  (setq ledger-clear-whole-transactions 1)
  (setq ledger-accounts-file (expand-file-name "~/Dropbox/notes/finance/accounts.dat"))
  (setq ledger-init-file-name (expand-file-name "~/Dropbox/notes/finance/.ledgerrc"))
  (setq ledger-complete-in-steps t)
  :custom
  (ledger-reports
   (quote
    (("liabilities-reimbursements" "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal Liabilities --depth 2")
     ("budget-year" "%(binary) --budget --add-budget -p \"this year\" -f ~/Dropbox/notes/finance/ledger.dat register Expenses")
     ("bal" "ledger -f ~/Dropbox/notes/finance/ledger.dat bal --depth 2")
     ("personal-budget" "%(binary) --budget -p \"this month\" -f ~/Dropbox/notes/finance/ledger.dat register Expenses:Personal")
     ("reg-expenses" "%(binary) -f ~/Dropbox/notes/finance/ledger.dat -p \"this month\" reg not Expenses:Phone and not Expenses:Holiday and not Expenses:Masters:Fees and not Expenses:Urgent and not Expenses:Interview and Expenses")
     ("unbudgeted" "%(binary) -f ~/Dropbox/notes/finance/ledger.dat --unbudgeted -p \"this month\" register not Exnnpenses:Phone and not Expenses:Holiday and not Expenses:Masters:Fees and not Expenses:Urgent and not Expenses:Interview and not Expenses:Rent:.*:Deposit$ and Expenses")
     ("budget" "%(binary) -f ~/Dropbox/notes/finance/ledger.dat --budget -p \"this month\" register not Expenses:Phone and not Expenses:Holiday and not Expenses:Masters:Fees and not Expenses:Urgent and not Expenppses:Interview and not Expenses:Rent:.*:Deposit$ and Expenses")
     ("creditcard" "%(binary) -f ~/Dropbox/notes/finance/ledger.dat cleared Liabilities:CreditCard --empty --depth 3")
     ("forecast-budget" "ledger -f ~/Dropbox/notes/finance/ledger.dat -p \"from this year\" --forecast \"d<[2019]\" bal Expenses --depth 2")
     ("networth" "%(binary) -f ~/Dropbox/notes/finance/ledger.dat bal --depth 2 ^assets ^liabilities"))))
  :mode "\\.dat\\'"
  :config
  (add-hook 'ledger-mode-hook
            (lambda ()
              (setq-local tab-always-indent 'complete)
              (setq-local completion-cycle-threshold t)
              (setq-local ledger-complete-in-steps t)))
  )

(use-package whole-line-or-region
  :ensure t
  :config
  (whole-line-or-region-global-mode))

;; Zoom in/out of one buffer.
(use-package zoom-window
  :ensure t
  :config
  (global-set-key (kbd "C-x C-o") 'zoom-window-zoom)
  (setq zoom-window-mode-line-color "DarkGreen"))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C--") 'ace-window))

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
  (global-set-key (kbd "C-;") 'avy-goto-char))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1)
  :custom
  (undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
)



;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(provide 'my-gen)


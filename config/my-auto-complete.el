(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (global-set-key (kbd "C-.") 'company-complete-common-or-cycle)))

(add-hook 'ledger-mode-hook
	  (lambda ()
	    (setq-local tab-always-indent t)
	    (setq-local completion-ignore-case t)))

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :bind
  (:map vertico-map

	("C-f" . vertico-exit)
	("C-j" . vertico-next)
	("C-k" . vertico-previous)
	:map minibuffer-local-map
	("C-l" . vertico-directory-delete-word))
  )

(use-package consult
  :ensure t

  )

(provide 'my-auto-complete)

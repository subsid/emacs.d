(use-package company
  :ensure t
  :config
  (progn
;;    (add-hook 'after-init-hook 'global-company-mode)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (global-set-key (kbd "C-.") 'company-complete-common-or-cycle)))

(add-hook 'ledger-mode-hook
	  (lambda ()
	    (setq-local tab-always-indent 'complete)
	    (setq-local completion-ignore-case t)))


(provide 'my-auto-complete)

(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (global-set-key (kbd "C-.") 'company-complete-common-or-cycle)))

(use-package ycmd
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-ycmd-mode)
    (set-variable 'ycmd-server-command
		  '("bash" "/Users/siddharth/workspace/ycmd/run_ycmd.sh"))))

(use-package company-ycmd
  :ensure t
  :config
  (company-ycmd-setup))

(provide 'my-auto-complete)

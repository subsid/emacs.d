(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "C-'") 'company-complete-common-or-cycle)))

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

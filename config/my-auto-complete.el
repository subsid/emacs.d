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
    (setq ycmd-global-modes '(not emacs-lisp-mode org-mode helm-mode))
    (add-hook 'after-init-hook 'global-ycmd-mode)
    (setq home (shell-command-to-string "printf %s \"$HOME\""))
    (set-variable 'ycmd-server-command
                  (list (concat home "/.virtualenvs/global3/bin/python") (concat home "/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd")))))

(use-package company-ycmd
  :ensure t
  :config
  (company-ycmd-setup))

(provide 'my-auto-complete)

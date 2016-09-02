(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)))

;; (use-package ycmd
;;   :ensure t
;;   :config)

;; (use-package company-ycmd
;;   :ensure t
;;   :config
;;   (company-ycmd-setup))

(provide 'my-auto-complete)

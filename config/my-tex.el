(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))

(use-package latex-preview-pane
  :ensure t)

(provide 'my-tex)

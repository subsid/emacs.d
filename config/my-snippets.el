(use-package yasnippet
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (add-hook 'latex-mode-hook #'yas-minor-mode)
  :config
  (yas-global-mode 1)
  ;; (yas-reload-all)
  ;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
  ;; (define-key yas-minor-mode-map (kbd "TAB") nil)
  ;; (define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)
  ;; Bind `C-c y' to `yas-expand' ONLY.
  (define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)
  (define-key yas-minor-mode-map (kbd "C-c SPC") #'company-yasnippet))

(provide 'my-snippets)

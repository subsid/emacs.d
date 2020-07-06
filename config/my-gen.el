;; Plugins
(use-package markdown-mode
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (progn
    (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
    ))

(use-package yaml-mode
  :ensure t)

(use-package nlinum 
  :ensure t
  :config
  (progn
    ;; Preset width nlinum
    (add-hook 'nlinum-mode-hook
	      (lambda ()
		(setq nlinum--width
		      (length (number-to-string
			       (count-lines (point-min) (point-max)))))))))

(use-package ledger-mode
  :ensure t
  :init
  (setq ledger-clear-whole-transactions 1)
  :config
  :mode "\\.dat\\'")

(use-package whole-line-or-region
  :ensure t
  :config
  (whole-line-or-region-mode))


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
  (global-undo-tree-mode 1))

(use-package ox-reveal
  :ensure t
  :config
  (setq org-reveal-root "/Users/subsid/Library/reveal.js")
  (setq org-reveal-title-slide nil))

(provide 'my-gen)



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
	    (setq-local tab-always-indent "complete")
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
  :config
  (global-set-key (kbd "C-x b") 'consult-buffer)
  (global-set-key (kbd "C-c r") #'my/consult-ripgrep-in-directory)
  (global-set-key (kbd "C-c f") #'my/consult-find-in-subdirectories)
)

(defun my/consult-find-in-subdirectories ()
  "Use `consult-find` to search for files in the current directory and its subdirectories."
  (interactive)
  (let ((dir (read-directory-name "Find directory: ")))
    (consult-fd dir)))

(defun my/consult-ripgrep-in-directory (dir)
  "Run `consult-ripgrep` in a specific directory DIR."
  (interactive "DRipGrepDirectory: ")
  (consult-ripgrep dir))

(defvar-local consult-toggle-preview-orig nil)

(defun consult-toggle-preview ()
  "Command to enable/disable preview."
  (interactive)
  (if consult-toggle-preview-orig
      (setq consult--preview-function consult-toggle-preview-orig
            consult-toggle-preview-orig nil)
    (setq consult-toggle-preview-orig consult--preview-function
          consult--preview-function #'ignore)))

(define-key vertico-map (kbd "M-P") #'consult-toggle-preview)

(provide 'my-auto-complete)

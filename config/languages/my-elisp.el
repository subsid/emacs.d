(use-package elisp-slime-nav
  :commands (elisp-slime-nav-mode)
  :ensure elisp-slime-nav
  :demand elisp-slime-nav
  :config
  (progn
    (defun my-lisp-hook ()
      (elisp-slime-nav-mode)
      (eldoc-mode))
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)))

(provide 'my-elisp)

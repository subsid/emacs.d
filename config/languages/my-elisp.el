(use-package elisp-slime-nav
  :commands (elisp-slime-nav-mode)
  :ensure elisp-slime-nav
  :demand elisp-slime-nav
  :config
  (progn
    (after 'evil
       (evil-define-key 'normal emacs-lisp-mode-map (kbd "K") 'elisp-slime-nav-describe-elisp-thing-at-point)
       (defun my-lisp-hook ()
         (elisp-slime-nav-mode)
         (eldoc-mode))
       (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook))))

(provide 'my-elisp)

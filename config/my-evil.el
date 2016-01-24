(use-package evil
  :commands (evil-mode)
  :ensure evil
  :demand evil
  :init
  (setq evil-want-C-w-in-emacs-state t)
  (setq evil-want-C-u-scroll t)
  :config
  (progn
    (evil-mode t)
    (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
      'elisp-slime-nav-describe-elisp-thing-at-point)
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    ;; Easy toggle to emacs state.
    (define-key evil-normal-state-map "\C-\\" 'evil-emacs-state)
    (define-key evil-insert-state-map "\C-\\" 'evil-emacs-state)
    (define-key evil-visual-state-map "\C-\\" 'evil-emacs-state)
    (define-key evil-emacs-state-map "\C-\\" 'evil-exit-emacs-state)))

(use-package evil-leader
  :commands (evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader ","))

(provide 'my-evil)

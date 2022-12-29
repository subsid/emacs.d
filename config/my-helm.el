;; my-helm.el
;;
;; Settings for Helm, an interactive narrowing and completion framework.

(use-package helm
  :ensure helm
  ; :config
  ; (progn
  ;   (setq helm-buffers-fuzzy-matching t 
	  ; helm-recentf-fuzzy-match    t)
  ;   (setq helm-M-x-fuzzy-match t)
  ;   (setq helm-split-window-default-side (quote other))
  ;   (setq helm-split-window-in-side-p nil)
  ;   (defun my-helm-in-ido (buffer)
  ;     "Display a helm buffer in ido. Send the purists screaming."
  ;     (interactive)
  ;     (ido-buffer-internal 'display 'display-buffer nil nil nil 'ignore))
  ;     (setq helm-display-function 'helm-default-display-buffer)
  ;     (setq helm-adaptive-history-file "~/.emacs.d/helm-adapative-history")

  ;     (require 'helm-files)
  ;     (require 'helm-config))

    ; (after 'projectile
    ;   (use-package helm-projectile
    ;     :ensure helm-projectile
	; :config
	; (setq projectile-completion-system 'helm)
	; (helm-projectile-on))) 

    ; (defun helm-jump ()
    ;   "Find files with helm, but be smart about buffers and recent files."
    ;   (interactive)
    ;   (let ((helm-ff-transformer-show-only-basename nil))
    ;     (helm-other-buffer '(helm-projectile-sources-list
    ;                          helm-source-buffers-list
    ;                          helm-source-recentf
    ;                          helm-source-bookmarks
    ;                          helm-source-file-cache
    ;                          helm-source-files-in-current-dir
    ;                          helm-source-locate
    ;                          helm-source-buffer-not-found)
    ;                        "*helm jump*")))
    )

(global-set-key "\M-x" 'helm-M-x)
(global-set-key "\M-i" 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
(global-set-key "\M-y" 'helm-show-kill-ring)
(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)


(provide 'my-helm)


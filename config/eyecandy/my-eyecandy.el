(use-package zenburn-theme
   :ensure zenburn-theme
   :config
   (progn
     (unless noninteractive
     (load-theme 'zenburn t))))

(global-hl-line-mode t)
(set-face-background 'hl-line "#3e4446")

;; Show parentheses
(show-paren-mode 1)

(provide 'my-eyecandy)

;; my-leader-keys.el
;;
;; <leader> keybindings for evil-leader

(evil-leader/set-key
  ;; gen stuff
  "w" 'save-buffer
  "a" 'org-agenda
  "q" 'kill-buffer-and-window
  "v" 'split-window-right
  "h" 'dired-jump
  ">" 'find-file-at-point
  "B" 'ibuffer
  "f" 'ido-find-file
  "k" 'ido-kill-buffer
  "d" 'neotree-toggle
  "e" 'pp-eval-last-sexp
  "b" 'helm-mini
  "x" 'helm-M-x
  "ss" 'helm-swoop
  "i" 'helm-imenu
  "," 'ace-jump-mode)

(provide 'my-leader-keys)

(use-package ibuffer
  :commands ibuffer
  :ensure ibuffer
  :config
  (progn
     (after 'evil
       (evil-set-initial-state 'ibuffer-mode 'normal)
       (evil-define-key 'normal ibuffer-mode-map
         (kbd "m") 'ibuffer-mark-forward
         (kbd "u") 'ibuffer-unmark-forward
         (kbd "=") 'ibuffer-diff-with-file
         (kbd "j") 'ibuffer-jump-to-buffer
         (kbd "M-g") 'ibuffer-jump-to-buffer
         (kbd "M-s a C-s") 'ibuffer-do-isearch
         (kbd "M-s a M-C-s") 'ibuffer-do-isearch-regexp
         (kbd "M-s a C-o") 'ibuffer-do-occur
         (kbd "DEL") 'ibuffer-unmark-backward
         (kbd "M-DEL") 'ibuffer-unmark-all
         (kbd "* *") 'ibuffer-unmark-all
         (kbd "* M") 'ibuffer-mark-by-mode
         (kbd "* m") 'ibuffer-mark-modified-buffers
         (kbd "* u") 'ibuffer-mark-unsaved-buffers
         (kbd "* s") 'ibuffer-mark-special-buffers
         (kbd "* r") 'ibuffer-mark-read-only-buffers
         (kbd "* /") 'ibuffer-mark-dired-buffers
         (kbd "* e") 'ibuffer-mark-dissociated-buffers
         (kbd "* h") 'ibuffer-mark-help-buffers
         (kbd "* z") 'ibuffer-mark-compressed-file-buffers
         (kbd ".") 'ibuffer-mark-old-buffers

         (kbd "d") 'ibuffer-mark-for-delete
         (kbd "C-d") 'ibuffer-mark-for-delete-backwards
         (kbd "x") 'ibuffer-do-kill-on-deletion-marks
         ;; immediate operations
         (kbd "n") 'ibuffer-forward-line
         (kbd "SPC") 'forward-line
         (kbd "p") 'ibuffer-backward-line
         (kbd "M-}") 'ibuffer-forward-next-marked
         (kbd "M-{") 'ibuffer-backwards-next-marked
         (kbd "l") 'ibuffer-redisplay
         (kbd "g") 'ibuffer-update
         "`" 'ibuffer-switch-format
         "-" 'ibuffer-add-to-tmp-hide
         "+" 'ibuffer-add-to-tmp-show
         "b" 'ibuffer-bury-buffer
         (kbd ",") 'ibuffer-toggle-sorting-mode
         (kbd "s i") 'ibuffer-invert-sorting
         (kbd "s a") 'ibuffer-do-sort-by-alphabetic
         (kbd "s v") 'ibuffer-do-sort-by-recency
         (kbd "s s") 'ibuffer-do-sort-by-size
         (kbd "s f") 'ibuffer-do-sort-by-filename/process
         (kbd "s m") 'ibuffer-do-sort-by-major-mode

         ;; custom bindings
         (kbd "l") 'ibuffer-visit-buffer
         (kbd "v") 'ibuffer-toggle-marks
         (kbd "J") 'ibuffer-jump-to-buffer

         (kbd "j") 'evil-next-line
         (kbd "k") 'evil-previous-line))))

(provide 'my-ibuffer)

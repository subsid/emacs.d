;;; From http://stackoverflow.com/questions/22849281/on-emacs-for-osx-how-to-keep-kill-ring-and-clipboard-separate
;;; Tested on:
;;; 1.  GNU Emacs 24.3.1 (x86_64-apple-darwin13.0.0)
;;;     of 2013-12-22 on tennine-slave.macports.org
;;;     (MacPorts emacs@24.3_1)
;;;
;;; 2.  GNU Emacs 24.3.1 (x86_64-apple-darwin, NS apple-appkit-1038.36)
;;;     of 2013-03-12 on bob.porkrind.org
;;;     (Emacs For Mac OS X)

(defun isolate-kill-ring()
  "Isolate Emacs kill ring from OS X system pasteboard.
This function is only necessary in window system."
  (interactive)
  (setq interprogram-cut-function nil)
  (setq interprogram-paste-function nil))

(defun pasteboard-copy()
  "Copy region to OS X system pasteboard."
  (interactive)
  (shell-command-on-region
   (region-beginning) (region-end) "pbcopy"))

(defun pasteboard-paste()
  "Paste from OS X system pasteboard via `pbpaste' to point."
  (interactive)
  (shell-command-on-region
   (point) (if mark-active (mark) (point)) "pbpaste" nil t))

(defun pasteboard-cut()
  "Cut region and put on OS X system pasteboard."
  (interactive)
  (pasteboard-copy)
  (delete-region (region-beginning) (region-end)))

(if window-system
    (progn
      (isolate-kill-ring)
      ;; bind CMD+C to pasteboard-copy
      (global-set-key (kbd "s-c") 'pasteboard-copy)
      (define-key whole-line-or-region-local-mode-map (kbd "s-v") 'nil) 
      ;; bind CMD+V to pasteboard-paste
      (global-set-key (kbd "s-v") 'pasteboard-paste)
      (define-key whole-line-or-region-local-mode-map (kbd "s-x") 'nil) 
      ;; bind CMD+X to pasteboard-cut
      (global-set-key (kbd "s-x") 'pasteboard-cut))

  ;; you might also want to assign some keybindings for non-window
  ;; System usage (i.e., in your text terminal, where the
  ;; command->super does not work)
  )

(provide 'my-mac-clipboard-seperation)


(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

(setq org-M-RET-may-split-line nil)
(visual-line-mode 1)
(setq require-final-newline t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 2)
(global-display-line-numbers-mode 1)

;; Initialize emacs scratch with org mode
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "#+TITLE: Scratch\n\n")

;; Disable UI dialogs
(setq use-dialog-box nil)

;; Disable some mouse bindings. 
(global-unset-key [C-down-mouse-1])

;; Watch files on disk and revert if they change.
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

;; enable recentf mode
(recentf-mode 1)

;; treats camelCase as multiple words
(global-subword-mode 1)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Separate system and emacs kill-ring
(set 'select-enable-primary nil)
(set 'select-enable-clipboard nil)
(global-set-key (kbd "C-c w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-c y") 'clipboard-yank)

;; Dont litter my project folder!! 
(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Directory used for Emacs backups.")

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-folder t)))

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))
;; Remap command and control?
;; Not sure whats the right thing to do.
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'super)

;; ido settings
;; (ido-mode 1)
;; (setq ido-everywhere t)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point 'guess)

;; clear eshell
(defun eshell/clear ()
  "clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; to deactive tab indenting
;; (setq-default indent-tabs-mode nil)
;;

(setq tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; set screen scrolling to half page, rather than full
(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))
	
(defun scroll-down-half ()         
  (interactive)                    
  (scroll-down (window-half-height)))

(defun top-join-line ()
  "Join the current line with the line beneath it. As suggested by mr.bbatsov"
  (interactive)
  (delete-indentation 1))

;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
;; https://www.emacswiki.org/emacs/UnfillParagraph
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
	;; This would override `fill-column' if it's an integer.
	(emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))
(global-set-key "\M-Q" 'unfill-paragraph)

(global-set-key "\C-v" 'scroll-up-half)
(global-set-key "\M-v" 'scroll-down-half)
(global-set-key "\C-^" 'top-join-line)

(provide 'my-global)


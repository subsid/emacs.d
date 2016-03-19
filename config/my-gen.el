(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

(setq org-M-RET-may-split-line nil)
(visual-line-mode 1)
(setq require-final-newline t)
(tool-bar-mode -1)
(global-linum-mode 1)
(scroll-bar-mode -1)
;; treats camelCase as multiple words
(global-subword-mode 1)

(use-package nlinum 
  :ensure t
  :config
  (progn
    ;; Preset width nlinum
    (add-hook 'nlinum-mode-hook
	      (lambda ()
		(setq nlinum--width
		      (length (number-to-string
			       (count-lines (point-min) (point-max)))))))))
(setq linum-format "%3d ")

(add-to-list 'default-frame-alist '(fullscreen . maximized))

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

;; Zoom in/out of one buffer.
(use-package zoom-window
  :ensure zoom-window
  :config
  (global-set-key (kbd "C-x C-o") 'zoom-window-zoom)
  (setq zoom-window-mode-line-color "DarkGreen"))

;; Ace jump, jump around in a buffer
(use-package ace-jump-mode
  :bind ("C-;" . ace-jump-mode))

(setq x-select-enable-clipboard nil)

;;settins for gpg stuff

(setenv "PATH" (concat "/usr/local/bin" path-separator "/usr/texbin" path-separator (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq mac-command-modifier 'control)
(setq mac-control-modifier 'super)


;; ido settings
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

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

(global-set-key "\C-v" 'scroll-up-half)
(global-set-key "\M-v" 'scroll-down-half)

(provide 'my-gen)



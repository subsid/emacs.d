(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

(visual-line-mode 1)
(setq require-final-newline t)
(tool-bar-mode -1)
(global-linum-mode 1)
(scroll-bar-mode -1)

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
(use-package ace-jump
  :ensure ace-jump-mode) 

(setq x-select-enable-clipboard nil)

;;settins for gpg stuff
(setenv "PATH" (concat "/usr/local/bin" path-separator (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq mac-command-modifier 'control)
(setq mac-control-modifier 'super)

(provide 'my-gen)


(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

(visual-line-mode 1)
(setq require-final-newline t)
(tool-bar-mode -1)
(linum-mode 1)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Dont litter my project folder!! 
(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Directory used for Emacs backups.")

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-folder t)))

;; Org Agenda DIR
(setq org-agenda-files '("~/workspace/notes/"))
(setq org-directory "~/workspace/notes/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(provide 'my-gen)

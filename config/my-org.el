;; Org Agenge org

(use-package org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (setq home (shell-command-to-string "printf %s \"$HOME\""))
  (setq org-directory (concat home "/Dropbox/notes"))
  (setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "|" "DONE(d)" "CANCELLED(c)")))
  :demand t
  :config
  (setq org-agenda-files (list (concat home "/Dropbox/notes/life.org")
			       (concat home "/Dropbox/notes/learning.org")
			       (concat home "/Dropbox/notes/today.org")
			       (concat home "/Dropbox/notes/books.org")
			       (concat home "/Dropbox/notes/inbox.org")
			       (concat home "/Dropbox/notes/work.org")
			       (concat home "/Dropbox/notes/chores.org")))
  
  (setq org-archive-location "::* Archived Tasks")
  (setq org-default-notes-file (concat org-directory "/inbox.org"))
  (setq org-journal-dir (concat org-directory "/journal"))
  
  (add-to-list 'org-modules 'org-habit)
  (add-to-list 'org-modules 'org-bullets)
  (add-to-list 'org-modules 'org-crypt)
  
  (setq org-export-coding-system 'utf-8)
  (setq org-export-allow-bind-keywords 1)
  (setq capture-journal-location (concat home "/Dropbox/notes/journal.org"))
  (setq org-capture-templates
        '(("t" ;hotkey
           "Tidbit" ; Random Stuff
           entry ; type
                                        ;heading type and title
           (file+headline org-default-notes-file "Inbox")
           "* %? %t %^G")
	  ("j"
	   "Journal entry"
	   plain
	   (file+olp+datetree capture-journal-location)
	   "[%<%H:%M>] %?")
	  ))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  ;; GPG key to use for encryption
  ;; Either the Key ID or set to nil to use symmetric encryption.
  (setq org-crypt-key "siddharth")
  (setq org-log-done 'time)
  (setq auto-save-default nil)
  ;;
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  ;;org-capture
  (define-key global-map "\C-cc" 'org-capture)
  (setq org-habits-only-for-today nil)

  ;; Org babel support for languages
  ;; active Babel languages
  (setq org-src-fontify-natively t)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . nil)
     (ruby . t)
     )))

(use-package htmlize
  :ensure t)

(use-package org-bullets
  :ensure t)

;; Collapse everything except current tab.
(defun org-show-current-heading-tidily ()
  (interactive)  ;Inteactive
  "Show next entry, keeping other entries closed."
  (if (save-excursion (end-of-line) (outline-invisible-p))
      (progn (org-show-entry) (show-children))
    (outline-back-to-heading)
    (unless (and (bolp) (org-on-heading-p))
      (org-up-heading-safe)
      (hide-subtree)
      (error "Boundary reached"))
    (org-overview)
    (org-reveal t)
    (org-show-entry)
    (show-children)))

(define-key org-mode-map (kbd  "M-=") 'org-show-current-heading-tidily)

(provide 'my-org)


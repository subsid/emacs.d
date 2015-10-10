;; Org Agenda DIR

(use-package org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (setq org-directory "/Users/siddharth/Dropbox/notes")
  (setq org-todo-keywords '((sequence "TODO" "INPROGRESS" "|" "DONE")))
  :demand t
  :config
  (use-package org-bullets
    :ensure t)
  (setq org-agenda-files (list "/Users/siddharth/Dropbox/notes/life.org.gpg"))
  (setq org-archive-location "%s_archive.gpg::datetree/")
  (setq org-default-notes-file (concat org-directory "/life.org.gpg"))
  (setq org-journal-dir (concat org-directory "/journal"))
  (add-to-list 'org-modules 'org-habit)
  (add-to-list 'org-modules 'org-bullets)
  (add-to-list 'org-modules 'org-crypt)
  (setq org-export-coding-system 'utf-8)
  (setq org-capture-templates
  	'(("b" ;hotkey
	   "Tidbit" ; Random Stuff
	   entry ; type
					;heading type and title
	   (file+headline org-default-notes-file "Inbox")
	   "* %?\n %t")
	  ("j" "Journal" entry (file+datetree org-default-notes-file)
	   "* %?\nEntered on %U\n")))

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
  (define-key global-map "\C-cc" 'org-capture))

(provide 'my-org)


  ;; configure org-capture templates
  ;; (setq org-capture-templates
  ;; 	'(("t" ;hotkey
  ;; 	  "TODO list item" ; name
  ;; 	  entry ; type
  ;; 	  ;heading type and title
  ;; 	  (file+headline org-default-notes-file "Tasks")
  ;; 	  "* TODO %?\n %i\n %a") ;template
  ;; 	  ))

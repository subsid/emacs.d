;; Org Agenda DIR

(use-package org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (setq org-directory "/Users/siddharth/Dropbox/notes")
  :demand t
  :config
  (use-package org-bullets
    :ensure t)
  (setq org-agenda-files (list "/Users/siddharth/Dropbox/notes/life.org.gpg"))
  (setq org-archive-location "%s_archive::datetree/* Archived Tasks")
  (setq org-default-notes-file (concat org-directory "/life.org.gpg"))
  (add-to-list 'org-modules 'org-habit)
  (add-to-list 'org-modules 'org-bullets)
  (setq org-export-coding-system 'utf-8)
  (setq org-capture-templates
  	'(("b" ;hotkey
  	  "Tidbit" ; Random Stuff
  	  entry ; type
  	  ;heading type and title
  	  (file+headline org-default-notes-file "Inbox")
	  "* %?\n %t"
  	  )))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (define-key global-map "\C-cl" 'org-store-link)
  (setq org-log-done 'time)
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
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

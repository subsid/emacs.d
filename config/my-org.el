;; Org Agenge org

(use-package org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (setq home (shell-command-to-string "printf %s \"$HOME\""))
  (setq org-directory (concat home "/Dropbox/notes"))
  (setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "CANCELLED(c)")))
  :demand t
  :config
  ;; (setq org-agenda-files (list (concat home "/Dropbox/notes/org/life.org")
  ;; 			       (concat home "/Dropbox/notes/org/learning.org")
  ;; 			       (concat home "/Dropbox/notes/org/today.org")
  ;; 			       (concat home "/Dropbox/notes/org/books.org")
  ;; 			       (concat home "/Dropbox/notes/org/inbox.org")
  ;; 			       (concat home "/Dropbox/notes/org/work.org")
  ;; 			       (concat home "/Dropbox/notes/org/chores.org")))

;;   (setq org-archive-location "::* Archived Tasks")
;;   (setq org-default-notes-file (concat org-directory "/inbox.org"))
;;   (setq org-journal-dir (concat org-directory "/journal"))
  (add-to-list 'org-modules 'org-crypt)

  (setq org-agenda-show-future-repeats 'next)
  (setq org-export-coding-system 'utf-8)
  (setq org-export-allow-bind-keywords 1)
;;  (setq capture-journal-location (concat home "/Dropbox/notes/journal.org")) ;
  ;; (setq org-capture-templates
  ;;       '(("t" ;hotkey
  ;;          "Tidbit" ; Random Stuff
  ;;          entry ; type
  ;;                                       ;heading type and title
  ;;          (file+headline org-default-notes-file "Inbox")
  ;;          "* %? %t %^G")
  ;; 	  ("j"
  ;; 	   "Journal entry"
  ;; 	   plain
  ;; 	   (file+olp+datetree capture-journal-location)
  ;; 	   "[%<%H:%M>] %?")
  ;; 	  ))
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  ;; GPG key to use for encryption
  ;; Either the Key ID or set to nil to use symmetric encryption.
  (setq org-crypt-key "141FB487B03C0219")
  (setq org-log-done 'time)
  (setq auto-save-default nil)
  ;;
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  ;; Default binds to fill-paragraph. I usually want truncate lines and wrapping.
  (define-key org-mode-map "\M-q" 'toggle-truncate-lines)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  ;;org-capture
;;   (define-key global-map "\C-cc" 'org-capture)

  ;; Org babel support for languages
  ;; active Babel languages
  (setq org-src-fontify-natively t)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . nil)
     (ruby . t)
     ))
  (setq org-agenda-custom-commands
   '(("x" "daily status"
      ((agenda ""
	       ((org-agenda-prefix-format " %i %-12:c%?-12t% s %?e ")
		(org-agenda-skip-function
		 '(org-agenda-skip-entry-if 'todo
					    '("DOING")))))
       (tags "TODO=\"DOING\"" nil)
   ;;    (tags "TODO=\"TODO\"+SCHEDULED=\"\"" nil))
      (tags "TODO=\"TODO\"-CATEGORY=\"Chores\"+DEADLINE=\"\"+SCHEDULED=\"\"" nil))
      nil nil)
     ("l" "Tasks closed in last week" tags "CLOSED>=\"<-1w>\""
      ((org-agenda-view-columns-initially t)))))
  )

;; (use-package htmlize
;;   :ensure t)

(use-package org-superstar
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



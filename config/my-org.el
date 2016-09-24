;; Org Agenge org

(use-package org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (setq org-directory "/Users/siddharth/Dropbox/notes")
  (setq org-todo-keywords '((sequence "TODO" "INPROGRESS" "|" "DONE")))
  :demand t
  :config
  (use-package org-bullets
    :ensure t)
  (setq org-agenda-files (list "/Users/siddharth/Dropbox/notes/life.org"
                               "/Users/siddharth/Dropbox/notes/learning.org"
                               "/Users/siddharth/Dropbox/notes/books.org"
                               "/Users/siddharth/Dropbox/notes/inbox.org"
                               "/Users/siddharth/Dropbox/notes/work.org"))
  (setq org-archive-location "::* Archived Tasks")
  (setq org-default-notes-file (concat org-directory "/inbox.org"))
  (setq org-journal-dir (concat org-directory "/journal"))
  (add-to-list 'org-modules 'org-habit)
  (add-to-list 'org-modules 'org-bullets)
  (add-to-list 'org-modules 'org-crypt)
  (setq org-export-coding-system 'utf-8)
  (setq org-capture-templates
        '(("t" ;hotkey
           "Tidbit" ; Random Stuff
           entry ; type
                                        ;heading type and title
           (file+headline org-default-notes-file "Inbox")
           "* %? %t %^G")
          ("j" "Journal" entry (file+datetree org-default-notes-file)
           "* %<%I:%M %p> %?")))
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
  (setq org-habits-only-for-today nil))

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


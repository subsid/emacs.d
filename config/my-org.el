;; Org Agenge org

(use-package org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (setq home (shell-command-to-string "printf %s \"$HOME\""))
  (setq org-directory (concat home "/Dropbox/notes"))
  (setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "CANCELLED(c)")))
  (setq org-hide-emphasis-markers t)
  :demand t
  :config
  ;; (setq org-agenda-files (list (concat home "/Dropbox/notes/org/life.org")
  ;; 			       (concat home "/Dropbox/notes/org/learning.org")
  ;; 			       (concat home "/Dropbox/notes/org/today.org")
  ;; 			       (concat home "/Dropbox/notes/org/books.org")
  ;; 			       (concat home "/Dropbox/notes/org/inbox.org")
  ;; 			       (concat home "/Dropbox/notes/org/work.org")
  ;; 			       (concat home "/Dropbox/notes/org/chores.org")))

  (setq org-archive-location "::* Archived Tasks")
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

  ;; Support markdown export
  (require 'ox-md)
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  ;; GPG key to use for encryption
  ;; Either the Key ID or set to nil to use symmetric encryption.
  (setq org-crypt-key "141FB487B03C0219")
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq auto-save-default nil)
  ;;
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  ;; Default binds to fill-paragraph. I usually want truncate lines and wrapping.
  (define-key org-mode-map "\M-q" 'toggle-truncate-lines)
  (define-key org-mode-map (kbd "C-c C-k") nil)
  (define-key org-mode-map (kbd "C-c *") nil)
  (define-key org-mode-map (kbd "C-c $") nil)
  (define-key org-mode-map (kbd "C-c ,") nil)
  (define-key org-mode-map (kbd "C-c /") nil)
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
     (emacs-lisp . t)
     (awk . t)
     (shell . t)
     (sed . t)
     ))
  (setq org-confirm-babel-evaluate nil)
  (setq org-agenda-custom-commands
   '(("x" "daily status"
      ((agenda ""
	       ((org-agenda-prefix-format " %i %-12:c%?-12t% s %?e ")
		(org-agenda-skip-function
		 '(or (org-agenda-skip-entry-if 'todo '("DOING"))
		      (and (member "noagenda" (org-get-tags))
			   (point-max)))
		 )
		))
       (tags "TODO=\"DOING\"" nil)
       (tags
	"TODO=\"TODO\"-CATEGORY=\"Chores\"+DEADLINE=\"\"+SCHEDULED=\"\""
	nil))
      nil nil)
     ("l" "Tasks closed in last week" tags "CLOSED>=\"<-1w>\""
      ((org-agenda-view-columns-initially t)))))
  
  

  ;; Prevents src code-blocks from indenting at the start.
  ;; https://www.reddit.com/r/orgmode/comments/mj6rg2/python_indentation_in_source_block/
  (setq python-indent-offset 0)
  (setq org-edit-src-content-indentation 0)
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

(use-package ox-reveal
  :ensure t
  :config
  (setq org-reveal-root "/home/sidsub/workspace/reveal.js")
  (setq org-reveal-title-slide nil)
  ;; http://rwx.io/posts/org-export-configurations/
  (defvar org-export-output-directory-prefix "/home/sidsub/Dropbox/notes/exports/export_" "prefix of directory used for org-mode export")
  (defadvice org-export-output-file-name (before org-add-export-dir activate)
      "Modifies org-export to place exported files in a different directory"
      (when (not pub-dir)
          (setq pub-dir (concat org-export-output-directory-prefix (substring extension 1)))
          (when (not (file-directory-p pub-dir))
            (make-directory pub-dir)))))

(define-key org-mode-map (kbd  "M-=") 'org-show-current-heading-tidily)

;; From https://ag91.github.io/blog/2019/07/01/how-to-jump-to-next-bullet-point-in-org-mode/
;; (defun my-org/next-entry-or-next-visible-header ()
;;   (interactive)
;;   (condition-case err
;;       (org-next-item)
;;     (error (org-next-visible-heading 1))))
;; (define-key org-mode-map (kbd "C-c C-n") #'my-org/next-entry-or-next-visible-header)

;; (defun my-org/previous-entry-or-previous-visible-header ()
;;   (interactive)
;;   (condition-case err
;;       (org-previous-item)
;;     (error (org-previous-visible-heading 1))))
;; (define-key org-mode-map (kbd "C-c C-p") #'my-org/previous-entry-or-previous-visible-header)


;; Make C-u C-c C-o open link in same window
(defadvice org-open-at-point (around org-open-at-point-same-window activate)
  "Open link in the same window when called with universal argument."
  (let ((old-org-link-frame-setup org-link-frame-setup))
    (if current-prefix-arg
        ;; If universal argument is given (C-u), open in current window
        (setq org-link-frame-setup '((file . find-file)
                                     (external . find-file)
                                     (custom-id . find-file)
                                     (default . find-file)))
      ;; Otherwise, open in other window (same frame)
      (setq org-link-frame-setup '((file . find-file-other-window)
                                   (external . find-file-other-window)
                                   (custom-id . find-file-other-window)
                                   (default . find-file-other-window))))
    ad-do-it
    ;; Restore the original value after the function call
    (setq org-link-frame-setup old-org-link-frame-setup)))


(provide 'my-org)



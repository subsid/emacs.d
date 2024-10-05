;; -*- lexical-binding: t; -*-

(require 'cl-lib)

;; Good starting point https://systemcrafters.net/build-a-second-brain-in-emacs/5-org-roam-hacks/
(use-package org-roam
  :ensure t
  :demand t  ;; Ensure org-roam is loaded by default
  :custom
  (org-roam-directory (concat home "/Dropbox/notes/org_roam_v2"))
  (org-roam-dailies-directory "journals/")
  (org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n\n* Pre-lunch\n* Post-lunch\n* Evening\n* Notes"))))
  (org-roam-completion-everywhere t)
  (completion-ignore-case t)
  (org-roam-file-exclude-regexp "logseq/")
  (org-roam-capture-templates
   '(
     ("m" "main" plain
      "\n%?\n\n* Related Zettels"
      :immediate-finish t
      :if-new (file+head "pages/main/%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n#+category: ${title}\n#+filetags: Main")
      :unnarrowed t)
     ("p" "project" plain "\n* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n"
      :if-new (file+head "pages/project/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
      :immediate-finish t
      :unnarrowed t)
     ("r" "reference" plain "\n%?\n\n* Related Zettels"
      :if-new
      (file+head "pages/reference/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Reference")
      :immediate-finish t
      :unnarrowed t)
     ("a" "article" plain "\n%?\n\n* Related Zettels"
      :if-new
      (file+head "pages/article/${title}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Article")
      :immediate-finish t
      :unnarrowed t)
     ("w" "work" plain "\n%?\n\n* Related Zettels"
      :if-new
      (file+head "pages/work/${title}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Work")
      :immediate-finish t
      :unnarrowed t)     
     ))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n I" . org-roam-node-insert-immediate)
         ("C-c n p" . my/org-roam-find-project)
         ("C-c n r" . my/org-roam-find-reference)
         ("C-c n t" . my/org-roam-capture-task)
         ("C-c n b" . my/org-roam-capture-inbox)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-enable))

;; Use node type to show type of zettel
(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
        (file-name-directory
         (file-relative-name (org-roam-node-file node) (concat org-roam-directory "/pages")))))
    (error "")))

(setq org-roam-node-display-template
      (concat "${tags:15} ${title:*} "))

;; Insert node without going into capture view
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (assoc "m" org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(defun my/org-roam-filter-by-tags (tag-names)
  "Return a filter function that matches any node with one of the TAG-NAMES."
  (lambda (node)
    (let ((tags (org-roam-node-tags node)))
      (seq-some (lambda (tag) (member tag tag-names)) tags))))

(defun my/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (my/org-roam-filter-by-tags '(tag-name))
           (org-roam-node-list))))


(defun my/org-roam-project-finalize-hook ()
  "Adds the captured project file to `org-agenda-files' if the
capture was not aborted."
  ;; Remove the hook since it was added temporarily
  (remove-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Add project file to the agenda list if the capture was confirmed
  (unless org-note-abort
    (with-current-buffer (org-capture-get :buffer)
      (add-to-list 'org-agenda-files (buffer-file-name)))))


(defun my/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  ;; TODO Custom templates seems broken... So it will show all templates.
  (org-roam-node-find
   nil
   nil
   (my/org-roam-filter-by-tags '("Work" "Project"))
   ;; :templates
   ;; '(("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
   ;;    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
   ;;    :unnarrowed t))
   ))

(defun my/org-roam-find-reference ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  ;; TODO Custom templates seems broken... So it will show all templates.
  (org-roam-node-find
   nil
   nil
   (my/org-roam-filter-by-tags '("Reference"))
   ))

;; Brain dump inside inbox
(defun my/org-roam-capture-inbox ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* TODO %?"
                                  :if-new (file+head "pages/Inbox.org" "#+title: Inbox\n\n")))))

;; Add tasks to specific projects
(defun my/org-roam-capture-task ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Capture the new task, creating the project file if necessary
  (org-roam-capture- :node (org-roam-node-read
                            nil
                            (my/org-roam-filter-by-tags '("Project")))
     :templates '(("p" "project" plain "\n* TODO %?"
		   :if-new (file+head "pages/project/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")))))

;; Copy tasks marked as done to daily journal
(defun my/org-roam-copy-todo-to-today ()
  (interactive)
  (let ((org-refile-keep t) ;; Set this to nil to delete the original!
        (org-roam-dailies-capture-templates
          '(("t" "tasks" entry "%?"
             :if-new (file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Tasks")))))
        (org-after-refile-insert-hook #'save-buffer)
        today-file
        pos)
    (save-window-excursion
      (org-roam-dailies--capture (current-time) t)
      (setq today-file (buffer-file-name))
      (setq pos (point)))

    ;; Only refile if the target file is different than the current file
    (unless (equal (file-truename today-file)
                   (file-truename (buffer-file-name)))
      (org-refile nil nil (list "Tasks" today-file nil pos)))))

(add-to-list 'org-after-todo-state-change-hook
             (lambda ()
               (when (equal org-state "DONE")
                 (my/org-roam-copy-todo-to-today))
    ))

;; Thanks to madnificent - https://d12frosted.io/posts/2021-01-16-task-management-with-roam-vol5.html 
;; Build org-agenda dynamically by finding files that have TODOs
;; Not usng the org-todos-keywords as I have the shortcuts in the description there.
(defvar my/org-agenda--todo-keyword-regex
  (cl-reduce (lambda (cur acc)
            (concat acc "|" cur))
          (mapcar (lambda (entry) (concat "\\* " entry))
                  '("TODO" "DOING")))
  "Regex which filters all TODO keywords")

(defun my/org-agenda--calculate-files-for-regex (regex)
  "Yields a fresh array with all files containing todos which match REGEX.

Uses ripgrep to discover all files containing anything stored in
my/org-agenda--todo-keyword-regex."
  (cl-remove-if #'file-directory-p
   (split-string
    (shell-command-to-string
     (concat "rg -t org -e '" regex "' -l " org-roam-directory " -g '!logseq/'"))
    "\n")))

;; Can slow things down...
;; (defun org-agenda-all ()
;;   "Use all files for org-agenda."
;;   (interactive)
;;   (setq org-agenda-files (list "~/Dropbox/notes/org_roam")))

(defun my/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (my/org-agenda--calculate-files-for-regex my/org-agenda--todo-keyword-regex)))


(advice-add 'org-agenda :before #'my/org-roam-refresh-agenda-list)
(advice-add 'org-todo-list :before #'my/org-roam-refresh-agenda-list)

(provide 'my-org-roam)


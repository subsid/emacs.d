(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/eyecandy"))

(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)

(setq package-enable-at-startup nil)
(setq use-package-always-ensure t)
(setq inhibit-compacting-font-caches t)

;; Activate installed packages
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'my-keychain)
(require 'use-package)
(require 'my-gen)
(require 'my-global)
;; (require 'my-mac-clipboard-seperation)
;; (require 'my-projects)
;;(require 'my-evil)
;;(require 'evil-bypass-clipboard)
;; (require 'my-elisp)
;; (require 'my-dired)
;; (require 'my-ibuffer)
;; (require 'my-magit)
;; (require 'my-helm)
(require 'my-org)
(require 'my-org-roam)
(require 'my-auto-complete)
;; (require 'my-coffee)
; (require 'my-leader-keys)
; (require 'my-path)
(require 'my-parens)

;; Language
;; (require 'my-clojure)
;; (require 'my-sml)

;; snippets
;; (require 'my-snippets)
(require 'my-eyecandy)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/workspace/subsid.github.io/content/posts/2019-02-20-sed-rename.org" "/home/sid/Dropbox/notes/org_roam/pages/20230120234155-linux_hacks.org" "/home/sid/Dropbox/notes/org_roam/pages/20221230110743-wedding.org" "/home/sid/Dropbox/notes/org_roam/pages/20221230163349-tasks.org" "/home/sid/Dropbox/notes/org_roam/pages/20221229153746-karpathy_videos.org" "/home/sid/Dropbox/notes/org_roam/pages/20230106090140-12in23.org" "/home/sid/Dropbox/notes/org_roam/pages/20221230163215-emacs.org" "/home/sid/Dropbox/notes/org_roam/pages/20230110003719-dad_visa.org" "/home/sid/Dropbox/notes/org_roam/pages/20221230162940-chores.org" "/home/sid/Dropbox/notes/org_roam/pages/20230106010312-taxes.org" "/home/sid/Dropbox/notes/org_roam/pages/20230101115035-elisp.org"))
 '(package-selected-packages
   '(consult smartparens easy-hugo orderless vertico zoom-window zenburn-theme whole-line-or-region use-package undo-tree org-superstar org-roam-ui nlinum ledger-mode helm expand-region exec-path-from-shell doom-themes company beacon ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Taken from this awesome demo https://ebzzry.com/en/emacs-pairs_/
(use-package smartparens-config
  :ensure smartparens
  :config
  (progn
    (smartparens-strict-mode t)
    (show-smartparens-global-mode t)
    (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
    (global-unset-key (kbd "C-<right>"))
    (global-unset-key (kbd "M-<right>"))
    (global-unset-key (kbd "C-<left>"))
    (global-unset-key (kbd "M-<left>"))
    ;; Define new pairs
    (setq sp-pairs nil)
    (sp-pair "_" "_" :wrap "C-c _")
    (sp-pair "(" ")" :wrap "C-c (")
    (sp-pair "[" "]" :wrap "C-c [" )
    (sp-pair "{" "}" :wrap "C-c {" )
    (sp-pair "'" "'" :wrap "C-c '" )
    (sp-pair "\"" "\"" :wrap "C-c \"")
    (sp-pair "`" "`" :wrap "C-c `" )
    (sp-pair "_" "_" :wrap "C-c _" )
    (sp-pair "*" "*" :wrap "C-c *" )
    (sp-pair "~" "~" :wrap "C-c ~" )
    (sp-pair "$" "$" :wrap "C-c $" )
    (sp-pair "/" "/" :wrap "C-c /" ))
  (bind-keys
   :map smartparens-mode-map
   ("C-M-a" . sp-beginning-of-sexp)
   ("C-M-e" . sp-end-of-sexp)

   ("C-<down>" . sp-down-sexp)
   ("C-<up>"   . sp-up-sexp)
   ("M-<down>" . sp-backward-down-sexp)
   ("M-<up>"   . sp-backward-up-sexp)

   ;; ("C-M-f" . sp-forward-sexp)
   ;; ("C-M-b" . sp-backward-sexp)

   ("C-M-n" . sp-next-sexp)
   ("C-M-p" . sp-previous-sexp)

   ;; ("C-S-f" . sp-forward-symbol)
   ;; ("C-S-b" . sp-backward-symbol)


   ("C-c l" . sp-forward-slurp-sexp)
   ("M-c l" . sp-forward-barf-sexp)
   ("C-c h"  . sp-backward-slurp-sexp)
   ("M-c h"  . sp-backward-barf-sexp)

   ("C-M-t" . sp-transpose-sexp)
   ("C-M-k" . sp-kill-sexp)
   ("C-k"   . sp-kill-hybrid-sexp)
   ("M-k"   . sp-backward-kill-sexp)
   ("C-M-w" . sp-copy-sexp)
   
   ;; ("M-<backspace>" . backward-kill-word)
   ;; ("C-<backspace>" . sp-backward-kill-word)
   ;; ([remap sp-backward-kill-word] . backward-kill-word)

   ("M-[" . sp-backward-unwrap-sexp)
   ("M-]" . sp-unwrap-sexp)

   ;;   ("C-x C-t" . sp-transpose-hybrid-sexp)
   )
  )

;; (defun wrap-pair (pair)
;;   (interactive "sPair: ")
;;   (if (assoc pair sp-pair-list)
;;       (sp-wrap-with-pair pair)
;;     (message "Pair is not defined")))

(provide 'my-parens)

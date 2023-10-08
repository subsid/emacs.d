;;; keychain-environment.el --- load keychain environment variables  -*- lexical-binding: t -*-


;; I don't currently use the key-chain command. But its probably useful for hugo stuff :)

;; Script taken from https://github.com/tarsius/keychain-environment/blob/main/keychain-environment.el

;; I decided to copy over the script as it looks like its not actively maintained anymore.
;; Thanks to Tarsius for this. Clean and simple!  


;;; Commentary:

;; Keychain is a script that manages ssh-agent and gpg-agent.  It is
;; typically run from the shell's initialization file.  It allows your
;; shells and cron jobs to share a single ssh-agent and/or gpg-agent.

;; When keychain is run, it checks for running agent, otherwise it
;; starts them.  It saves the agents' environment variables to files
;; inside ~/.keychain/, so that subsequent shells can source these
;; files.

;; When Emacs is started under X11 and not directly from a terminal
;; these variables are not set.  This library looks for these files
;; created by keychain and then sets Emacs' environment variables
;; accordingly.  It does not actually run keychain, so you still
;; have to run that from a login shell first.

;; To use run the function `keychain-refresh-environment' in your
;; init file.  If keychain has not been run yet when you start Emacs
;; you can also later call that function interactively.

;; Also see: http://www.funtoo.org/wiki/Keychain

;;; Code:

;;;###autoload
(defun keychain-refresh-environment ()
  "Set ssh-agent and gpg-agent environment variables.
Set the environment variables `SSH_AUTH_SOCK', `SSH_AGENT_PID'
and `GPG_AGENT' in Emacs' `process-environment' according to
information retrieved from files created by the keychain script."
  (interactive)
  (let* ((ssh (shell-command-to-string "keychain -q --noask --agents ssh --eval"))
         (gpg (shell-command-to-string "keychain -q --noask --agents gpg --eval")))
    (list (and ssh
               (string-match "SSH_AUTH_SOCK[=\s]\\([^\s;\n]*\\)" ssh)
               (setenv       "SSH_AUTH_SOCK" (match-string 1 ssh)))
          (and ssh
               (string-match "SSH_AGENT_PID[=\s]\\([0-9]*\\)?" ssh)
               (setenv       "SSH_AGENT_PID" (match-string 1 ssh)))
          (and gpg
               (string-match "GPG_AGENT_INFO[=\s]\\([^\s;\n]*\\)" gpg)
               (setenv       "GPG_AGENT_INFO" (match-string 1 gpg))))))

(keychain-refresh-environment)
;;; _
(provide 'my-keychain)
;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; keychain-environment.el ends here

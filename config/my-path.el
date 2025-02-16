;;settins for gpg stuff
(setenv "PATH" (concat "/usr/local/bin" path-separator "/usr/texbin" path-separator (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))

(provide 'my-path)

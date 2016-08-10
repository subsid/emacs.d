;;settins for gpg stuff
(setenv "PATH" (concat "/usr/local/bin" path-separator "/usr/texbin" path-separator (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (concat "/usr/local/smlnj/bin" path-separator (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin" exec-path))


(provide 'my-path)

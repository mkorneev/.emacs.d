(fset 'yes-or-no-p 'y-or-n-p)

;; backup

(defvar autosave-dir "~/.emacs.d/.backups/")
(make-directory autosave-dir t)

(setq backup-directory-alist `((".*" . ,autosave-dir)))
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(provide 'my-general)

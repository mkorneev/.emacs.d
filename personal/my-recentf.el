(require 'recentf)

(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 20)

(recentf-mode 1)
(ido-mode 1)

(defun xsteve-ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (let ((home (expand-file-name (getenv "HOME"))))
    (find-file
     (ido-completing-read "Recentf open: "
                          (mapcar (lambda (path)
                                    (replace-regexp-in-string home "~" path))
                                  recentf-list)
                          nil t))))

(provide 'my-recentf)

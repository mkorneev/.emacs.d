;;; my-ido.el --- ido

(require 'ido)                      ; ido is part of emacs 
(ido-everywhere t)
(ido-mode t)                        ; for both buffers and files
(setq ido-ignore-buffers               ; ignore these guys
      '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido")
      ;; ido-work-directory-list '("~/" "~/Desktop" "~/Documents")
      ido-case-fold nil                ; be case-sensitive
      ;; ido-enable-prefix t
      ido-auto-merge-work-directories-length -1
      ido-use-filename-at-point nil
      ;; ido-use-url-at-point nil         ; don't use url at point (annoying)
      ido-enable-flex-matching t       ; be flexible
      ido-max-prospects 6              ; don't spam my minibuffer
      ido-confirm-unique-completion t) ; wait for RET, even with unique completion

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read
       "Project file: " (tags-table-files) nil t)))))

(add-hook 'ido-setup-hook 
          (lambda () 
            (define-key ido-completion-map [tab] 'ido-complete)))

(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(provide 'my-ido)

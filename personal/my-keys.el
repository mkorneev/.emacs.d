(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(require 'cl)

(defun my-key (key cmd)
  (define-key my-keys-minor-mode-map key cmd)) 

(global-set-key (kbd "C-d") 'kill-whole-line) ;; to work fine in ido mode
(my-key (kbd "<delete>") 'delete-char)
(my-key (kbd "C-/") 'comment-or-uncomment-region)
(my-key (kbd "C-w") 'kill-current-buffer)
(my-key (kbd "C-s") 'save-buffer)
(my-key (kbd "C-a") 'mark-whole-buffer)
(my-key (kbd "C-x C-j") 'dired-jump)
(my-key (kbd "C-S-o") 'xsteve-ido-choose-from-recentf)

(my-key (kbd "C-j") 'isearch-forward)
(my-key (kbd "C-S-j") 'isearch-backward)

(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

(autoload 'iedit-mode "iedit.el" nil t)
(my-key (kbd "C-:") 'iedit-mode)
(define-key isearch-mode-map (kbd "C-:") 'iedit-mode)

(require 'override-keymaps)

(override-keymaps
  `(
    (,(kbd "C-j") isearch-forward (ruby latex info dired view yaml lisp-interaction org))
    (,(kbd "C-S-j") isearch-backward (ruby latex info dired view yaml lisp-interaction))
    (,(kbd "C-j") dired-isearch-filenames (dired))
    (,(kbd "C-j") isearch-repeat-forward (isearch))
    (,(kbd "C-S-j") isearch-repeat-backward (isearch))
    (,(kbd "<return>") newline-and-indent (prog nxml rhtml yaml))
    (,(kbd "C-c e") sqml-close-tag (rhtml))
    (,(kbd "M-<return>") w32-integ-dired-explorer-open (dired))
    (,(kbd "$") my-ido-bookmark-jump (dired))
    (,(kbd "C-a") mark-whole-buffer (org))
    ))


(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " MK" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(provide 'my-keys)

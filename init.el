(add-to-list 'load-path "~/.emacs.d/personal")
(add-to-list 'load-path "~/.emacs.d/vendor")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'my-general)
(require 'my-functions)
(require 'my-ido)
(require 'my-recentf)

(require 'my-modes)

(require 'my-keys)
(require 'my-menu)

;;(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))
(delete 'Git vc-handled-backends)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(server-start)

; maximize window
; (w32-send-sys-command 61488)

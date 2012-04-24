;; my-menu.el

;; Creating a new menu pane in the menu bar to the right of “Tools” menu
(define-key-after
  global-map
  [menu-bar mymenu]
  (cons "My" (make-sparse-keymap "My Menu"))
  'tools )

(define-key global-map [menu-bar mymenu paste-ocs] '("Paste Office Communicator log" . paste-ocs))

;; code to remove the whole menu panel
;; (global-unset-key [menu-bar mymenu])

(provide 'my-menu)

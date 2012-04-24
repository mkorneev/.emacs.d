;; my-functions.el

(defun now ()
  "Insert string for the current time formatted like '09/09/11 11:56'."
  (interactive)
  (insert (format-time-string "%D %H:%M")))

(defun paste-ocs ()
  (interactive)
  (goto-char (point-max))
  (newline)
  (newline)
  (now)
  (newline)
  (newline)
  (yank)
  (newline)
  (newline)
  ;; (save-and-kill-current-buffer)
  ;; (suspend-frame)
  )

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun save-and-kill-current-buffer ()
  (interactive)
  (save-buffer)
  (kill-buffer (current-buffer)))

(defun swap-buffer ()
  (interactive)
  (cond ((one-window-p) (display-buffer (other-buffer)))
        ((let* ((buffer-a (current-buffer))
                (window-b (cadr (window-list)))
                (buffer-b (window-buffer window-b)))
           (set-window-buffer window-b buffer-a)
           (switch-to-buffer buffer-b)
           (other-window 1)))))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this. The function inserts linebreaks to separate tags that have
nothing but whitespace between them. It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n") (setq end (1+ end)))
    (indent-region begin end))
  (message "Ah, much better!"))

(provide 'my-functions)

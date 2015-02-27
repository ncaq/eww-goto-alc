;; -*- lexical-binding: t -*-

(require 'eww)

(defun eww-browse-url-other-window (url &optional newwin)
  (if (one-window-p)
      (split-window-right))
  (other-window 1)
  (eww-browse-url url newwin))

(defun alc-word-url (word)
  (concat "http://eow.alc.co.jp/search?q=" word "#resultsList"))

(defvar eww-goto-alc-history)

;;;###autoload
(defun eww-goto-alc (word)
  (interactive (list (read-string "" (thing-at-point 'word) 'eww-goto-alc-history)))
  (eww-browse-url-other-window (alc-word-url word)))

(provide 'eww-goto-alc)

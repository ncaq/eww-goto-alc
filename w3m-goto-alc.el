;; -*- lexical-binding: t -*-
(require 'w3m)

(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p)
        (split-window-right))
    (other-window 1)
    (w3m-browse-url url newwin)))

(defun alc-word-url (word)
  (concat "http://eow.alc.co.jp/search?q=" word "#resultsList"))

(defun w3m-goto-alc (word)
  (interactive (list (read-from-minibuffer "" (thing-at-point 'word))))
  (w3m-browse-url-other-window (alc-word-url word)))

(provide 'w3m-goto-alc)

;; -*- lexical-binding: t -*-

(require 'eww)

(defcustom alc-eow-use-pro nil
  "英辞郎Proにアクセスする"
  :type 'boolean
  :group 'eww-goto-alc)

(defun alc-search-url ()
  (if alc-eow-use-pro
      "http://eowpf.alc.co.jp/search?q="
    "http://eow.alc.co.jp/search?q="))

(defun alc-content-id ()
  (if alc-eow-use-pro
      "#maincontent"
    "#resultsArea"))

(defun alc-word-url (word)
  (concat (alc-search-url) word (alc-content-id)))

(defvar eww-goto-alc-history)

;;;###autoload
(defun eww-goto-alc (word)
  (interactive (list (read-string "" (thing-at-point 'word) 'eww-goto-alc-history)))
  (eww-browse-url (alc-word-url word) t) ;_new-window option is supported by Emacs-25
  )

(provide 'eww-goto-alc)

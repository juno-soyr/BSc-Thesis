;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "9pt")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"))
 :latex)


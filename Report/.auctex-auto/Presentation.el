;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "Presentation"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("beamer" "")))
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer10"))
 :latex)


;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("asmath" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "asmath"))
 :latex)


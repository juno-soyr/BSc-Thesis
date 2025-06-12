;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("amsmath" "") ("amssymb" "") ("inputenc" "utf8") ("csquotes" "") ("tikz" "") ("biblatex" "backend=biber") ("geometry" "a4paper" "total={6in, 9in}")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "amsmath"
    "amssymb"
    "inputenc"
    "csquotes"
    "tikz"
    "biblatex"
    "geometry")
   (LaTeX-add-labels
    "abstract"
    "theoretical-background"
    "intro-trs"
    "intro-lambda"
    "reduction")
   (LaTeX-add-bibliographies))
 :latex)


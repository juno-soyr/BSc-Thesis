;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("amsmath" "") ("amsthm" "") ("amssymb" "") ("inputenc" "utf8") ("csquotes" "") ("tikz" "") ("biblatex" "backend=biber") ("geometry" "a4paper" "total={6in, 9in}")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "amsmath"
    "amsthm"
    "amssymb"
    "inputenc"
    "csquotes"
    "tikz"
    "biblatex"
    "geometry")
   (LaTeX-add-labels
    "theoretical-background"
    "intro-lambda"
    "reduction")
   (LaTeX-add-bibliographies)
   (LaTeX-add-amsthm-newtheorems
    "theorem"
    "corollary"
    "lemma"))
 :latex)


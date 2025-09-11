;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "final"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("graphicx" "") ("amsmath" "") ("amsthm" "") ("amssymb" "") ("inputenc" "utf8") ("csquotes" "") ("tikz" "") ("biblatex" "backend=biber") ("geometry" "a4paper" "total={6in, 9in}")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "graphicx"
    "amsmath"
    "amsthm"
    "amssymb"
    "inputenc"
    "csquotes"
    "tikz"
    "biblatex"
    "geometry")
   (LaTeX-add-labels
    "intro-lambda"
    "reduction"
    "lemma1"
    "lou")
   (LaTeX-add-bibliographies)
   (LaTeX-add-amsthm-newtheorems
    "theorem"
    "corollary"
    "lemma"))
 :latex)


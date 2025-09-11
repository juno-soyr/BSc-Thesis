;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "VU-CS-BSc-thesis-template"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("graphicx" "") ("amsmath" "") ("amsthm" "") ("amssymb" "") ("inputenc" "utf8") ("csquotes" "") ("tikz" "") ("biblatex" "backend=biber") ("geometry" "a4paper" "total={6in, 9in}")))
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
    "theoretical-background"
    "intro-lambda"
    "reduction"
    "lemma1"
    "lou")
   (LaTeX-add-environments
    "theorem"
    "corollary"
    "lemma")
   (LaTeX-add-bibliographies))
 :latex)


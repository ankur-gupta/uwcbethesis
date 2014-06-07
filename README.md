UW CBE Thesis Style
==
University of Wisconsin-Madison, Madison, Chemical and Biological Engineering Thesis Style Guide

Copyright (C) 2014 Ankur Gupta (http://jbrwww.che.wisc.edu/projects/ankur)


This PhD thesis style was made during Ankur Gupta's PhD thesis at the
Department of Chemical and Biological Engineering, 
University of Wisconsin-Madison, Madison, WI. 

This thesis was made with ideas from these sources:

*  classicthesis (http://www.ctan.org/tex-archive/macros/latex/contrib/classicthesis/)
*  sb-wi-thesis (https://mywebspace.wisc.edu/sbaumgart/web/LaTeX-template/sb-wi-thesis-template.zip)
*  ecsthesis (http://users.ecs.soton.ac.uk/srg/softwaretools/document/templates/)
*  UW Doctoral Dissertation Guidelines (https://grad.wisc.edu/currentstudents/wp-content/uploads/sites/9/2014/04/Guidelines-for-Electronic-Deposit-of-PhD-Dissertations1.pdf)

To see a full-fleshed example of this template, see http://jbrwww.che.wisc.edu/theses/gupta.pdf.

License
==
GPL v3. See LICENSE. 


Basic file description
==

The main class file is `uwcbethesis.cls`. You won't need to edit this file. 
The main file is `thesis.tex`, all other `.tex` files are inputted into `thesis.tex`. 
The main configuration file is `uwcbethesis-config.tex`. You will need to edit this 
file to put your personal data in (such as name, thesis title, etc.). 

Each chapter is a separate folder with a .tex file in it. These `.tex` files are then 
inputted into `thesis.tex`. 

The file `shortcuts.tex` contains various custom commands. I have provided a few commands 
to start things off but you will probably need to edit it to add/remove commands. 

The citations are in `citations.bib` file. This .bib file is loaded in 
`frontmatter/BibliographyPage.tex`. The folder frontmatter/ contains all the formal files 
such as abstract page, acknowledgements page, title page, etc. 


How to compile?
==

This thesis template uses citations and indexing. On a unix or MacOS platform, run these commands 
in a terminal:

`pdflatex thesis.tex

pdflatex thesis.tex

makeindex thesis.idx

bibtex thesis.aux

pdflatex thesis.tex

bibtex thesis.aux

pdflatex thesis.tex`

You may need to run these commands repeatedly if you still see cross-referencing errors (such 
as ? instead of citations, ?? instead of chapter numbers). 










REM To use this script. Install:
REM 0.Pandoc: https://pandoc.org/installing.html
REM 1.Python: https://www.python.org/downloads/release/python-396/
REM 2.Then:  pip install pandoc-latex-environment 
REM 3.MikTex: https://miktex.org/download
REM 4. Make sure to update all packages using "miktex console" once before running

pandoc ^
 0_intro/A_Practica.md^
 1_csharpbasics/A_practica.md^
 2_tekst/a_Practica.md^
 3_data/A_Practica.md^
 4_beslissingen/a_practica.md^
 --variable toc-own-page=true^
 --variable book=true^
 --top-level-division=chapter^
 --top-level-division=chapter^
 --filter pandoc-latex-environment^
 --self-contained^
 --resource-path=assets^
 -s --toc --verbose -o book.pdf 

 REM HTTPS://learnbyexample.github.io/customizing-pandoc/
 REM HTTPS://github.com/Wandmalfarbe/pandoc-latex-template
 REM HTTPS://stackoverflow.com/questions/30880200/pandoc-what-are-the-available-syntax-highlighters
 REM --include-before-body cover.tex
 REM   

 REM  
 REM 
module           = "math-analysis-vol2-solutions"
version          = "v1.7.0"

typesetfiles     = { "main.tex" }
supportdir       = "."
typesetruns      = 1
typesetsuppfiles = {
    "chapters/**/*.tex",
    "bib/*.bib",
    "preambles/*.sty",
    "fonts/*.ttf",
    "fonts/*.otf"

}

function typeset(file)
    local cmd = "latexmk -lualatex -interaction=nonstopmode -file-line-error -shell-escape -synctex=1 " .. file
    return runcmd(cmd, typesetdir)
end

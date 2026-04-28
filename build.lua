module           = "math-analysis-vol2-solutions"
version          = "v1.7.0"

typesetfiles     = { "main.tex" }
supportdir       = "./src"
typesetruns      = 1
typesetsuppfiles = {
    "chapters/**/*.tex",
    "bib/*.bib",
    "preambles/*.sty",
    "fonts/*.ttf",
    "fonts/*.otf"

}

function typeset(file)
    local cmd = "latexmk -lualatex -interaction=nonstopmode -file-line-error -shell-escape " .. file
    return runcmd(cmd, typesetdir)
end

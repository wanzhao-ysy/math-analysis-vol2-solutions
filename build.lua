module           = "math-analysis-vol2-solutions"
version          = "v1.11.1"

typesetfiles     = { "main.tex" }
supportdir       = "./src"
typesetruns      = 1
typesetsuppfiles = {
    "tex/**/*.tex",
    "bibliography/*.bib",
    "styles/*.sty",
    "assets/fonts/*.ttf",
    "assets/fonts/*.otf"

}

function typeset(file)
    local cmd = "latexmk -lualatex -interaction=nonstopmode -file-line-error -shell-escape " .. file
    return runcmd(cmd, typesetdir)
end

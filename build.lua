module           = "math-analysis-vol2-solutions"
version          = "v1.11.0"

typesetfiles     = { "main.tex" }
supportdir       = "./src"
typesetruns      = 1
typesetsuppfiles = {
    "tex/**/*.tex",
    "bib/*.bib",
    "stys/*.sty",
    "fonts/*.ttf",
    "fonts/*.otf"

}

function typeset(file)
    local cmd = "latexmk -lualatex -interaction=nonstopmode -file-line-error -shell-escape " .. file
    return runcmd(cmd, typesetdir)
end

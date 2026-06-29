module           = "math-analysis-vol2-solutions"
version          = "v2.0.0"

typesetfiles     = { "main.tex" }
supportdir       = "./src"
typesetruns      = 1
typesetsuppfiles = {
    "contents/**/*.tex",
    "bibliography/*.bib",
    "styles/*.sty",
    "assets/fonts/*.ttf",
    "assets/fonts/*.otf",
    "assets/images/*.jpg",
}

function typeset(file)
    local cmd = "latexmk -lualatex -interaction=nonstopmode -file-line-error -shell-escape " .. file
    return runcmd(cmd, typesetdir)
end

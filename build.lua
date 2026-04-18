module = "math-analysis-vol2-solutions"
typesetfiles = { "main.tex" }
supportdir = "."
typesetruns = 1
typesetsuppfiles = {
    "chapters/**/*.tex",
    "bib/*.bib",
    "preambles/*.sty",
    "fonts/*.ttf"
}

function typeset(file)
    local cmd = "latexmk -lualatex -interaction=nonstopmode -file-line-error -shell-escape -synctex=1 " .. file
    return runcmd(cmd, typesetdir)
end

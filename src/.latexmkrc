# LaTeXmk 配置文件

$pdf_mode = 4; # 使用 LuaLaTeX 引擎直接生成 PDF
$postscript_mode = 0; # 不生成 PostScript 文件
$dvi_mode = 0; # 不生成 DVI 文件

# 使用相对路径引用共享资源
$ENV{'TEXINPUTS'} = './common/styles//:' . ($ENV{'TEXINPUTS'} || ''); # 添加 common/styles 目录到 TEXINPUTS 环境变量
$ENV{'BIBINPUTS'} = './common/bib//:' . ($ENV{'BIBINPUTS'} || ''); # 添加 common/bib 目录到 BIBINPUTS 环境变量

# LaTeXmk 配置文件
$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;

# 使用相对路径引用共享资源
$ENV{'TEXINPUTS'} = './common/styles//:' . ($ENV{'TEXINPUTS'} || '');
$ENV{'BIBINPUTS'} = './common/bib//:' . ($ENV{'BIBINPUTS'} || '');

# # LaTeXmk 配置文件

# $pdf_mode = 4; # 使用 LuaLaTeX 引擎直接生成 PDF
# $postscript_mode = 0; # 不生成 PostScript 文件
# $dvi_mode = 0; # 不生成 DVI 文件

# # %O 是 latexmk 传递的其它选项占位符，%S 是源文件占位符
# $lualatex = 'lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# # 使用相对路径引用共享资源
# $ENV{'TEXINPUTS'} = './common/styles//:' . ($ENV{'TEXINPUTS'} || ''); # 添加 common/styles 目录到 TEXINPUTS 环境变量
# $ENV{'BIBINPUTS'} = './common/bib//:' . ($ENV{'BIBINPUTS'} || ''); # 添加 common/bib 目录到 BIBINPUTS 环境变量


# 操作系统判定
# MSWin32: 原生 Windows
# cygwin/msys: Windows 下的类 Unix 模拟层
# darwin: macOS
# linux: 各类 Linux 发行版 (含 WSL)
my $is_windows = ($^O =~ /MSWin32|cygwin|msys/);
my $is_mac     = ($^O =~ /darwin/);
my $is_linux   = ($^O =~ /linux/);

# 设置路径分隔符
# Windows 使用分号 ';'，Linux 和 macOS 均属于 Unix 体系，使用冒号 ':'
my $sep = $is_windows ? ';' : ':';

# 基础编译配置
$pdf_mode = 4;          # 指定使用 LuaLaTeX 直接生成 PDF
$postscript_mode = 0;
$dvi_mode = 0;

# 引擎指令
# 增加 -interaction=nonstopmode 确保脚本化编译不卡住
$lualatex = 'lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# 跨平台环境变量追加
# 使用 $sep 变量自动适配平台
$ENV{'TEXINPUTS'} = './common/styles//' . $sep . ($ENV{'TEXINPUTS'} || '');
$ENV{'BIBINPUTS'} = './common/bib//' . $sep . ($ENV{'BIBINPUTS'} || '');

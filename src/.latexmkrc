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

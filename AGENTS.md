# PROJECT KNOWLEDGE BASE

**Generated:** 2026-05-17
**Project:** 《数学分析讲义（第二册）》习题解析
**Stack:** LuaLaTeX + ctexbook + l3build

## OVERVIEW

数学分析习题解答 LaTeX 项目。采用 ctexbook 文档类，使用 LuaLaTeX 编译，通过 l3build 构建系统生成 PDF。项目包含 4 个主要章节（第 8-11 章），每章由若干节和综合习题组成。

## STRUCTURE

```text
./
├── main.tex                  # 主文档入口
├── build.lua                 # l3build 构建配置
├── src/
│   ├── styles/               # 自定义宏包（颜色、布局、数学、环境等）
│   ├── contents/
│   │   ├── frontmatter/      # 前言、扉页、目录
│   │   ├── mainmatter/
│   │   │   └── chapters/     # 第 8-11 章内容
│   │   └── backmatter/       # 参考文献、FDL 协议
│   ├── assets/fonts/         # LXGW 字体、NotoColorEmoji
│   └── bibliography/           # references.bib
├── .github/
│   ├── workflows/            # CI: l3build 构建检查
│   └── tl_packages           # TeX Live 依赖清单
└── build/                    # l3build 输出目录
```

## WHERE TO LOOK

| Task | Location | Notes |
| ------ | ---------- | ------- |
| 新增/修改章节内容 | `src/contents/mainmatter/chapters/XX-*/` | 每节一个 .tex 文件，XX-main.tex 聚合 |
| 修改页面/章节样式 | `src/styles/math-solutions-layout.sty` | geometry、titlesec、ctexset 配置 |
| 修改颜色方案 | `src/styles/math-solutions-colors.sty` | 定义 ThemeDarkBlue、ThemeRose 等 |
| 修改数学字体/符号 | `src/styles/math-solutions-math.sty` | NewCMMath、fixdif、\e/\ii/\uppi |
| 修改定理/习题环境 | `src/styles/math-solutions-tcb.sty` | tcolorbox: problem、note 环境 |
| 修改解答/证明格式 | `src/styles/math-solutions-env.sty` | solution、myproof、\ansitem |
| 添加参考文献 | `src/bibliography/references.bib` | biblatex + biber 后端 |
| 构建 PDF | `l3build doc` | 或 `latexmk -lualatex main.tex` |

## CODE MAP

| Symbol | Type | Location | Role |
| -------- | ------ | ---------- | ------ |
| `math-solutions` | Package | `src/styles/math-solutions.sty` | 样式总入口，聚合所有子模块 |
| `problem` | Environment | `math-solutions-tcb.sty` | 习题盒子（深蓝边框） |
| `note` | Environment | `math-solutions-tcb.sty` | 注释盒子（绛粉边框） |
| `solution` | Environment | `math-solutions-env.sty` | 解答环境（自动加结束符） |
| `myproof` | Environment | `math-solutions-env.sty` | 证明环境（自动加结束符） |
| `\ansitem` | Command | `math-solutions-env.sty` | 子问题标记：(1)...(2) |
| `\e, \ii, \uppi` | Command | `math-solutions-math.sty` | 正体数学常数 |

## CONVENTIONS

- **文档类**: `ctexbook[a4paper,UTF8,fontset=lxgw]`
- **引擎**: LuaLaTeX（必须，依赖 `unicode-math` 和 `fontspec`）
- **数学字体**: NewCMMath-Book.otf，正文 LXGW 字体
- **列表格式**: `enumerate` 一级标签为 `(\arabic*)`
- **公式**: `\everymath{\displaystyle}` 全局展示模式
- **交叉引用**: `zref-clever`（中文智能引用），非标准 `\ref`
- **参考文献**: `biblatex[backend=biber,style=gb7714-2025]`
- **构建**: `l3build doc` 一键构建，支持 Ubuntu/macOS/Windows CI

## ANTI-PATTERNS (THIS PROJECT)

- **禁止**使用 `\usepackage{...}` 直接加载已被 `math-solutions.sty` 引入的宏包
- **禁止**修改 `main.tex` 中的 `\setcounter{chapter}{7}` 基准偏移
- **禁止**在 `\begin{solution}` 外使用 `\ansitem`（会导致间距异常）
- **禁止**使用 `pdflatex` 或 `xelatex` 编译（字体系统依赖 LuaLaTeX）
- **禁止**在 `\chapter` 标题后手动添加装饰线（由 `ctexset` 自动生成）

## UNIQUE STYLES

- **配色方案**: Ayaka-inspired 柔和配色（深藏青/灰蓝/绛粉/藏红/米白背景）
- **页面背景**: `ThemePaperLight` 米白色，非纯白
- **章节标题**: 藏红色编号 + 双装饰线（粗线+细线）
- **超链接**: 无文字着色，使用 ThemeWine 下划线边框
- **结束符**: solution 用 `\mdblksquare`（黑方块），proof 用 `\mdwhtsquare`（白方块）

## COMMANDS

```bash
# 一键构建 PDF
l3build doc

# 手动编译（调试）
latexmk -lualatex -interaction=nonstopmode -file-line-error -shell-escape main.tex

# 检查 TeX 依赖
# 参考 .github/tl_packages，推荐 TeX Live >= 2025
```

## NOTES

- `src/` 下的文件通过 `l3build` 的 `typesetsuppfiles` 自动打包到构建目录
- CI 在 push 时对每个 commit 在三平台（Ubuntu/macOS/Windows）构建
- `.chktexrc` 忽略 `main.tex` 的警告 27（书签相关）
- 字体文件 `*.ttf`/`*.otf` 已提交到仓库，无需系统安装
- 第十章目前为 "施工中" 状态，第十一章 "待动工"

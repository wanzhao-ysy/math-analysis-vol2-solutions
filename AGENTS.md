# PROJECT KNOWLEDGE BASE

**Generated:** 2026-05-17
**Commit:** 4b80044
**Branch:** main

## OVERVIEW

《数学分析讲义（第二册）》习题解析 — Chinese math analysis solutions book. LuaLaTeX + ctexbook + l3build. Chapters 8–11, Ch.8/9 complete, Ch.10/11 in progress.

## STRUCTURE

```text
./
├── main.tex              # 唯一入口，\documentclass{ctexbook}，\include 各章
├── build.lua             # l3build 配置：supportdir="./src"，typeset() 覆写为 latexmk
├── announcement.md       # 发布公告（push 触发 GitHub Release）
├── .chktexrc             # ChkTeX 配置（忽略 main.tex 警告 27）
├── .github/
│   ├── tl_packages       # TeX Live 包清单（114 包）
│   └── workflows/        # l3build.yaml（CI 构建检查）、release.yaml（发布）
└── src/
    ├── styles/           # 8 个 .sty 风格包（math-solutions-*.sty）
    ├── contents/
    │   ├── frontmatter/  # titlepage、preface（TODO 状态）
    │   ├── mainmatter/chapters/
    │   │   ├── 08-analytic-geometry-of-space/           # ✅ 校对完成
    │   │   ├── 09-differential-calculus-of-multivariable-functions/  # ✅ 校对完成
    │   │   ├── 10-multiple-integrals-of-multivariable-functions/     # 🚧 施工中
    │   │   └── 11-line-and-surface-integrals/           # ⏳ 待动工（缺 11.4/11.5）
    │   └── backmatter/   # GFDL 许可证
    ├── bibliography/      # references.bib（GB/T 7714-2025 格式）
    └── assets/fonts/      # NewCMMath-Book.otf、NotoColorEmoji.ttf
```

## WHERE TO LOOK

| 任务 | 位置 | 备注 |
| ------ | ----- | ------ |
| 添加/修改习题解答 | `src/contents/mainmatter/chapters/<章节>/` | 每题：`\begin{problem}...\end{problem}` → `\begin{solution}` 或 `\begin{myproof}` |
| 修改章节结构 | `<章节>/<NN>-main.tex` | `\chapter{...}` + `\input{section-file.tex}` 列表 |
| 修改全局样式 | `src/styles/math-solutions-*.sty` | 子包说明见 `src/styles/AGENTS.md` |
| 修改构建配置 | `build.lua` | 编译命令、TeX Live 包列表 |
| 添加新章节 | 1) 创建 `<NN>-*/` 目录 + `<NN>-main.tex` 2) `main.tex` 中加 `\include{<NN>-main.tex}` 3) `build.lua` 的 `typesetsuppfiles` 无需修改（已用 glob） | |
| 发布新版本 | 更新 `build.lua` 中 `version`，编辑 `announcement.md`，push → CI 自动发布 | |
| 检查编译 | `l3build doc` | 输出：`build/doc/main.pdf` |

## CONVENTIONS

- **入口**：`main.tex` 是唯一入口文件，使用 `\include`（非 `\input`）加载各章主文件
- **章节起始**：`\setcounter{chapter}{7}` — 从第 8 章开始（匹配教材第二册编号）
- **章节文件命名**：`<NN>-main.tex`（章节入口）、`<NN>-exercises.tex`（综合习题）、`section-name.tex`（节内容，kebab-case 英文）
- **习题环境**：`\begin{problem}{标题}{Label}` ... `\end{problem}` → `\begin{solution}` 或 `\begin{myproof}` → `\end{solution}` 或 `\end{myproof}`
- **子题标记**：用 `\ansitem{1}`、`\ansitem{2}` 标记多小题（不用嵌套 enumerate）
- **样式加载**：仅 `\usepackage{math-solutions}`（自动拉入 7 个子包）
- **字体**：正文 LXGW WenKai（落霞孤鹜），数学 New Computer Modern Math
- **颜色**：全局用 ThemeDarkBlue / ThemeWine / ThemeRose / ThemePaper / ThemeMidBlue / ThemeLightBlue — 禁止直接写 RGB 值
- **交叉引用**：用 `\zcref{label}` 自动生成中文标签（"公式 1" 等）
- **参考文献**：biblatex + biber，格式 gb7714-2025
- **每节另起一页**：`\sectionbreak{\clearpage}`（layout.sty 中定义）

## ANTI-PATTERNS (本项目)

- **禁止**在 `.tex` 内容文件中直接写 `\usepackage{...}`（所有加载统一在 `main.tex` + `math-solutions.sty`）
- **禁止**在正文中硬编码颜色 RGB 值（一律使用 Theme* 颜色名）
- **禁止**在 `main.tex` 中使用 `\input`（章节用 `\include`，节内用 `\input`）
- **不要**用标准 `enumerate` 标记子题（用 `\ansitem{}`）
- **不要**在 `\begin{equation}` 内使用 `split` 环境（直接用 `aligned`）
- **不要**提交编译产物（`build/` 目录已 gitignore，`*.pdf` 已排除）
- **不要**修改 `.sty` 文件时破坏向后兼容（现有 .tex 文件依赖当前宏定义）
- **被注释掉的 `\input` 行**说明该节尚未编写（如 11-main.tex 中的 11.4/11.5），不要删除注释——保留作为占位符

## UNIQUE STYLES

- 全局 `\everymath{\displaystyle}` — 所有行内公式按展示模式渲染
- 彩色页面背景：`\pagecolor{ThemePaperLight}`
- 章节标题下双色装饰线：2pt ThemeWine + 0.5pt ThemeRose
- 页眉双色线：1.5pt ThemeWine + 0.5pt ThemeRose
- 解答结束标记：`$\mdblksquare$`（实心方块），证明结束标记：`$\mdwhtsquare$`（空心方块）
- 目录双栏排版（multicols）
- `\setmathfont{NewCMMath-Book.otf}` — 自定义 OpenType 数学字体

## COMMANDS

```bash
# 本地编译
l3build doc

# 清理并重编译
rm -rf build/ && l3build doc

# 使用 latexmk 直接编译（调试用）
latexmk -lualatex -interaction=nonstopmode -file-line-error main.tex

# 代码检查
chktex main.tex src/contents/**/*.tex -v0
```

## NOTES

- **TeXL Live ≥ 2025 必须**：依赖 `lxgw-fonts` 和 `NewCMMath-Book.otf`
- **CI 跨平台**：GitHub Actions 在 ubuntu/macos/windows 上均运行构建检查
- **l3build 仅运行 1 次 typeset**：latexmk 内部处理多遍编译（交叉引用、目录、参考文献）
- **前言文件为 TODO 状态**：`preface-overview.tex` 和 `preface-contrib.tex` 内容为空，待编写
- **第 11 章不完整**：`surface-integrals-of-vector-fields.tex` 和 `gauss-and-stokes.tex` 未编写，已在 `11-main.tex` 中注释
- **第一章是第 8 章**：计数器偏移是为了匹配原教材章节编号，不是遗漏前 7 章
- **Emoji 支持**：`\emojifont{😀}` 可用，字体已内置
- **仓库地址**：`github.com/wanzhao-ysy/math-analysis-vol2-solutions`

# STYLES KNOWLEDGE BASE

**Scope:** `src/styles/` — 项目专属 LaTeX 宏包系统

## OVERVIEW

模块化样式系统，通过 `math-solutions.sty` 总入口聚合 6 个子模块。提供配色、布局、数学字体、浮动体、tcolorbox 环境、交叉引用的一站式配置。

## STRUCTURE

```text
src/styles/
├── math-solutions.sty           # 总入口：\usepackage{math-solutions}
├── math-solutions-colors.sty      # 颜色定义 + 页面背景
├── math-solutions-layout.sty      # geometry + ctexset + titlesec
├── math-solutions-math.sty        # unicode-math + 正体符号 + fixdif
├── math-solutions-floats.sty      # 浮动体（图表）配置
├── math-solutions-tcb.sty         # tcolorbox: problem, note
├── math-solutions-env.sty         # solution, myproof, \ansitem
└── math-solutions-ref.sty         # zref-clever + hyperref + biblatex
```

## WHERE TO LOOK

| Task | File | Key Config |
| ------ | ------ | ------------ |
| 修改主题色 | `math-solutions-colors.sty` | `\definecolor{ThemeDarkBlue}{RGB}{71,85,142}` 等 |
| 修改页面边距 | `math-solutions-layout.sty` | `geometry[inner=2cm,outer=2cm,...]` |
| 修改章节标题样式 | `math-solutions-layout.sty` | `\ctexset{chapter={...}, section={...}}` |
| 修改数学字体 | `math-solutions-math.sty` | `\setmathfont{NewCMMath-Book.otf}` |
| 修改/新增正体符号 | `math-solutions-math.sty` | `\newcommand{\e}{\symup{e}}` 模式 |
| 修改习题环境外观 | `math-solutions-tcb.sty` | `\newtcbtheorem{problem}{习题}{...}` |
| 修改解答结束符 | `math-solutions-env.sty` | `\mdblksquare` / `\mdwhtsquare` |
| 修改引用格式 | `math-solutions-ref.sty` | `\zcsetup{...}` / `\zcRefTypeSetup` |

## CONVENTIONS

- 每个子模块以 `\endinput` 结尾，防止载入尾部空白
- 模块间通过 `\RequirePackage` 互相引用，无硬编码顺序依赖
- 颜色定义先于布局/环境模块加载（`math-solutions-colors` 最先）
- 数学符号统一使用 `\symup{...}` 而非 `\mathrm`（兼容 unicode-math）
- tcolorbox 环境编号按 `section` 重置：`number within=section`

## ANTI-PATTERNS

- **禁止**在子模块中使用 `\usepackage`（应为 `\RequirePackage`）
- **禁止**在 `math-solutions.sty` 外直接加载 `unicode-math` 或 `fontspec`（会有选项冲突）
- **禁止**重新定义 `\e`、`\ii`、`\uppi`（已在 math 模块固化）
- **禁止**绕过 `math-solutions.sty` 直接加载子模块（可能缺少前置宏包）

## NOTES

- `\everymath{\displaystyle}` 影响所有行内公式，注意矩阵等紧凑型场景
- `fixdif` 宏包自动修正微分算子 `d` 为正体，无需手动 `\mathrm{d}`
- Emoji 支持通过 `NotoColorEmoji.ttf` 的 `\emojifont` 字体族实现
- `zref-clever` 的 `equation` 类型已汉化为 "公式"，直接使用 `\zcref{label}`

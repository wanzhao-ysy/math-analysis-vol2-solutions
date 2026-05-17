# STYLES MODULE

## OVERVIEW

8 个 `.sty` 风格文件，由 `math-solutions.sty`（入口包 / wrapper package）统一加载，形成主题配色 → 排版布局 → 数学字体 → 浮动体 → 定理盒子 → 自定义环境 → 交叉引用的完整样式链。

## STRUCTURE

```text

styles/
├── math-solutions.sty           # 入口包：预传选项 + \RequirePackage 全部子包
├── math-solutions-colors.sty    # 颜色：6 色主题（Ayaka 风格）+ 页面底色
├── math-solutions-layout.sty    # 布局：geometry + titlesec + fancyhdr + multicol TOC
├── math-solutions-math.sty      # 数学：unicode-math + NewCMMath-Book + \displaystyle 全局
├── math-solutions-floats.sty    # 图表：graphicx + TikZ/pgfplots + tabularray + enumitem
├── math-solutions-tcb.sty       # 盒子：tcolorbox → problem（深蓝）、note（绛粉）环境
├── math-solutions-env.sty       # 环境：solution（\mdblksquare）、myproof（\mdwhtsquare）、\ansitem
└── math-solutions-ref.sty       # 引用：zref-clever 中文标签 + hyperref + biblatex gb7714-2025
```

## WHERE TO LOOK

| 任务 | 文件 | 备注 |
| ------ | ------ | ------ |
| 修改配色 | `math-solutions-colors.sty` | 6 个 `\definecolor{Theme*}` + `\pagecolor` |
| 调整页边距/页眉 | `math-solutions-layout.sty` | geometry + fancyhdr + ctexset |
| 换数学字体 | `math-solutions-math.sty` | `\setmathfont{}` 调用 |
| 修改习题/注释盒子样式 | `math-solutions-tcb.sty` | `my_base_style` + 两个 `\newtcbtheorem` |
| 修改解答/证明环境 | `math-solutions-env.sty` | `solution`、`myproof`、`\ansitem` 三个定义 |
| 修改引用格式 | `math-solutions-ref.sty` | `\zcsetup`、biblatex 选项 |
| 添加新浮动体/图表宏包 | `math-solutions-floats.sty` | TikZ、pgfplots、tabularray |
| 修改入口包加载逻辑 | `math-solutions.sty` | `\PassOptionsToPackage` + `\RequirePackage` 顺序 |

## CONVENTIONS

- **入口包模式**：`math-solutions.sty` 仅做参数预传和子包加载，不含功能代码
- **加载顺序重要**：colors → layout → math → floats → tcb → env → ref（前包依赖后包则出错）
- **颜色引用**：所有 `.sty` 和 `.tex` 文件必须用 `Theme*` 颜色名，不硬编码 RGB
- **向后兼容**：修改 `.sty` 前检查所有 `.tex` 中对该宏的引用。现有子题用 `\ansitem{}`，盒子用 `problem`/`note`，禁止改名
- **字体路径**：`NewCMMath-Book.otf` 和 `NotoColorEmoji.ttf` 在 `../assets/fonts/`（相对路径由 l3build `typesetsuppfiles` 解析）
- **`\makeatletter` 使用**：仅 `math-solutions-colors.sty` 中使用（补丁 `\default@color`），其他文件禁止

## ANTI-PATTERNS

- **禁止**直接在 `.tex` 内容文件中 `\RequirePackage{math-solutions-*.sty}`（统一用 `\usepackage{math-solutions}`）
- **禁止**修改入口包中 `\PassOptionsToPackage` 的参数顺序（会影响子包行为）
- **禁止**在子包中重复定义入口包已声明的颜色（`Theme*` 只在 colors.sty 中定义）
- **禁止**在 `math-solutions-env.sty` 中重新定义 `problem`/`note`（已在 tcb.sty 中定义）
- **禁止**在样式文件中使用 `\input` 或 `\include`（样式文件只能 `\RequirePackage` 其他样式）

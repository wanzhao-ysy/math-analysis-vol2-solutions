# 《数学分析讲义（第二册）》习题解析

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/TeX%20Live-%20%3E%3D2025-green?logo=latex&style=flat-square" alt="TeX Live">
  <img src="https://img.shields.io/badge/Engine-LuaLaTeX-orange?style=flat-square" alt="Engine">

</p>

本项目是 **《数学分析讲义（第二册）》** （程艺 陈卿 李平 编著）第一版 的详细习题解答。基于 `ctexbook` 文档类编写，旨在提供一份排版、内容完备的参考方案。

> [!NOTE]
> 本项目特别使用了 **LaTeXmk** 配合 **LuaLaTeX** 引擎，以支持更好的 OpenType 字体处理和原生 Emoji 渲染。

---

## 📸 预览 (Preview)

| 页面预览 | 关键特性 |
| :--- | :--- |
| <img src="docs/assets/preview_chapter1.png" width="400" alt="预览图"> | <ul><li>基于 TikZ 的几何绘图</li><li>完整简明的推导过程</li><li>方框突出答案显示</li><li>舒适的配色</li></ul> |

---

## 📈 编写进度 (Progress)

| 章节 | 标题 | 状态 | 备注 |
| :--- | :--- | :---: | :--- |
| 第八章 | 空间解析几何 | ✅ | 全面校对完成 |
| 第九章 | 多变量函数的微分学 | ✅ | 全面校对完成 |
| 第十章 | 多变量函数的重积分 | 🚧 | 正在施工 |
| 第十一章 | 曲线积分和曲面积分 | ⏳ | 待动工 |
| ... | ... | ... | ... |

---

## 🛠️ 环境要求

- **操作系统**: Windows 10/11, macOS 10.15+ 或 Linux（任意发行版，包含 WSL 环境）。
- **TeX 发行版**: [TeX Live 2025](https://www.tug.org/texlive/) 或更高版本。
- **编译引擎**: `LuaLaTeX` (由于 CTeX 宏包在 LuaTeX 下对中文字体处理更佳)。
- **字体要求**:
  - 主字体使用 `LXGW-fonts` 宏包提供的 **LXGW**（落霞孤鹜） 系列字体。
  - 数学字体使用 **New Computer Modern**，通过 `unicode-math` 宏包加载。
- **Python 环境**: 用于 `memoize` 生成 TikZ 图形图形的缓存文件时需要的 `pdfrw2` 库。
- **编辑器推荐**: [VSCode](https://code.visualstudio.com/) + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 扩展。

---

## 🚀 编译指南

1. 克隆仓库：

    ```bash
    git clone https://github.com/wanzhao-ysy/math-analysis-vol2-solutions.git
    cd math-analysis-vol2-solutions
    ```

2. 安装依赖：
    - 确保 TeX Live 2025 已安装，并且 `LuaLaTeX` 可用。
    - 安装 Python 依赖：

    ```bash
    uv sync
    ```

3. 编译文档：

    ```bash
    cd src
    uv run latexmk main.tex
    ```

    这一步也可以直接在 VSCode 中使用 LaTeX Workshop 的编译功能，在打开 `main.tex` 文件后点击编译按钮或使用快捷键 `Ctrl+Alt+B`。

4. 编译完成后，结尾提示为

    ```bash
    Latexmk: All targets (main.pdf) are up-to-date
    ```

5. 生成的 PDF 文件位于 `src` 目录下，命名为 `main.pdf`。

---

## 🤝 参与贡献

欢迎对现有的解题过程中的任何错误进行指正，或对排版细节提出改进建议。

**提交改进建议**：请转到 [Issue](https://github.com/wanzhao-ysy/math-analysis-vol2-solutions/issues) 描述内容。

---

## ⚖️ 许可证

本项目采用 [MIT](LICENSE) 开源，可供学习交流使用。

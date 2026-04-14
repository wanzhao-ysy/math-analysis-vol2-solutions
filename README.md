# 《数学分析讲义（第二册）》习题解析

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/TeX%20Live-%20%3E%3D2025-green?logo=latex&style=flat-square" alt="TeX Live">
  <img src="https://img.shields.io/badge/Engine-LuaLaTeX-orange?style=flat-square" alt="Engine">

</p>

本项目是 **《数学分析讲义（第二册）》** （程艺 陈卿 李平 编著）第一版 的详细习题解答。基于 `ctexbook` 文档类编写，旨在提供一份排版、内容完备的参考方案。

> [!NOTE]
> 本项目特别使用了 **l3buid** 配合 **LaTeXmk** 基于 **LuaLaTeX** 引擎，以支持更好的 OpenType 字体处理和原生 Emoji 渲染。
---

## 📖 快速使用

请转到 [Release](https://github.com/wanzhao-ysy/math-analysis-vol2-solutions/releases/latest) 页面下载最新的 PDF 版本，或按照下方的编译指南自行编译。

---

## 📸 预览 (Preview)

<table style="width: 100%; border-collapse: collapse; border: none;">
  <tr style="border: none;">
    <td width="50%" style="border: none; padding: 5px;">
      <img src="https://github.com/user-attachments/assets/b87d4bd1-25b4-4fde-b6f0-fce1d51df21d" width="100%">
    </td>
    <td width="50%" style="border: none; padding: 5px;">
      <img src="https://github.com/user-attachments/assets/46c6de7a-8644-4a92-a26c-eb9774502d3b" width="100%">
    </td>
  </tr>
  <tr style="border: none;">
    <td width="50%" style="border: none; padding: 5px;">
      <img src="https://github.com/user-attachments/assets/20c4ca79-04dc-4c08-9bbc-66ea41e862d3" width="100%">
    </td>
    <td width="50%" style="border: none; padding: 5px;">
      <img src="https://github.com/user-attachments/assets/e17e43a2-d1e8-48d7-b832-02011152d192" width="100%">
    </td>
  </tr>
</table>


---

## 🌟 主要特性

- **全面解答**：~~计划~~涵盖教材中所有习题的详细解答，确保每个步骤都清晰易懂。
- **柔和配色**：采用 ~~原神中神里绫华的~~ 柔和舒适的配色方案，提升阅读体验，减少视觉疲劳。
- **丰富绘图**：使用 `TikZ` 和 `pgfplot` 等宏包绘制高质量的数学图形，更易理解。
- **高质量排版**：使用 `ctexbook` 文档类和 `LXGW-fonts` 字体，提供专业级的数学文档排版。
- **现代编译工具**：采用 `l3build` 和 `LaTeXmk` 进行自动化构建，确保编译过程高效且稳定。

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
- **TeX 发行版**: [TeX Live 2025](https://www.tug.org/texlive/) 或更高版本，及对等的 MacTeX 发行版和 MiKTeX 发行版。
- **编译引擎**: `LuaLaTeX` (由于 CTeX 宏包在 LuaTeX 下对中文字体处理更佳)。
- **字体要求**:
  - 主字体使用 `LXGW-fonts` 宏包提供的 **LXGW**（落霞孤鹜） 系列字体。
  - 数学字体使用 **New Computer Modern**，通过 `unicode-math` 宏包加载。
- **编辑器推荐**: [VSCode](https://code.visualstudio.com/) + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 扩展。

---

## 🚀 编译指南

1. 克隆仓库：

    ```bash
    git clone https://github.com/wanzhao-ysy/math-analysis-vol2-solutions.git
    cd math-analysis-vol2-solutions
    ```

2. 启动编译：

    ```bash
    l3build doc
    ```

    PDF 输出 `main.pdf` 将位于根目录下

---

## 🤝 参与贡献

欢迎对现有的解题过程中的任何错误进行指正，或对排版细节提出改进建议。

**提交改进建议**：请转到 [Issue](https://github.com/wanzhao-ysy/math-analysis-vol2-solutions/issues) 描述内容。

---

## ⚖️ 许可证

本项目采用 [MIT](LICENSE) 开源，可供学习交流使用。

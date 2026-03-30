# 《数学分析（第二册）》习题解析

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![LaTeX](https://img.shields.io/badge/latex-%3E%3D2025-green.svg)

这是一份 **《数学分析（第二册）》习题解析** 的 LaTeX 源码。本项目采用 `ctexbook` 宏包编写，适配中文排版环境。

## 环境要求

本项目在以下环境下测试通过：

- **操作系统**: Windows 11 (WSL2 / Ubuntu 22.04)
- **TeX 发行版**: TeX Live 2025 或更高版本
- **编译引擎**: LuaLaTeX (针对 CTeX 及 Emoji 的使用)
- **编辑器**: VSCode + LaTeX Workshop 扩展

> **WSL2 用户注意**：请确保已通过 `ln -s` 将 Windows 字体链接到 WSL 路径或通过 `fontconfig` 配置了字体访问。

## 编译指南

使用 Latexmk 编译器进行编译，本项目根目录已包含 `.latexmkrc` 配置文件。在终端运行：

```bash
latexmk -lualatex main.tex
```

> **Windows 用户**：

## 文件结构说明

```text
.
├── main.tex             # 主控文件
├── contents/            # 章节内容
│   ├── chap1.tex
│   └── chap2.tex
├── figures/             # 图片资源
├── bib/                 # 参考文献 (main.bib)
├── cls/                 # 自定义样式或模板文件 (.cls / .sty)
└── .latexmkrc           # 编译配置文件
```



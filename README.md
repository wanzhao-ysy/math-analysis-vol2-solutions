# 《数学分析讲义（第二册）》习题解析

<p align="left">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/TeX%20Live-%20%3E%3D2025-green?logo=latex&style=flat-square" alt="TeX Live">
  <img src="https://img.shields.io/badge/Engine-LuaLaTeX-orange?style=flat-square" alt="Engine">
  <img src="https://img.shields.io/badge/Fonts-LXGW--WenKai-66ccff?style=flat-square" alt="Fonts">
</p>

本项目提供 **《数学分析讲义（第二册）》**（程艺、陈卿、李平 编著）第一版的详细习题解答。基于 `ctexbook` 文档类，结合现代 LaTeX 技术栈，旨在打造一份排版精美、逻辑清晰的数学参考。

> [!TIP]
> 本项目采用 **l3build** + **LuaLaTeX** 构建，完美支持 OpenType 字体与原生 Emoji 渲染。

---

## 📸 预览 (Preview)

<!-- 使用表格实现 2x2 紧凑布局 -->
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

- 🎨 **柔和配色**：定制化配色方案（Inspired by Ayaka in Genshin Impact），长时间阅读不疲劳。
- 📐 **矢量绘图**：全量使用 `TikZ` / `pgfplots` 绘制，支持无损放大。
- 🖋️ **优美字体**：内置 `LXGW-fonts` (落霞孤鹜) 配合 `New Computer Modern` 数学字体。
- 🛠️ **自动化流水线**：集成 `l3build` 构建系统，支持一键生成 PDF。

---

## 📈 编写进度 (Progress)

| 章节 | 标题 | 状态 | 备注 |
| :--- | :--- | :---: | :--- |
| 第八章 | 空间解析几何 | ✅ | 校对完成 |
| 第九章 | 多变量函数的微分学 | ✅ | 校对完成 |
| 第十章 | 多变量函数的重积分 | 🚧 | 施工中 |
| 第十一章 | 曲线积分和曲面积分 | ⏳ | 待动工 |

---

## 🚀 快速开始

### 获取 PDF

直接前往 [最新 Release](https://github.com/wanzhao-ysy/math-analysis-vol2-solutions/releases/latest) 下载。

### 本地编译

1. **克隆项目**:

   ```bash
   git clone https://github.com/wanzhao-ysy/math-analysis-vol2-solutions.git
   cd math-analysis-vol2-solutions
   ```

2. **执行构建**:

   ```bash
   l3build doc
   ```

---

## 🤝 贡献与许可证

欢迎通过 [Issue](https://github.com/wanzhao-ysy/math-analysis-vol2-solutions/issues)  提交更正建议。本项目采用 [MIT](LICENSE) 协议。

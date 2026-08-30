# 《数学分析讲义（第一、二册）》习题解析

<p align="left">
  <img src="https://img.shields.io/badge/License-GFDL--1.3-blue.svg?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/TeX%20Live-%20%3E%3D2025-green?logo=latex&style=flat-square" alt="TeX Live">
  <img src="https://img.shields.io/badge/Engine-LuaLaTeX-orange?style=flat-square" alt="Engine">
  <img src="https://img.shields.io/badge/Fonts-LXGW--WenKai-66ccff?style=flat-square" alt="Fonts">
</p>

<p align="center">
  中文 | <a href="https://github.com/wanzhao-ysy/ustc-math-analysis-solutions/blob/main/README.en.md">English</a>
</p>

本项目整理并撰写 **《数学分析讲义（第一、二册）》**（程艺、陈卿、李平 编著，第一版）习题详解，力求提供一份 **推导完整、排版清晰、适合自学与复习** 的数学参考资料．

项目基于 `ctexbook` 文档类构建，采用 **LuaLaTeX + l3build** 工作流，结合 `TikZ` / `pgfplots` 绘图与 OpenType 字体方案，生成高质量 PDF 文档．

> [!TIP]
> 推荐使用 **TeX Live 2025 及以上版本** 进行编译，以获得更稳定的字体与排版效果．

---

## 📸 预览

<table style="width: 100%; border-collapse: collapse; border: none;">
  <tr style="border: none;">
    <td width="50%" style="border: none; padding: 5px;">
      <img src="https://github.com/user-attachments/assets/638b16b0-317e-4ab0-9062-a41dad946132" width="100%">
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

- 🎨 **柔和配色**：定制化配色方案（Inspired by Ayaka in Genshin Impact），长时间阅读不疲劳．
- 📐 **矢量绘图**：全量使用 `TikZ` / `pgfplots` 绘制，支持无损放大．
- 🖋️ **优美字体**：内置 `LXGW-fonts` (落霞孤鹜) 配合 `New Computer Modern` 数学字体．
- 🛠️ **自动化流水线**：集成 `l3build` 构建系统，支持一键生成 PDF．

---

## 📈 编写进度

| 章节 | 标题 | 状态 | 备注 |
| --- | --- | --- | --- |
| 第一章 | 极限 | ✅ | 校对完成 |
| 第二章 | 单变量函数的连续性 | ✅ | 校对完成 |
| 第三章 | 单变量函数的微分学 | ✅ | 校对完成 |
| 第四章 | 不定积分 | ✅ | 校对完成 |
| 第五章 | 单变量函数的积分学 | ✅ | 校对完成 |
| 第六章 | 常微分方程初步 | ✅ | 校对完成 |
| 第七章 | 无穷级数 | ✅ | 校对完成 |
| 第八章 | 空间解析几何 | ✅ | 校对完成 |
| 第九章 | 多变量函数的微分学 | ✅ | 校对完成 |
| 第十章 | 多变量函数的重积分 | ✅ | 校对完成 |
| 第十一章 | 曲线积分和曲面积分 | ✅ | 校对完成 |
| 第十二章 | Fourier 分析 | ✅ | 校对完成 |
| 第十三章 | 反常积分和含参变量的积分 | ✅ | 校对完成 |

---

## 🚀 快速开始

### 获取 PDF

直接前往 [最新 Release](https://github.com/wanzhao-ysy/ustc-math-analysis-solutions/releases/latest) 下载．

### 本地编译

1. **克隆项目**:

   ```bash
   git clone https://github.com/wanzhao-ysy/ustc-math-analysis-solutions.git
   cd ustc-math-analysis-solutions
   ```

2. **执行构建**:

   ```bash
   l3build doc
   ```

---

## 🤝 贡献与许可证

欢迎通过 [Issue](https://github.com/wanzhao-ysy/ustc-math-analysis-solutions/issues)  提交更正建议．本项目采用 [GNU Free Documentation License 1.3](LICENSE) 协议．

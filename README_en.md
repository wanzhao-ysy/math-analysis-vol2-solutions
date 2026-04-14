# Solutions to Exercises in *Lectures on Mathematical Analysis (Volume 2)*

<p align="left">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/TeX%20Live-%20%3E%3D2025-green?logo=latex&style=flat-square" alt="TeX Live">
  <img src="https://img.shields.io/badge/Engine-LuaLaTeX-orange?style=flat-square" alt="Engine">
  <img src="https://img.shields.io/badge/Fonts-LXGW--WenKai-66ccff?style=flat-square" alt="Fonts">
</p>

<p align="center">
  <a href="https://github.com/wanzhao-ysy/math-analysis-vol2-solutions">中文</a> | English
</p>

This project compiles and writes detailed solutions to the exercises in **"Lectures on Mathematical Analysis (Volume 2)"** (First Edition, authored by Cheng Yi, Chen Qing, and Li Ping). It aims to provide a mathematical reference resource that is **complete in derivation, clear in typesetting, and suitable for self-study and review**.

The project is built on the `ctexbook` document class, utilizing a **LuaLaTeX + l3build** workflow, combined with `TikZ` / `pgfplots` for drawing and an OpenType font scheme to generate high-quality PDF documents.

> [!TIP]
> It is recommended to use **TeX Live 2025 or later** for compilation to achieve more stable font and typesetting results.

---

## 📸 Preview

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

## 🌟 Key Features

- 🎨 **Soft Color Scheme**: Customized color palette (Inspired by Ayaka in Genshin Impact), comfortable for extended reading.
- 📐 **Vector Graphics**: All drawings are created using `TikZ` / `pgfplots`, supporting lossless zoom.
- 🖋️ **Elegant Fonts**: Built-in `LXGW-fonts` (Luo Xia Gu Wu) paired with `New Computer Modern` math fonts.
- 🛠️ **Automated Pipeline**: Integrated `l3build` build system, supporting one-click PDF generation.

---

## 📈 Progress

| Chapter | Title | Status | Notes |
| :--- | :--- | :---: | :--- |
| Chapter 8 | Analytic Geometry of Space | ✅ | Proofreading completed |
| Chapter 9 | Differential Calculus of Multivariable Functions | ✅ | Proofreading completed |
| Chapter 10 | Multiple Integrals of Multivariable Functions | 🚧 | Under construction |
| Chapter 11 | Line Integrals and Surface Integrals | ⏳ | Pending |

---

## 🚀 Quick Start

### Get the PDF

Go directly to the [Latest Release](https://github.com/wanzhao-ysy/math-analysis-vol2-solutions/releases/latest) to download.

### Local Compilation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/wanzhao-ysy/math-analysis-vol2-solutions.git
   cd math-analysis-vol2-solutions
   ```

2. **Execute the build**:

   ```bash
   l3build doc
   ```

---

## 🤝 Contribution & License

Corrections and suggestions are welcome via [Issues](https://github.com/wanzhao-ysy/math-analysis-vol2-solutions/issues). This project is licensed under the [MIT](LICENSE) License.

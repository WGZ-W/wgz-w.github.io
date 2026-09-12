---
name: paper-reading
description: Read an academic paper supplied as a PDF, text, DOI, or link and produce structured Chinese reading notes. Use for paper summaries, paper critique, and research-note extraction; do not use for general literature searches unless the user asks to find papers.
---

# Paper Reading

Create a faithful, useful reading note from the paper the user supplies. Use Chinese unless the user requests another language.

## Source discipline

- Base factual claims on the paper or user-provided supplementary material.
- Distinguish the authors' claims from your own interpretation.
- If a detail is absent, inaccessible, or ambiguous, write “未明确说明” rather than guessing.
- Cite the relevant page, section, figure, or table whenever it materially helps verification. Keep quotations short.
- If only an abstract or partial text is available, say so near the beginning and limit conclusions to the available material.

## Reading approach

Adapt depth to the user's request. For a full reading note, identify the research question, motivation, method, evidence, results, limitations, and implications. Explain technical terms briefly when they are important to understanding the paper. Preserve exact experimental settings, metrics, and comparisons when reported.

For a critical reading, assess whether the evidence supports the conclusions, identify stated and plausible limitations, and clearly label any inference that goes beyond the paper.

## Default output

Use this structure unless the user supplies a different template:

# 论文阅读笔记

## 1. 基本信息
- 标题：
- 作者与机构：
- 发表年份、会议或期刊：
- 链接或标识符：
- 研究领域与关键词：

## 2. 一句话总结
- 用不超过三句话说明研究问题、方法和主要结果。

## 3. 研究问题与动机
- 现有研究或方法的不足：
- 本文要解决的问题：
- 核心假设或研究目标：

## 4. 方法
- 整体思路：
- 模型、算法或实验设计：
- 关键模块、公式或流程：
- 与已有方法的主要区别：

## 5. 实验与结果
- 数据集或研究对象：
- 对比方法：
- 评价指标：
- 主要结果：
- 消融实验、稳健性检验或失败案例：

## 6. 贡献与局限
- 主要贡献：
- 作者明确说明的局限：
- 结论依赖的前提或适用范围：

## 7. 批判性阅读
- 证据是否足以支持结论：
- 可能的偏差、遗漏或可复现性风险：
- 值得追问作者的问题：

## 8. 可复用启发
- 对用户研究、项目或写作可能的启发：
- 值得继续阅读的引用、概念或后续问题：

## 9. 术语与关键证据
- 关键术语及简释：
- 必要的短摘录（标注页码或章节）：

## Optional modes

- When the user asks for a quick read, keep sections 1–6 concise and omit sections without useful evidence.
- When the user asks to compare papers, preserve the same headings for each paper, then add a comparison of question, method, evidence, trade-offs, and applicability.
- When the user provides a personal note template, follow it instead of the default output while preserving the source-discipline rules above.

# Decisions / 架构决策记录

<!--
EN: Record meaningful choices so future sessions (and new team members)
    understand why things are the way they are.

中文：记录重要决策，让未来的会话（和新团队成员）能理解为什么是这样设计的。

Use this format:
使用以下格式：
-->

---

## YYYY-MM-DD — Decision Title / 决策标题

**Status / 状态:** accepted | superseded by YYYY-MM-DD entry | deprecated

**Context / 背景:**
<!--
EN: What situation or requirement triggered this decision?
中文：什么情况或需求触发了这个决策？
-->

**Decision / 决策:**
<!--
EN: What was chosen and how will it work?
中文：选择了什么方案，它是如何工作的？
-->

**Consequences / 影响:**
<!--
EN: What are the expected effects — both positive and negative?
中文：预期影响是什么——包括正面和负面的。
-->

**Alternatives Considered / 备选方案:**
<!--
EN: What other options were evaluated and why were they rejected?
中文：评估了哪些其他选项，为什么被拒绝？
-->

---

<!--
Example / 示例:

## 2026-03-12 — Use Vitest instead of Jest / 用 Vitest 替代 Jest

**Status:** accepted

**Context:**
Project uses Vite for bundling. Jest requires additional transform configuration for ESM and TypeScript.
项目使用 Vite 打包，Jest 需要额外配置 ESM 和 TypeScript 转换。

**Decision:**
Use Vitest as the test runner. It shares Vite's config and supports ESM natively.
使用 Vitest 作为测试运行器，它共享 Vite 配置并原生支持 ESM。

**Consequences:**
- Positive: Zero-config TypeScript and ESM support, faster watch mode. / 优点：零配置 TypeScript 和 ESM 支持，更快的监听模式。
- Negative: Smaller ecosystem of plugins compared to Jest. / 缺点：插件生态系统比 Jest 小。

**Alternatives Considered:**
- Jest + SWC: works but adds configuration overhead. / 可用但增加配置开销。
- Node.js native test runner: too minimal for component testing. / 对组件测试过于简陋。
-->

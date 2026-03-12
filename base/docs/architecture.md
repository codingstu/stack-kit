# Architecture / 架构设计

## Top-Level Modules / 顶级模块
<!--
EN: List the main folders and explain each one's responsibility.
中文：列出主要文件夹并说明每个文件夹的职责。

Example / 示例:
`src/`    — application source code / 应用程序源代码
`tests/`  — all test files mirroring src/ structure / 对应 src/ 结构的测试文件
`docs/`   — project documentation / 项目文档
-->

| Folder / 文件夹 | Responsibility / 职责 |
|----------------|----------------------|
| | |

## Module Boundaries / 模块边界

<!--
EN: Define what belongs where. Each concern should have exactly one home.
中文：定义什么内容属于哪个地方。每个关注点应当只有一个存放位置。
-->

| Concern / 关注点 | Where It Lives / 所在位置 | Does NOT Belong In / 不应出现在 |
|-----------------|--------------------------|-------------------------------|
| UI / presentation | | route handlers, services |
| Domain / business logic | | UI components, data access |
| Data access / persistence | | domain logic, UI |
| External integrations | | domain logic |
| Configuration | | scattered across modules |
| Tests | | production bundles |

## Data Flow / 数据流

<!--
EN: Describe how data enters, gets validated, transformed, and persisted.
中文：描述数据如何进入、验证、转换和持久化。
-->

```
Input → Validation → Domain Logic → Persistence / Output
输入  →    验证    →   业务逻辑   →  持久化 / 输出
```

<!--
Example / 示例:
1. HTTP request hits route handler / HTTP 请求到达路由处理器
2. Request body validated against schema / 请求体按 Schema 验证
3. Service layer applies business rules / Service 层执行业务规则
4. Repository persists to database / Repository 持久化到数据库
5. Response serialized and returned / 序列化响应并返回
-->

## Key Conventions / 关键约定
<!--
EN: Document your project-specific conventions below.
中文：在下方记录项目的具体约定。
-->

- File naming / 文件命名: (e.g., kebab-case, PascalCase for components)
- Export style / 导出方式: (e.g., named exports preferred over default)
- Error handling / 错误处理: (e.g., typed errors, Result types, try/catch boundaries)
- Logging / 日志: (e.g., structured JSON, specific logger instance)

## Testing Strategy / 测试策略

| Level / 层级 | What It Covers / 覆盖内容 | Where It Lives / 文件位置 | Run Command / 运行命令 |
|-------------|--------------------------|--------------------------|----------------------|
| Unit / 单元测试 | Pure functions, domain logic, utilities | `tests/unit/` or co-located | |
| Integration / 集成测试 | Adapters, DB, external APIs | `tests/integration/` | |
| E2E / API | Full user flows or route contracts | `tests/e2e/` | |

## Dependency Rules / 依赖规则
<!--
EN: Dependencies flow inward: presentation → domain → infrastructure boundary.
    Domain logic must not import from infrastructure or UI.
    Shared code lives in a dedicated shared module, not in `utils` catch-all.

中文：依赖方向由外到内：展示层 → 领域层 → 基础设施边界。
    领域逻辑不得从基础设施或 UI 导入。
    共享代码放在专用的共享模块中，而不是堆在 `utils` 里。
-->

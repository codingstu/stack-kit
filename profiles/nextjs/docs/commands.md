# Commands — Next.js Profile

## Scaffold
```bash
npx create-next-app@latest <project-name>
```
Recommended answers:
- TypeScript: **yes**
- ESLint: **yes**
- App Router: **yes**
- `src/` directory: team choice, keep consistent
- Tailwind: **optional** (add as needed, not by default)

## Expected package.json Scripts
```json
{
  "dev": "next dev",
  "build": "next build",
  "start": "next start",
  "lint": "eslint .",
  "lint:fix": "eslint . --fix",
  "typecheck": "tsc --noEmit",
  "test": "vitest run",
  "test:watch": "vitest",
  "test:coverage": "vitest run --coverage"
}
```

## Bootstrap
```bash
npm install
```

## Dev
```bash
npm run dev
```

## Lint
```bash
npm run lint
```

## Typecheck
```bash
npm run typecheck
```

## Test
```bash
npm run test
```

## Build
```bash
npm run build
```

## Quality Gate (run all before commit)
```bash
npm run lint && npm run typecheck && npm run test && npm run build
```

## Notes
- `next build` in Next.js 16+ does **not** automatically run the linter — always run `lint` separately.
- Add `vitest` and `@testing-library/react` as dev dependencies for testing.
- For E2E, install `@playwright/test` and add a `test:e2e` script.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 命令参考 — Next.js Profile

### 脚手架
```bash
npx create-next-app@latest <project-name>
```
推荐选项：TypeScript **yes**，ESLint **yes**，App Router **yes**

### 引导安装
```bash
npm install
```

### 开发
```bash
npm run dev
```

### Lint
```bash
npm run lint
```

### 类型检查
```bash
npm run typecheck
```

### 测试
```bash
npm run test
```

### 构建
```bash
npm run build
```

### 质量门控（提交前运行全部）
```bash
npm run lint && npm run typecheck && npm run test && npm run build
```

</details>

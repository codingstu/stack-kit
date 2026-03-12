# Commands — Vue Profile

## Scaffold
```bash
npm create vue@latest
```
Recommended answers:
- TypeScript: **yes**
- Vue Router: **yes** for multi-page SPA, **no** for single-page widget
- Pinia: **only if** shared state is needed early
- ESLint: **yes**
- Vitest: **yes**
- Prettier: team choice, keep consistent

## Expected package.json Scripts
```json
{
  "dev": "vite",
  "build": "vue-tsc -b && vite build",
  "preview": "vite preview",
  "lint": "eslint .",
  "lint:fix": "eslint . --fix",
  "typecheck": "vue-tsc --noEmit",
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

## Preview (production build locally)
```bash
npm run preview
```

## Quality Gate (run all before commit)
```bash
npm run lint && npm run typecheck && npm run test && npm run build
```

## Notes
- `create-vue` generates Vite config, ESLint config, and optional Router/Pinia setup.
- Add `@vue/test-utils` as dev dependency for component testing.
- For E2E, install `@playwright/test` or `cypress` and add a `test:e2e` script.


---

<details>
<summary>🌐 中文翻译 / Chinese Translation</summary>

## 命令参考 — Vue Profile

### 脚手架
```bash
npm create vue@latest
```
推荐选项：TypeScript **yes**，ESLint **yes**，Vitest **yes**

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

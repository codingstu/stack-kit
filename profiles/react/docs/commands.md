# Commands — React Profile

## Scaffold
```bash
npm create vite@latest <project-name> -- --template react-ts
```

## Expected package.json Scripts
```json
{
  "dev": "vite",
  "build": "tsc -b && vite build",
  "preview": "vite preview",
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

## Preview (production build locally)
```bash
npm run preview
```

## Quality Gate (run all before commit)
```bash
npm run lint && npm run typecheck && npm run test && npm run build
```

## Notes
- Add `vitest`, `@testing-library/react`, and `@testing-library/jest-dom` as dev dependencies.
- Add `eslint`, `@eslint/js`, and `typescript-eslint` for linting.
- For E2E, install `@playwright/test` and add a `test:e2e` script.

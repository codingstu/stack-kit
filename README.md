# AI Project Stack Kit

一套尽量不重复的开发规范模板：
- `base/` 放跨栈共用的 `AGENTS.md`、通用 prompts、通用 rules。
- `profiles/` 放各技术栈的薄覆盖层，只覆盖 `docs/` 和少量路径规则。
- `scripts/install.sh` 可以把 `base + profile` 一次性拷进新仓库。

支持的 profile：
- `nextjs`
- `fastapi`
- `react`
- `vue`
- `python`

## 安装

在解压目录下执行：

```bash
bash scripts/install.sh /path/to/repo <profile>
```

例如：

```bash
bash scripts/install.sh ~/code/my-app nextjs
bash scripts/install.sh ~/code/my-api fastapi
bash scripts/install.sh ~/code/my-lib python
```

安装后建议先做三件事：
1. 填 `docs/spec.md`
2. 改 `docs/commands.md` 里的占位命令
3. 把 `AGENTS.md` 里与仓库不符的占位内容替换掉

## 目录说明

```text
base/
  AGENTS.md
  CLAUDE.md
  .cursor/rules/00-core.mdc
  .github/copilot-instructions.md
  .github/prompts/*.prompt.md
  docs/*.md
profiles/
  nextjs/
  fastapi/
  react/
  vue/
  python/
scripts/
  install.sh
```


## Copilot 指令速查卡

- 见 [`docs/copilot-cheatsheet.md`](docs/copilot-cheatsheet.md)

## 设计原则

- 只有一个事实源：`docs/`
- `AGENTS.md` 只负责导航，不重复讲一遍文档内容
- tool adapter 只写它独有的那一点指令
- 只保留 3 个高频 prompt：plan / implement / review
- Skills 只记录为候选流程，不预装一堆用不到的东西

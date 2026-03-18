#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────
# stack-kit installer
# Copies base + profile into a target repository.
# ─────────────────────────────────────────────────

VERSION="1.0.0"
PROFILES="nextjs fastapi react vue python"

# ── Helpers ──────────────────────────────────────

usage() {
  cat <<EOF
stack-kit installer v${VERSION}

Usage:
  bash scripts/install.sh <target-dir> <profile> [options]

Profiles:
  ${PROFILES}

Options:
  --dry-run     Show what would be copied without writing files
  --force       Overwrite existing files without prompting
  --no-backup   Skip backup of existing files
  --lean        Skip optional reference docs to reduce install size
  --help        Show this help message

Examples:
  bash scripts/install.sh ~/code/my-app nextjs
  bash scripts/install.sh ~/code/my-api fastapi
  bash scripts/install.sh ~/code/my-app nextjs --dry-run
  bash scripts/install.sh ~/code/my-app nextjs --lean
EOF
  exit 0
}

info()  { printf "\033[0;34m[info]\033[0m  %s\n" "$1"; }
ok()    { printf "\033[0;32m[ok]\033[0m    %s\n" "$1"; }
warn()  { printf "\033[0;33m[warn]\033[0m  %s\n" "$1"; }
error() { printf "\033[0;31m[error]\033[0m %s\n" "$1" >&2; exit 1; }

# ── Parse Arguments ──────────────────────────────

DRY_RUN=false
FORCE=false
NO_BACKUP=false
LEAN=false
TARGET=""
PROFILE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)   DRY_RUN=true; shift ;;
    --force)     FORCE=true; shift ;;
    --no-backup) NO_BACKUP=true; shift ;;
    --lean)      LEAN=true; shift ;;
    --help|-h)   usage ;;
    -*)          error "Unknown option: $1. Use --help for usage." ;;
    *)
      if [[ -z "$TARGET" ]]; then
        TARGET="$1"
      elif [[ -z "$PROFILE" ]]; then
        PROFILE="$1"
      else
        error "Unexpected argument: $1. Use --help for usage."
      fi
      shift
      ;;
  esac
done

[[ -z "$TARGET" ]]  && error "Missing target directory. Use --help for usage."
[[ -z "$PROFILE" ]] && error "Missing profile name. Use --help for usage."

# ── Resolve Paths ────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
KIT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BASE_DIR="$KIT_ROOT/base"
PROFILE_DIR="$KIT_ROOT/profiles/$PROFILE"

# Create target if it doesn't exist
if [[ ! -d "$TARGET" ]]; then
  if $DRY_RUN; then
    info "Would create target directory: $TARGET"
    # Resolve to absolute path even if it doesn't exist yet
    TARGET="$(cd "$(dirname "$TARGET")" 2>/dev/null && pwd)/$(basename "$TARGET")"
  else
    mkdir -p "$TARGET"
    info "Created target directory: $TARGET"
    TARGET="$(cd "$TARGET" && pwd)"
  fi
else
  TARGET="$(cd "$TARGET" && pwd)"
fi

# Validate
[[ ! -d "$BASE_DIR" ]]    && error "Base directory not found: $BASE_DIR"
[[ ! -d "$PROFILE_DIR" ]] && error "Unknown profile: $PROFILE. Available: ${PROFILES}"

# ── Copy Function ────────────────────────────────

copy_file() {
  local src="$1"
  local dst="$2"
  local rel="$3"

  if $DRY_RUN; then
    if [[ -f "$dst" ]]; then
      info "[dry-run] Would overwrite: $rel"
    else
      info "[dry-run] Would create:    $rel"
    fi
    return
  fi

  # Backup existing file
  if [[ -f "$dst" ]] && ! $NO_BACKUP && ! $FORCE; then
    local backup="${dst}.bak"
    cp "$dst" "$backup"
    warn "Backed up existing file: ${rel} → ${rel}.bak"
  fi

  local dir
  dir="$(dirname "$dst")"
  [[ ! -d "$dir" ]] && mkdir -p "$dir"
  cp "$src" "$dst"
}

copy_dir() {
  local src="$1"
  local dst="$2"
  local label="$3"
  local count=0

  while IFS= read -r -d '' file; do
    local rel="${file#"$src/"}"
    if should_skip_file "$rel"; then
      if $DRY_RUN; then
        info "[dry-run] Would skip optional file: $rel"
      else
        info "Skipped optional file: $rel"
      fi
      continue
    fi

    copy_file "$file" "$dst/$rel" "$rel"
    count=$((count + 1))
  done < <(find "$src" -type f -print0)

  if $DRY_RUN; then
    info "[dry-run] ${label}: ${count} files"
  else
    ok "${label}: ${count} files copied"
  fi
}

OPTIONAL_FILES=(
  "docs/skill-candidates.md"
  "docs/copilot-cheatsheet.md"
)

should_skip_file() {
  local rel="$1"

  if ! $LEAN; then
    return 1
  fi

  for optional in "${OPTIONAL_FILES[@]}"; do
    if [[ "$rel" == "$optional" ]]; then
      return 0
    fi
  done

  return 1
}

# ── Execute ──────────────────────────────────────

echo ""
info "stack-kit v${VERSION}"
info "Target:  $TARGET"
info "Profile: $PROFILE"
if $LEAN; then
  info "Mode:    lean (skip optional reference docs)"
fi
echo ""

# Step 1: Copy base
copy_dir "$BASE_DIR" "$TARGET" "base"

# Step 2: Copy profile (overwrites base where profile has opinions)
copy_dir "$PROFILE_DIR" "$TARGET" "profile/$PROFILE"

# ── Summary ──────────────────────────────────────

echo ""
if $DRY_RUN; then
  ok "Dry run complete. No files were written."
else
  ok "Installed base + ${PROFILE} into ${TARGET}"
  echo ""
  info "Next steps:"
  info "  1. Fill docs/spec.md with your project's problem, users, and flows."
  info "  2. Review docs/commands.md and adjust for your setup."
  info "  3. Review docs/architecture.md and customize the module layout."
  info "  4. Replace placeholder content in AGENTS.md if needed."
  info "  5. Start planning: read docs/plan.md and add your first milestone."
  if $LEAN; then
    info "  6. Optional reference docs were skipped. Re-run without --lean if you want docs/skill-candidates.md and docs/copilot-cheatsheet.md."
  fi
fi
echo ""

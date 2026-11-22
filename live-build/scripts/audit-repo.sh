#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
LB_DIR="$ROOT_DIR/live-build"

echo "=== [1/4] Verificando estrutura obrigatória do live-build ==="
REQUIRED_FILES=(
  "$LB_DIR/auto/config"
  "$LB_DIR/auto/build"
  "$LB_DIR/auto/clean"
)

for file in "${REQUIRED_FILES[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "ERRO: Arquivo obrigatório ausente: $file"
    exit 1
  fi
done

echo "=== [2/4] Corrigindo permissões de scripts e hooks ==="
find "$LB_DIR/auto" -type f -exec chmod +x {} +
if [[ -d "$LB_DIR/config/hooks" ]]; then
  find "$LB_DIR/config/hooks" -type f \( -name "*.hook.*" -o -name "*.sh" \) -exec chmod +x {} +
fi
if [[ -d "$LB_DIR/config/includes.chroot/usr/local/bin" ]]; then
  find "$LB_DIR/config/includes.chroot/usr/local/bin" -type f -exec chmod +x {} +
fi

echo "=== [3/4] Validando sintaxe Shell (bash -n) ==="
while IFS= read -r -d '' script; do
  if head -n 1 "$script" | grep -qE '^#!.*(ba)?sh'; then
    bash -n "$script"
  fi
done < <(find "$LB_DIR" -type f -print0)

echo "=== [4/4] Verificando configuração Debian 13 (trixie) ==="
if ! grep -q "trixie" "$LB_DIR/auto/config"; then
  echo "AVISO: 'trixie' não encontrado explicitamente em live-build/auto/config"
fi

if ! grep -q "non-free-firmware" "$LB_DIR/auto/config"; then
  echo "AVISO: 'non-free-firmware' não encontrado em live-build/auto/config (necessário para Wi-Fi/microcode no Debian 13)"
fi

echo "Auditoria concluída com sucesso!"

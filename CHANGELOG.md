# Changelog — EonLux Legacy

Todas as alterações relevantes do projeto são documentadas neste arquivo e detalhadas em `docs/releases/`.

## [v0.1-alpha] - 2026-11-22
### Adicionado
- Base inicial do `live-build` sobre Debian 13 (`trixie`) com XFCE e locale `pt_BR.UTF-8`.
- ZRAM dinâmico (75% da RAM física, `lz4`, prioridade `100`), suporte a `/swapfile` de 4 GB (prioridade `10`), `earlyoom` e ajustes iniciais em `sysctl`.
- Pacotes de drivers e firmwares (incluindo Wi-Fi com `broadcom-sta-dkms`, Bluetooth, PipeWire, vídeo Xorg, energia e sensores) e configuração `libinput` para touchpad.
- Desativação e mascaramento de serviços e timers pesados ou desnecessários (`tracker-miner-fs-3`, `cups`, `cups-browsed`, `avahi-daemon`, `ModemManager`, `apt-daily.timer`, `apt-daily-upgrade.timer`).
- Nota técnica inicial em `docs/releases/v0.1-alpha.md`.

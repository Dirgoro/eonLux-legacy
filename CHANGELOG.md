# Changelog

Todas as alterações notáveis no projeto **EonLux Legacy** serão documentadas neste arquivo.

O formato segue as diretrizes de [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/) e este projeto adota o versionamento semântico adaptado a marcos de desenvolvimento (`v0.1-alpha` até `v1.0-stable`).

---

## [Não Lançado]

### Planejado
* **`v0.2-alpha` (Identidade Visual & UX):** Aplicação da paleta oficial (`#020B18`, `#061830`, `#29C5FF`, `#0066CC`, `#084C7F`), wallpaper `eonlux-wallpaper-1.jpg`, compositor `xfwm4` (XRender) com transparência alfa, barra superior fixa estilo macOS, 3 ilhas inferiores com ocultação inteligente (`30px`), Thunar estilo Windows 11, nuvem via `rclone` + `fuse3` e compactador `xarchiver`.
* **`v0.3-beta` (Ciclo de Boot, Instalador & Boas-Vindas):** GRUB tematizado em PT-BR, Plymouth Loading dinâmico (11 bolinhas + progresso por etapas) e Plymouth Shutdown (`0%` a `100%`), LightDM unificado, Calamares com criptografia LUKS opcional, `/swapfile` de 4 GB, `packagechooser` e Tela de Boas-Vindas com tour guiado.
* **`v0.4-beta` (Ecossistema Exclusivo):** Central de Configurações do Desktop, EonLux Care Center, EonLux Safe Guard, EonLux Shell, EonLux Shell Web (`WebKit2GTK` com contenção de cache), Launchpad e Eonlux Store (`APT` + `Flatpak` + Buscador de Programas do Windows).
* **`v1.0-stable` (Segurança & Release Final):** Hardening completo (`ufw` + `nftables`, `AppArmor`, `sysctl`, `noexec` em USB, `uBlock Origin` offline no Firefox, `clamscan` sob demanda) e validação final em hardware legado.

---

## [0.1.0-alpha] - Em Desenvolvimento (`v0.1-alpha`)

> Nota técnica detalhada disponível em [`docs/releases/v0.1-alpha.md`](docs/releases/v0.1-alpha.md).

### Adicionado
* Estrutura inicial de construção de ISO híbrida (`BIOS Legacy + UEFI`, `amd64`) via `live-build` baseada no **Debian 13 (*Trixie*) XFCE** em **Português do Brasil (`pt_BR.UTF-8`)**.
* Configuração de **ZRAM dinâmico** em **75% da RAM física** com compressão `lz4` e prioridade `100`.
* Daemon **`earlyoom`** ativo para prevenção de congelamentos em equipamentos com baixa memória RAM (referência: Acer Aspire One D260 com 2 GB de RAM).
* Pacote completo de firmwares e drivers (`firmware-linux`, `firmware-linux-nonfree`, `intel-microcode`, `amd64-microcode`, `broadcom-sta-dkms`, `bluez`, `blueman`, `pipewire`, `wireplumber`, `pipewire-pulse`, `firmware-sof-signed`).
* Configuração padrão de touchpad via `libinput` com *tap-to-click* e gestos ativados.
* Documentação inicial do repositório (`README.md`, `.gitignore`, `LICENSE` GPL v3.0 e `docs/releases/v0.1-alpha.md`).

### Otimizado
* Parâmetros `sysctl` ajustados para sistemas com swap comprimido (`vm.swappiness=120`, `vm.page-cluster=0`, `vm.vfs_cache_pressure=60`).
* Desativação e mascaramento de serviços pesados ou ociosos em segundo plano (`tracker-miner-fs-3`, `cups.service`, `cups-browsed.service`, `avahi-daemon`, `ModemManager.service`, `apt-daily.timer`, `apt-daily-upgrade.timer`).

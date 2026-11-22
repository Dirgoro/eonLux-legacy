# EonLux Legacy

> **Seu equipamento ganhando nova vida.**  
> Distribuição Linux personalizada baseada no **Debian 13 (Trixie) XFCE**, projetada para entregar desempenho máximo, baixo consumo de memória, segurança reforçada e familiaridade visual para computadores legados e usuários migrando do Windows.

[![Base System](https://img.shields.io/badge/Base-Debian%2013%20(Trixie)-A81D33?style=flat-square&logo=debian&logoColor=white)](https://www.debian.org/)
[![Desktop](https://img.shields.io/badge/Desktop-XFCE%204-2284F2?style=flat-square&logo=xfce&logoColor=white)](https://xfce.org/)
[![Architecture](https://img.shields.io/badge/Arquitetura-amd64%20(Legacy%20%2B%20UEFI)-0066CC?style=flat-square)]()
[![License](https://img.shields.io/badge/Licen%C3%A7a-GNU%20GPL%20v3.0-29C5FF?style=flat-square)](LICENSE)

---

## Sobre o Projeto

O **EonLux Legacy** nasce com o propósito de resgatar notebooks e desktops antigos — mantendo como piso de referência equipamentos modestos como o **Acer Aspire One D260** (Intel Atom N450, 2 GB de RAM, SSD de 120 GB) — sem abrir mão de uma interface moderna, intuitiva e segura, escalando com fluidez para máquinas Intel e AMD de 64 bits mais recentes.

Todo o sistema é construído via `live-build` diretamente sobre a base estável do **Debian 13 (*Trixie*)**, totalmente localizado em **Português do Brasil (PT-BR)** e livre de serviços pesados em segundo plano.

---

## Principais Pilares e Recursos

### Desempenho e Engenharia de Memória
* **ZRAM Dinâmico:** Compressão `lz4` configurada para **75% da RAM física** (prioridade `100`), multiplicando a capacidade útil em máquinas com 2 GB de RAM.
* **Swapfile Inteligente:** Arquivo `/swapfile` de **4 GB** (prioridade `10`) criado na instalação em disco como reserva segura para cargas intensas.
* **Proteção contra Travamentos:** `earlyoom` ativo e parâmetros `sysctl` ajustados (`vm.swappiness=120`, `vm.page-cluster=0`, `vm.vfs_cache_pressure=60`).
* **Zero Peso em Segundo Plano:** Serviços ociosos ou pesados desativados/mascarados por padrão (`tracker-miner-fs-3`, `cups`, `avahi-daemon`, `ModemManager`, `apt-daily*`).
* **Compositor Fluido:** `xfwm4` operando com backend **XRender** e transparência alfa pura (`rgba`), preservando a fluidez mesmo em GPUs integradas antigas (como a Intel GMA 3150).

### Interface Familiar e Identidade Visual
* **Paleta Oficial EonLux:** Base escura translúcida (`#020B18` / `#061830`) combinada com três tons harmônicos de azul (`#29C5FF`, `#0066CC` e `#084C7F`) e tipografia **Inter / Noto Sans**.
* **Layout Híbrido Moderno:**
  * Barra superior translúcida fixa estilo macOS;
  * Janelas maximizadas ocupando 100% da área útil abaixo do topo, com 3 botões circulares à direita (**Fechar → Maximizar → Minimizar**);
  * Área inferior com ocultação inteligente dividida em **3 ilhas** (Menu de Apps Exclusivos à esquerda, Dock central de apps essenciais e Relógio/Data PT-BR + **Launchpad** à direita).
* **Gerenciador de Arquivos e Nuvem:** **Thunar** estilizado com visual amigável estilo **Windows 11**, compactador nativo integrado (`xarchiver` + `thunar-archive-plugin` com suporte a `zip`, `7z`, `rar`, `tar`, `gz`, `xz`) e integração sob demanda com **Google Drive** e **OneDrive** via `rclone` + `fuse3`.
* **Ciclo Completo de Experiência:** Bootloader **GRUB** tematizado em PT-BR, **Plymouth Loading** com mensagens dinâmicas por percentual de carregamento, instalador gráfico **Calamares** (com seleção opcional de pacotes e criptografia LUKS), **Tela de Boas-Vindas com Tour Guiado** no primeiro login e **Plymouth Shutdown** com progresso até o corte total de energia.

### Ecossistema de Aplicações Exclusivas
1. **Central de Configurações do Desktop:** Papel de parede, escala, resolução, temas, fontes, painel/dock, **Contas na Nuvem** e informações do sistema.
2. **EonLux Care Center:** Monitoramento em tempo real de temperaturas, RAM física, ZRAM, Swap, CPU e saúde do disco.
3. **EonLux Safe Guard:** Painel unificado de saúde preventiva e segurança (controle de 1 clique do firewall, status do AppArmor, atualizações de segurança e varredura sob demanda).
4. **EonLux Shell:** Terminal nativo leve com tipografia Inter/Noto Sans.
5. **EonLux Shell Web:** Terminal e navegador leve integrados na mesma janela (`WebKit2GTK` com contenção de cache em RAM).
6. **Launchpad:** Lançador visual com pastas personalizáveis, busca instantânea, ordenação A–Z, mais usados, instalados recentemente e categorias.
7. **Eonlux Store:** Loja de aplicativos nativa em PT-BR com suporte a **APT** e **Flatpak** sob demanda, equipada com o **Buscador de Programas do Windows** — que entrega versões oficiais para Linux quando disponíveis ou sugere alternativas nativas com o mesmo foco de uso e selo de leveza para hardware legado.

### Segurança Reforçada (Sem Impacto em RAM)
* **Firewall Ativo:** `ufw` + `nftables` bloqueando conexões de entrada por padrão (`deny incoming`, `allow outgoing`), com **0 MB** de consumo residente.
* **Confinamento e Kernel Hardening:** `AppArmor` ativo por padrão e proteções `sysctl` contra *SYN flood*, *IP spoofing*, redirecionamentos ICMP e exposição de logs/ponteiros do kernel.
* **Navegação Protegida:** **Firefox** oficial do Debian 13 com **uBlock Origin** empacotado offline e aplicado via políticas corporativas (`policies.json`).
* **Proteção Física e Mídias:** Montagem automática de pendrives com flag `noexec`, bloqueio automático de tela ao suspender/fechar a tampa e suporte a criptografia de disco **LUKS** no instalador.

---

## Requisitos de Sistema

| Componente | Mínimo (Piso de Referência) | Recomendado |
| :--- | :--- | :--- |
| **Processador** | Intel Atom N450 / AMD 64 bits (1 núcleo, 1.66 GHz) | Dual-Core 64 bits (Intel Core / AMD) ou superior |
| **Memória RAM** | 2 GB (com ZRAM 75% ativo) | 4 GB ou superior |
| **Armazenamento** | 16 GB livres (SSD recomendado) | 32 GB ou superior (inclui `/swapfile` de 4 GB) |
| **Vídeo** | Intel GMA 3150 / VGA compatível (`1024×600`) | GPU Intel, AMD ou NVIDIA com suporte Xorg (`1366×768`+) |
| **Inicialização** | BIOS Legacy ou UEFI (`amd64`) | BIOS Legacy ou UEFI (`amd64`) |

---

## Cronograma de Desenvolvimento e Pré-Versões

Acompanhe a evolução do projeto através das pré-versões publicadas na aba [**Releases**](https://github.com/Dirgoro/eonLux-legacy/releases), onde cada marco acompanha sua respectiva nota técnica em Markdown (`docs/releases/`):

| Versão | Status | Foco do Marco | Notas Técnicas |
| :--- | :---: | :--- | :--- |
| **`v0.1-alpha`** | Planejado | Base Debian 13 XFCE PT-BR, ZRAM 75%, `earlyoom`, drivers completos e otimização de serviços | `docs/releases/v0.1-alpha.md` |
| **`v0.2-alpha`** | Planejado | Identidade visual, barra topo macOS, 3 ilhas inferiores, Thunar estilo Windows 11, nuvem (`rclone`) e `xarchiver` | `docs/releases/v0.2-alpha.md` |
| **`v0.3-beta`** | Planejado | GRUB tematizado, Plymouth Loading dinâmico & Shutdown, LightDM, Calamares (`packagechooser` + Swap 4 GB) e Tour | `docs/releases/v0.3-beta.md` |
| **`v0.4-beta`** | Planejado | Apps exclusivos: Central de Configurações, Care Center, Safe Guard, Shell, Shell Web, Launchpad e Eonlux Store | `docs/releases/v0.4-beta.md` |
| **`v1.0-stable`** | Planejado | Auditoria final de segurança (UFW, AppArmor, `noexec`, uBlock offline, `clamscan`), validação em hardware e ISO final | `docs/releases/v1.0-stable.md` |

---

## Estrutura do Repositório

```text
eonLux-legacy/
├── docs/
│   └── releases/              # Notas técnicas detalhadas (.md) de cada pré-versão e release
├── live-build/
│   ├── auto/                  # Scripts de automação do live-build (config, build, clean)
│   └── config/
│       ├── archives/          # Repositórios Debian 13 (Trixie)
│       ├── hooks/             # Scripts executados no chroot e na montagem da ISO
│       ├── includes.chroot/   # Arquivos do sistema (/etc, /usr/share, temas, apps exclusivos)
│       └── package-lists/     # Listas de pacotes (base, drivers, segurança, desktop, Calamares)
├── CHANGELOG.md               # Histórico consolidado de alterações entre versões
├── LICENSE                    # Licença GNU General Public License v3.0
└── README.md                  # Documentação principal do projeto

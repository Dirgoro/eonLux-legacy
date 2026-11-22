# EonLux Legacy

**Seu equipamento ganhando nova vida.**

Distribuição Linux personalizada baseada no **Debian 13 (Trixie) XFCE**, leve, segura e amigável, otimizada para hardware legado e transição do Windows[cite: 1].

## Hardware de Referência e Base

- **Base:** Debian 13 (`trixie`) com XFCE, idioma padrão `pt_BR.UTF-8` e imagem híbrida `amd64` (BIOS Legacy e UEFI).
- **Hardware de Referência:** Acer Aspire One D260 (Intel Atom N450, Intel GMA 3150, 2 GB de RAM, SSD de 120 GB, tela 1024×600), escalando para outros sistemas Intel e AMD de 64 bits[cite: 1].
- **Memória e Desempenho:** ZRAM dinâmico em 75% da RAM física com compressão `lz4` (prioridade 100), `/swapfile` de 4 GB (prioridade 10), `earlyoom` e ajustes de `sysctl`[cite: 2].

## Identidade Visual e Área de Trabalho

- **Paleta Oficial:** Base escura translúcida (`#020B18` / `#061830`), três tons de azul (`#29C5FF`, `#0066CC` e `#084C7F`), texto em `#E6F4FF` / `#8AB4D8` e tipografia **Inter / Noto Sans**[cite: 1, 2].
- **Barra Superior:** Translúcida e fixa no topo[cite: 1].
- **Área Inferior:** Ocultação inteligente ao encostar o cursor na borda inferior, dividida em **3 ilhas** com ícones de `30px` e sem widget de clima[cite: 1].
- **Janelas:** Compositor `xfwm4` (XRender) com transparência `rgba` leve e 3 botões circulares à direita na ordem **Fechar → Maximizar → Minimizar**[cite: 1, 2].
- **Gerenciador de Arquivos:** **Thunar** estilizado com inspiração no Windows 11, compactação/extração via `xarchiver` + `thunar-archive-plugin` (`zip`, `7z`, `rar`, `tar`, `gz`, `xz`) e integração sob demanda com **Google Drive** e **OneDrive** via `rclone` + `fuse3` (`--vfs-cache-mode minimal`)[cite: 1, 2].

## Aplicações Exclusivas

1. **Central de Configurações do Desktop:** Papel de parede, escala, resolução, temas, fontes, painel/dock, **Contas na Nuvem** e **Sobre o EonLux Legacy**[cite: 1].
2. **EonLux Care Center:** Monitoramento de temperaturas, RAM física, ZRAM, Swap, CPU e disco[cite: 1].
3. **EonLux Safe Guard:** Controle de 1 clique do firewall (`ufw` + `nftables`), status do `apparmor`, verificação sob demanda de atualizações de segurança do Debian 13 e varredura `clamscan` sem daemon residente[cite: 1, 2].
4. **EonLux Shell:** Terminal nativo leve com tipografia Inter / Noto Sans[cite: 1].
5. **EonLux Shell Web:** Terminal e navegador leve integrados na mesma janela (`WebKit2GTK` com `WEBKIT_CACHE_MODEL_DOCUMENT_VIEWER`)[cite: 1].
6. **Launchpad:** Lançador com pastas personalizáveis, busca instantânea e ordenação (A–Z, mais usados, instalados recentemente e categorias)[cite: 1].
7. **Eonlux Store:** Loja nativa em PT-BR (`APT` + `Flatpak` sob demanda) com **Buscador de Programas do Windows**[cite: 1].

## Segurança e Licença

- Firewall `ufw` + `nftables` ativo por padrão (`deny incoming`, `allow outgoing`), `apparmor` ativo, hardening de `sysctl`, montagem de pendrives com `noexec`, `uBlock Origin` offline no Firefox via `policies.json`, suporte a LUKS no Calamares e bloqueio automático de tela via `light-locker` + `xfce4-power-manager`[cite: 1, 2].
- **Licença:** GNU General Public License v3.0 (`LICENSE`)[cite: 1].

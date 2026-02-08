
# Monitor de Estatísticas de Performance de Servidor 🚀

Um script em **Bash** para analisar estatísticas básicas de performance de servidores Linux.

🔗 Página do projeto: https://roadmap.sh/projects/server-stats

## ✨ Funcionalidades

O script fornece as seguintes informações:

- 🧠 **Uso de CPU**: Mostra a porcentagem total de uso da CPU.
- 💾 **Uso de Memória**: Exibe memória livre vs. utilizada, incluindo porcentagem.
- 💽 **Uso de Disco**: Mostra espaço livre vs. utilizado para cada filesystem.
- 🔝 **Processos Principais**: Lista os 5 principais processos por uso de CPU e memória.
- 📊 **Informações Adicionais**:
  - Versão do sistema operacional
  - Tempo de atividade do sistema (uptime)
  - Load average
  - Usuários logados
  - Tentativas recentes de login malsucedidas (se disponível)

## 🛠️ Requisitos

- Sistema operacional Linux
- Shell Bash
- Utilitários padrão do Linux (`ps`, `free`, `df`, etc.)
- Opcional: `mpstat` para maior precisão no uso de CPU (pacote `sysstat`)

## 📦 Instalação

1. Baixe o script:
```
wget https://raw.githubusercontent.com/LuanLucasTS/Server-Performance-Stats/main/server-stats.sh
```

2. Torne o script executável:
```
chmod +x server-stats.sh
```

## ▶️ Uso

Execute o script com:
```
./server-stats.sh
```

## 🧪 Exemplo de Saída

```
Server Performance Stats
------------------------
OS Version:
Linux localhost.localdomain 4.18.0-553.100.1.el8_10.x86_64 #1 SMP Mon Feb 2 04:13:33 EST 2026 x86_64 x86_64 x86_64 GNU/Linux

Uptime and Load Average:
 06:01:34 up 5 min,  2 users,  load average: 0,15, 0,58, 0,32

Logged in Users:
root     tty1         2026-02-08 05:56
root     pts/0        2026-02-08 05:58 (192.168.1.20)

Recent Failed Login Attempts:

Total CPU Usage:
./server-stats.sh: linha 37: bc: comando não encontrado
CPU Usage: %

Total Memory Usage:
./server-stats.sh: linha 47: bc: comando não encontrado
Total: 3665MB
Used: 221MB (%)
Free: 2799MB

Total Disk Usage:
Total: 26087MB
Used: 3687MB (15%)
Free: 22400MB

Top 5 Processes by CPU Usage:
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         829  4.1  0.5 530888 21896 ?        Ssl  05:56   0:12 /usr/bin/python3.6 -s /usr/bin/fail2ban-server -xf start
root           1  3.8  0.3 175560 13624 ?        Ss   05:55   0:13 /usr/lib/systemd/systemd --switched-root --system --deserialize 18
root           9  3.8  0.0      0     0 ?        I    05:55   0:13 [kworker/u8:0-events_unbound]
root          13  3.0  0.0      0     0 ?        S    05:55   0:10 [ksoftirqd/0]
root         259  1.2  0.0      0     0 ?        I    05:55   0:04 [kworker/0:3-events]

Top 5 Processes by Memory Usage:
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         795  0.1  1.4 516252 52616 ?        Ssl  05:56   0:00 /usr/libexec/platform-python -s /usr/sbin/firewalld --nofork --nopid
root         820  1.1  0.8 620184 31104 ?        Ssl  05:56   0:03 /usr/libexec/platform-python -Es /usr/sbin/tuned -l -P
polkitd     1054  0.0  0.7 1746224 26864 ?       Ssl  05:56   0:00 /usr/lib/polkit-1/polkitd --no-debug
root         829  4.1  0.5 530888 21896 ?        Ssl  05:56   0:12 /usr/bin/python3.6 -s /usr/bin/fail2ban-server -xf start
root         807  0.3  0.5 591292 19616 ?        Ssl  05:56   0:01 /usr/sbin/NetworkManager --no-daemon
Oct 21 03:25:18 myserver sshd[12346]: Failed password for invalid user admin from 192.168.1.100 port 58425 ssh2
```


## 🪟 Observações para Usuários Windows

Este script foi desenvolvido para sistemas Linux. Se você estiver usando Windows, pode:

1. Executar em uma máquina virtual Linux
2. Utilizar o Windows Subsystem for Linux (WSL)
3. Usar Git Bash ou ambiente Unix-like semelhante

## 📄 Licença

Este projeto está licenciado sob a **Licença MIT**.  
Sinta-se à vontade para modificar e distribuir conforme necessário.

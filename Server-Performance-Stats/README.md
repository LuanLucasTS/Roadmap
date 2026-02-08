# Server Performance Statistics Monitor

A Bash script to analyze basic server performance stats on Linux servers.

Project Page: [roadmap.sh/projects/server-stats](https://roadmap.sh/projects/server-stats)

## Features

The script provides the following information:

- **CPU Usage**: Shows the total CPU usage percentage.
- **Memory Usage**: Displays free vs. used memory, including usage percentage.
- **Disk Usage**: Shows free vs. used disk space for each filesystem.
- **Top Processes**: Lists the top 5 processes by CPU and memory usage.
- **Additional Information**: 
  - OS version
  - System uptime
  - Load average
  - Logged in users
  - Recent failed login attempts (if available)

## Requirements

- Linux operating system
- Bash shell
- Standard Linux utilities (`ps`, `free`, `df`, etc.)
- Optional: `mpstat` for more accurate CPU usage (part of the `sysstat` package)

## Installation

1. Download the script:
   ```
   wget https://raw.githubusercontent.com/LuanLucasTS/Server-Performance-Stats/main/server-stats.sh
   ```
   
2. Make the script executable:
   ```
   chmod +x server-stats.sh
   ```

## Usage

Run the script with:

```
./server-stats.sh
```

## Sample Output

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

## Notes for Windows Users

This script is designed for Linux systems. If you're using Windows, you can:

1. Use the script on a Linux virtual machine
2. Use Windows Subsystem for Linux (WSL)
3. Use Git Bash or similar Unix-like environment for Windows

## License

This script is provided under the MIT License. Feel free to modify and distribute as needed. 

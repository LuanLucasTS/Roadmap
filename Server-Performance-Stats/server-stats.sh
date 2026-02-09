#!/bin/bash

echo "📊 Estatísticas do Servidor"
echo "=========================="

# Sistema
echo "🖥️ Sistema:"
echo "Hostname: $(hostname)"
echo "SO: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo "Kernel: $(uname -r)"
echo "Arquitetura: $(uname -m)"
echo "Data/Hora: $(date)"
echo ""

# Virtualização
echo "🔍 Virtualização:"
virt=$(systemd-detect-virt 2>/dev/null)
[ -z "$virt" ] && virt="Não detectado"
echo "Tipo: $virt"
echo ""

# Uptime e Load
echo "⏱️ Uptime e Load:"
uptime -p
cat /proc/loadavg | awk '{print "Load (1/5/15):", $1, $2, $3}'
echo ""

# CPU
echo "🧠 CPU:"
lscpu | grep -E "Model name|CPU\(s\)|Core"
top -bn1 | grep "Cpu(s)"
echo ""

# Memória
echo "💾 Memória:"
free -h
echo ""

# Swap
echo "🔁 Swap:"
swapon --show || echo "Swap não configurada"
echo ""

# Disco
echo "📀 Uso de disco:"
df -h --output=source,size,used,avail,pcent,target | column -t
echo ""

echo "📦 Inodes:"
df -ih | column -t
echo ""

# Filesystems críticos
echo "⚠️ Partições acima de 80%:"
df -h | awk '$5+0 > 80 {print $0}'
echo ""

# IO básico
echo "📈 IO (iowait):"
top -bn1 | grep "Cpu(s)" | sed 's/,/\n/g' | grep wa
echo ""

# Rede
echo "🌐 Rede:"
ip -brief addr show
echo ""

echo "📡 Conexões TCP ativas:"
ss -tunap | wc -l
echo ""

# Processos
echo "🔥 Top 5 CPU:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo ""

echo "🐘 Top 5 Memória:"
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6
echo ""

# Segurança
echo "🔐 Últimos logins:"
last -n 5
echo ""

echo "🚪 Portas escutando:"
ss -tulnp | head -n 10
echo ""

echo "✅ Fim do relatório"

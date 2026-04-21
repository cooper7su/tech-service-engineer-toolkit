#!/usr/bin/env bash
set -u

section() {
  printf '\n===== %s =====\n' "$1"
}

have() {
  command -v "$1" >/dev/null 2>&1
}

run_cmd() {
  printf '$ %s\n' "$*"
  "$@" 2>&1 || printf '[warn] command failed: %s\n' "$*"
}

run_shell() {
  printf '$ %s\n' "$1"
  sh -c "$1" 2>&1 || printf '[warn] command failed: %s\n' "$1"
}

optional_cmd() {
  if have "$1"; then
    run_cmd "$@"
  else
    printf '[skip] %s not found\n' "$1"
  fi
}

section "Run Context"
printf 'Timestamp: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %Z' 2>/dev/null || date)"
printf 'User: %s\n' "$(id -un 2>/dev/null || printf 'unknown')"
printf 'Hostname: %s\n' "$(hostname 2>/dev/null || printf 'unknown')"
printf 'Kernel: %s\n' "$(uname -a 2>/dev/null || printf 'unknown')"

section "Operating System"
if [ -r /etc/os-release ]; then
  run_shell "cat /etc/os-release"
elif have sw_vers; then
  run_cmd sw_vers
else
  printf '[skip] /etc/os-release and sw_vers not available\n'
fi

section "Uptime and Load"
optional_cmd uptime

section "CPU"
if have lscpu; then
  run_cmd lscpu
elif [ -r /proc/cpuinfo ]; then
  run_shell "grep -m 5 -E 'model name|processor|cpu cores|siblings' /proc/cpuinfo"
elif have sysctl; then
  run_shell "sysctl -n machdep.cpu.brand_string 2>/dev/null || sysctl -a | grep -E 'hw.ncpu|hw.model' | head"
else
  printf '[skip] no CPU inventory command available\n'
fi

section "Memory"
if have free; then
  run_cmd free -h
elif have vm_stat; then
  run_cmd vm_stat
else
  printf '[skip] free/vm_stat not available\n'
fi

section "Disk"
optional_cmd df -h
if have lsblk; then
  run_cmd lsblk
else
  printf '[skip] lsblk not found\n'
fi

section "Network Interfaces"
if have ip; then
  run_cmd ip addr
elif have ifconfig; then
  run_cmd ifconfig
else
  printf '[skip] ip/ifconfig not available\n'
fi

section "Routes"
if have ip; then
  run_cmd ip route
elif have netstat; then
  run_cmd netstat -rn
else
  printf '[skip] ip/netstat not available\n'
fi

section "DNS Configuration"
if [ -r /etc/resolv.conf ]; then
  run_shell "cat /etc/resolv.conf"
else
  printf '[skip] /etc/resolv.conf not readable\n'
fi
if have resolvectl; then
  run_cmd resolvectl status
fi

section "Listening Ports"
if have ss; then
  run_cmd ss -tulpen
elif have netstat; then
  run_cmd netstat -an
else
  printf '[skip] ss/netstat not available\n'
fi

section "Recent System Logs"
if have journalctl; then
  run_cmd journalctl -n 80 --no-pager
elif have dmesg; then
  run_cmd dmesg
elif [ -r /var/log/system.log ]; then
  run_shell "tail -n 80 /var/log/system.log"
elif [ -r /var/log/syslog ]; then
  run_shell "tail -n 80 /var/log/syslog"
elif [ -r /var/log/messages ]; then
  run_shell "tail -n 80 /var/log/messages"
else
  printf '[skip] no readable system log source found\n'
fi

section "Completed"
printf 'Health snapshot completed. Review warnings and skipped commands before sharing.\n'

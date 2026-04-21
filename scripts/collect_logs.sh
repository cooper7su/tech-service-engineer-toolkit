#!/usr/bin/env bash
set -u

OUTPUT_BASE="."

usage() {
  cat <<'USAGE'
Usage: ./scripts/collect_logs.sh [-o output_directory]

Collect a lightweight host support bundle and write a .tar.gz archive.
Review and redact the archive before sharing it outside your organization.
USAGE
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -o|--output-dir)
      if [ "$#" -lt 2 ]; then
        printf '[error] %s requires a directory\n' "$1" >&2
        exit 2
      fi
      OUTPUT_BASE="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf '[error] unknown argument: %s\n' "$1" >&2
      usage
      exit 2
      ;;
  esac
done

have() {
  command -v "$1" >/dev/null 2>&1
}

safe_name() {
  printf '%s' "$1" | tr -c 'A-Za-z0-9_.-' '_'
}

HOST="$(hostname 2>/dev/null || printf 'unknown-host')"
STAMP="$(date '+%Y%m%d_%H%M%S' 2>/dev/null || date '+%s')"
BUNDLE_DIR="${OUTPUT_BASE}/support_bundle_$(safe_name "$HOST")_${STAMP}"
ARCHIVE="${BUNDLE_DIR}.tar.gz"

mkdir -p "$BUNDLE_DIR" || {
  printf '[error] cannot create output directory: %s\n' "$BUNDLE_DIR" >&2
  exit 1
}

collect_cmd() {
  file="$1"
  shift
  {
    printf '$ %s\n' "$*"
    "$@" 2>&1
    rc=$?
    printf '\n[exit_code] %s\n' "$rc"
  } > "${BUNDLE_DIR}/${file}" 2>&1
}

collect_shell() {
  file="$1"
  cmd="$2"
  {
    printf '$ %s\n' "$cmd"
    sh -c "$cmd" 2>&1
    rc=$?
    printf '\n[exit_code] %s\n' "$rc"
  } > "${BUNDLE_DIR}/${file}" 2>&1
}

collect_optional() {
  file="$1"
  shift
  if have "$1"; then
    collect_cmd "$file" "$@"
  else
    printf '[skip] %s not found\n' "$1" > "${BUNDLE_DIR}/${file}"
  fi
}

printf 'Collecting support bundle in %s\n' "$BUNDLE_DIR"

{
  printf 'Collected at: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %Z' 2>/dev/null || date)"
  printf 'Hostname: %s\n' "$HOST"
  printf 'User: %s\n' "$(id -un 2>/dev/null || printf 'unknown')"
  printf 'Kernel: %s\n' "$(uname -a 2>/dev/null || printf 'unknown')"
  printf '\nRedaction reminder: remove secrets, tokens, customer data, and private identifiers before sharing.\n'
} > "${BUNDLE_DIR}/README.txt"

collect_cmd "hostname.txt" hostname
collect_cmd "uname.txt" uname -a

if [ -r /etc/os-release ]; then
  collect_shell "os-release.txt" "cat /etc/os-release"
elif have sw_vers; then
  collect_cmd "os-release.txt" sw_vers
else
  printf '[skip] no OS release command available\n' > "${BUNDLE_DIR}/os-release.txt"
fi

collect_optional "uptime.txt" uptime
collect_optional "disk_df_h.txt" df -h
collect_optional "disk_df_i.txt" df -i
collect_optional "memory_free.txt" free -h
collect_shell "process_top_cpu.txt" "ps aux 2>/dev/null | sort -nrk 3 | head -n 25"
collect_shell "process_top_memory.txt" "ps aux 2>/dev/null | sort -nrk 4 | head -n 25"

if have ip; then
  collect_cmd "network_ip_addr.txt" ip addr
  collect_cmd "network_ip_route.txt" ip route
elif have ifconfig; then
  collect_cmd "network_ifconfig.txt" ifconfig
  collect_optional "network_routes.txt" netstat -rn
else
  printf '[skip] ip/ifconfig not available\n' > "${BUNDLE_DIR}/network_interfaces.txt"
fi

if [ -r /etc/resolv.conf ]; then
  collect_shell "dns_resolv_conf.txt" "cat /etc/resolv.conf"
else
  printf '[skip] /etc/resolv.conf not readable\n' > "${BUNDLE_DIR}/dns_resolv_conf.txt"
fi

if have ss; then
  collect_cmd "ports_listening.txt" ss -tulpen
elif have netstat; then
  collect_cmd "ports_netstat.txt" netstat -an
else
  printf '[skip] ss/netstat not available\n' > "${BUNDLE_DIR}/ports.txt"
fi

if have systemctl; then
  collect_cmd "services_failed.txt" systemctl list-units --type=service --state=failed --no-pager
else
  printf '[skip] systemctl not found\n' > "${BUNDLE_DIR}/services_failed.txt"
fi

if have journalctl; then
  collect_cmd "logs_journal_recent.txt" journalctl -n 300 --no-pager
elif have dmesg; then
  collect_cmd "logs_dmesg.txt" dmesg
else
  printf '[skip] journalctl/dmesg not available\n' > "${BUNDLE_DIR}/logs_kernel_or_journal.txt"
fi

for log_file in /var/log/syslog /var/log/messages /var/log/system.log; do
  if [ -r "$log_file" ]; then
    collect_shell "tail_$(safe_name "$log_file").txt" "tail -n 300 '$log_file'"
  fi
done

if tar -czf "$ARCHIVE" -C "$OUTPUT_BASE" "$(basename "$BUNDLE_DIR")" 2>"${BUNDLE_DIR}/tar_error.txt"; then
  printf 'Support bundle archive: %s\n' "$ARCHIVE"
  printf 'Review and redact the archive before sharing.\n'
else
  printf '[error] failed to create archive. Raw bundle remains at: %s\n' "$BUNDLE_DIR" >&2
  cat "${BUNDLE_DIR}/tar_error.txt" >&2
  exit 1
fi

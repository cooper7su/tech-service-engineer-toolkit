#!/usr/bin/env bash
set -u

TARGET=""

usage() {
  cat <<'USAGE'
Usage: ./scripts/network_basic_check.sh [target_host_or_ip]

Checks local IP, default route, DNS configuration, gateway reachability,
and optionally basic reachability/name resolution for one target.
USAGE
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

if [ "$#" -gt 1 ]; then
  printf '[error] too many arguments\n' >&2
  usage
  exit 2
fi

TARGET="${1:-}"

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

default_gateway() {
  gw=""
  if have ip; then
    gw="$(ip route show default 2>/dev/null | awk '/default/ {print $3; exit}')"
  fi
  if [ -z "$gw" ] && have route; then
    gw="$(route -n get default 2>/dev/null | awk '/gateway:/ {print $2; exit}')"
  fi
  if [ -z "$gw" ] && have netstat; then
    gw="$(netstat -rn 2>/dev/null | awk '($1 == "default" || $1 == "0.0.0.0") && $2 !~ /^link#/ {print $2; exit}')"
  fi
  printf '%s\n' "$gw"
}

resolve_target() {
  name="$1"
  if have getent; then
    run_cmd getent hosts "$name"
  elif have dig; then
    run_cmd dig +short "$name"
  elif have nslookup; then
    run_cmd nslookup "$name"
  elif have host; then
    run_cmd host "$name"
  else
    printf '[skip] no resolver command found for target lookup\n'
  fi
}

section "Run Context"
printf 'Timestamp: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %Z' 2>/dev/null || date)"
printf 'Hostname: %s\n' "$(hostname 2>/dev/null || printf 'unknown')"
printf 'Target: %s\n' "${TARGET:-none}"

section "Local IP Configuration"
if have ip; then
  run_cmd ip addr
elif have ifconfig; then
  run_cmd ifconfig
else
  printf '[skip] ip/ifconfig not available\n'
fi

section "Default Route"
if have ip; then
  run_cmd ip route
elif have netstat; then
  run_cmd netstat -rn
else
  printf '[skip] ip/netstat not available\n'
fi

GW="$(default_gateway || true)"
if [ -n "$GW" ]; then
  printf 'Detected default gateway: %s\n' "$GW"
else
  printf '[warn] default gateway not detected\n'
fi

section "DNS Configuration"
if [ -r /etc/resolv.conf ]; then
  run_cmd cat /etc/resolv.conf
else
  printf '[skip] /etc/resolv.conf not readable\n'
fi

section "Gateway Reachability"
if [ -n "$GW" ]; then
  if have ping; then
    run_cmd ping -c 4 "$GW"
  else
    printf '[skip] ping not found\n'
  fi
else
  printf '[skip] no default gateway detected\n'
fi

if [ -n "$TARGET" ]; then
  section "Target Name Resolution"
  resolve_target "$TARGET"

  section "Target Reachability"
  if have ping; then
    run_cmd ping -c 4 "$TARGET"
  else
    printf '[skip] ping not found\n'
  fi

  section "Target Route"
  if have ip; then
    run_cmd ip route get "$TARGET"
  elif have route; then
    run_cmd route -n get "$TARGET"
  elif have netstat; then
    run_cmd netstat -rn
  else
    printf '[skip] no non-probing target route command available\n'
  fi
fi

section "Summary Prompt"
printf 'Record: symptom, source IP, target, DNS result, gateway result, target result, and next validation step.\n'

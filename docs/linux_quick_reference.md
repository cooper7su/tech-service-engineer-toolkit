# Linux Quick Reference for Support Work

Use this as a practical command map during troubleshooting. Prefer read-only commands first; do not modify services, firewall rules, files, or disks until scope and rollback are clear.

## Files and Directories

| Command | Purpose |
| --- | --- |
| `pwd` | Show current directory. |
| `ls -lah` | List files with ownership, size, and hidden files. |
| `cd <dir>` | Move between directories. |
| `find <path> -name '<pattern>'` | Locate files by name. |
| `du -sh <path>` | Show total size of a directory or file. |
| `du -xhd1 <path>` | Show one-level disk usage without crossing filesystems. |
| `df -h` | Show filesystem capacity and usage. |
| `df -i` | Show inode usage; useful when disk has space but file creation fails. |
| `tail -n 100 <file>` | Read the latest lines from a log or text file. |
| `less <file>` | Page through large files safely. |
| `grep -n '<text>' <file>` | Search text with line numbers. |

## Processes, Services, and Logs

| Command | Purpose |
| --- | --- |
| `ps aux --sort=-%cpu | head` | Show top CPU-consuming processes. |
| `ps aux --sort=-rss | head` | Show top memory-consuming processes. |
| `top` | Interactive process and system view. |
| `uptime` | Show load average and how long the system has been running. |
| `systemctl status <service>` | Check a systemd service status. |
| `systemctl list-units --type=service --state=failed` | Show failed services. |
| `journalctl -u <service> --since '1 hour ago'` | Read recent logs for one service. |
| `journalctl -p warning -n 100` | Show recent warning-or-higher system logs. |
| `dmesg -T | tail -n 100` | Show recent kernel messages with readable timestamps. |

## Network Checks

| Command | Purpose |
| --- | --- |
| `ip addr` | Show interface addresses and link state. |
| `ip link` | Show network interface status. |
| `ip route` | Show routing table and default gateway. |
| `ip route get <target>` | Show which interface/source IP would be used. |
| `cat /etc/resolv.conf` | Show DNS resolver configuration. |
| `getent hosts <hostname>` | Resolve a hostname using system resolver settings. |
| `ping -c 4 <target>` | Basic reachability and latency test. |
| `tracepath <target>` | Show routing path without requiring root on many systems. |
| `traceroute <target>` | Show routing path when installed. |
| `ss -tulpen` | Show listening TCP/UDP sockets with process info when permitted. |
| `curl -vk <url>` | Test HTTP/TLS behavior with verbose output. |
| `nc -vz <host> <port>` | Test TCP port reachability when netcat is installed. |

## Permissions and Ownership

| Command | Purpose |
| --- | --- |
| `id` | Show current user, UID, GID, and groups. |
| `ls -l <path>` | Show file ownership and mode. |
| `stat <path>` | Show detailed file metadata. |
| `sudo -l` | Show permitted sudo commands for the current user. |
| `getfacl <path>` | Show ACL permissions when installed. |

## Resource View

| Command | Purpose |
| --- | --- |
| `free -h` | Show memory and swap usage. |
| `vmstat 1 5` | Quick CPU, memory, and run queue sampling. |
| `iostat -xz 1 3` | Disk I/O view when `sysstat` is installed. |
| `lsblk` | Show block devices and mount points. |
| `lscpu` | Show CPU topology. |
| `uname -a` | Show kernel and system version. |
| `cat /etc/os-release` | Show Linux distribution details. |

## Support Habit

For every command that matters, record:

- host name
- timestamp and timezone
- command run
- key output
- interpretation
- next action

This prevents the common support failure mode: collecting many outputs but not stating what they prove.

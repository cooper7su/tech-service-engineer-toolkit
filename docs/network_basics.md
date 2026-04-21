# Network Basics for Technical Service Engineers

This document keeps network fundamentals short enough to explain in an interview and practical enough to use during field support.

## OSI Model in Support Language

| Layer | Name | What to check in support work | Common clues |
| --- | --- | --- | --- |
| 7 | Application | App endpoint, API, DNS name, HTTP response, service logs | 4xx/5xx, timeout, bad response, auth error |
| 6 | Presentation | TLS, certificates, encoding, serialization | Certificate expired, TLS handshake failure |
| 5 | Session | Long-lived connections, session state, reconnect behavior | Session reset, idle timeout, reconnect loop |
| 4 | Transport | TCP/UDP ports, firewall, connection state | Port closed, SYN timeout, packet loss |
| 3 | Network | IP address, route, gateway, ICMP reachability | Wrong subnet, no default route, asymmetric path |
| 2 | Data link | VLAN, MAC, switch port, ARP/neighbor table | Wrong VLAN, duplicate MAC, link flapping |
| 1 | Physical | Cable, NIC, power, radio/signal, link LED | Link down, bad cable, unstable signal |

Interview version: "I do not jump straight to the application. I check from observable symptoms to scope, then walk the path by layer: host IP, route, DNS, port, service, logs, and recent changes."

## TCP, UDP, and IP

| Topic | Practical meaning | Support check |
| --- | --- | --- |
| IP | Addressing and routing between hosts. | `ip addr`, `ip route`, `ping`, `traceroute` or `tracepath` |
| TCP | Connection-oriented transport. Good for reliability and ordered delivery. | `ss -tlnp`, `nc -vz host port`, application connection logs |
| UDP | Connectionless transport. Common for DNS, DHCP, telemetry, streaming, and discovery. | `dig`, `tcpdump`, service-specific logs; absence of response may be firewall, routing, or server behavior |
| ICMP | Control and diagnostic messages. Useful but sometimes filtered. | `ping`, `tracepath`; do not treat blocked ICMP as proof the app is down |

## Common Building Blocks

| Term | What it means | Typical failure mode |
| --- | --- | --- |
| VLAN | Logical Layer 2 segmentation on switches. | Device is connected but placed in the wrong network segment. |
| NAT | Rewrites source or destination addresses, often between private and public networks. | Return traffic breaks, port forwarding missing, source IP unexpected. |
| ACL | Rules that allow or deny traffic by source, destination, protocol, or port. | One direction works but the application still times out. |
| DNS | Resolves names to addresses and sometimes service records. | Wrong record, stale cache, resolver unreachable, split-horizon mismatch. |
| DHCP | Automatically assigns IP, gateway, DNS, and lease options. | No lease, wrong gateway, duplicate address, wrong DNS option. |
| ARP / Neighbor Discovery | Maps IP addresses to link-layer addresses on the local segment. | Gateway IP exists but local host cannot resolve its MAC address. |

## Switch vs Router

| Device | Main job | Support explanation |
| --- | --- | --- |
| Switch | Connects devices inside the same Layer 2 network or VLAN. | "If two devices should be in the same VLAN but cannot see each other, I check switch port, VLAN assignment, link state, and ARP." |
| Router | Moves traffic between IP networks. | "If the source and target are in different subnets, I check default gateway, route table, ACL/NAT, and the path between hops." |

## Common Network Troubleshooting Entry Points

Use this order when the problem is unclear:

1. Define the symptom: timeout, refused connection, DNS failure, slow response, intermittent drop, or packet loss.
2. Define the scope: one host, one subnet, one site, one customer, one service, or all users.
3. Confirm local state: IP address, subnet, gateway, DNS server, link state.
4. Test the path: local gateway, DNS resolver, target IP, target port.
5. Compare name and address: does the DNS name resolve to the expected IP?
6. Check the service: is the target process listening on the expected interface and port?
7. Check control points: firewall, ACL, NAT, proxy, VPN, load balancer, security agent.
8. Check timing: recent deployment, config change, certificate change, DHCP lease, network maintenance.
9. Capture evidence: command output, timestamps, source/target IPs, error messages, screenshots only when text is unavailable.
10. State the current conclusion and next validation step.

## Minimal Command Set

```bash
ip addr
ip route
cat /etc/resolv.conf
ping -c 4 <gateway_or_target>
getent hosts <hostname>
ss -tulpen
curl -vk https://<host>:<port>/
```

If a command is missing, record that fact and use the nearest available alternative. For example, use `route -n` if `ip route` is unavailable, or `netstat -tulpen` if `ss` is unavailable.

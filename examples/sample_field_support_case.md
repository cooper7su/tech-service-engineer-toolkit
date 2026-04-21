# Sample Field Support Case: Structured Customer Update

## Context

A customer reported that a Linux edge host stopped uploading telemetry after a planned site maintenance window. The case was handled remotely with customer approval.

## Basic Information

| Field | Value |
| --- | --- |
| Case ID | TSE-DEMO-FS-002 |
| Customer / Site | Demo logistics site B |
| Contact person | Site IT contact |
| Support engineer | Technical service engineer |
| Date | 2026-04-22 |
| Timezone | CST |
| Environment | Field edge host |
| Access method | SSH through customer VPN |

## Symptom and Impact

- Reported symptom: Telemetry upload stopped after maintenance.
- Expected behavior: Edge host uploads telemetry every 60 seconds.
- Impacted service: Reporting dashboard shows stale device data.
- Unaffected comparison: Local data collection still works; only cloud upload is affected.

## Initial Checks

| Area | Check | Result | Notes |
| --- | --- | --- | --- |
| Host | `uptime` | Host rebooted during maintenance | Expected. |
| Resource | `df -h`, `free -h` | Normal | No disk or memory pressure. |
| Network | `ip route`, DNS lookup | Default route present; DNS resolves upload endpoint | Basic network OK. |
| Service | `systemctl status telemetry-agent` | Running | No crash loop. |
| Logs | Agent log | Repeated TLS certificate verification error | Error started after reboot. |
| Change | System time | Clock behind by 7 hours | NTP not synchronized after maintenance. |

## Customer Update Example

```text
Status: root cause likely identified.
Impact: telemetry upload from edge host EDGE-B-03 is affected; local collection is still running.
Evidence: upload endpoint resolves and the agent is running, but agent logs show TLS verification failures. The host clock is 7 hours behind, which explains the certificate validation error.
Current judgement: this is not an application outage; it is a host time synchronization issue after maintenance.
Next step: customer IT will restore NTP reachability, then I will restart the telemetry agent and verify upload recovery. Next update at 15:30 CST.
Need: approval to restart telemetry-agent after NTP is corrected.
```

## Actions Taken

| Time | Action | Owner | Result |
| --- | --- | --- | --- |
| 14:45 | Ran host and network checks | TSE | Host healthy except time drift. |
| 15:05 | Asked customer IT to restore NTP access | TSE / Customer IT | NTP rule corrected. |
| 15:18 | Restarted time sync and telemetry service | TSE | Upload resumed. |
| 15:25 | Verified dashboard freshness | Customer contact | Confirmed. |

## Result and Handover

- Final result: Resolved.
- Verification performed: Agent logs show successful upload; dashboard timestamp updated.
- Customer confirmation: Site IT contact confirmed dashboard recovery.
- Remaining issue: Customer IT will review why NTP was blocked during maintenance.
- Follow-up owner: Customer IT.
- Next checkpoint: 2026-04-23 10:00 CST.

## Experience Reuse

- Reusable check: When TLS errors appear after maintenance, verify host time before changing certificates.
- Document or script to update: Keep `timedatectl` as an optional future check for Linux hosts.
- New FAQ / known issue entry: "Clock drift can cause TLS upload failures."
- Preventive recommendation: Include NTP reachability in deployment and maintenance pre-checks.

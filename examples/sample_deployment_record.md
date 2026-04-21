# Sample Deployment Record: Edge Agent Upgrade

## 1. Basic Information

| Field | Value |
| --- | --- |
| Deployment ID | TSE-DEMO-DEP-003 |
| Project / System | Edge telemetry agent |
| Target environment | Demo field edge host |
| Customer / Site | Demo logistics site B |
| Version / Build | v2.4.1 |
| Package checksum | `sha256:demo-placeholder` |
| Deployment owner | Release engineer |
| Support owner | Technical service engineer |
| Planned window | 2026-04-22 20:00-21:00 CST |
| Actual start time | 2026-04-22 20:05 CST |
| Actual end time | 2026-04-22 20:32 CST |
| Timezone | CST |

## 2. Deployment Scope

- Change summary: Upgrade telemetry agent from v2.3.8 to v2.4.1 for improved retry handling.
- Components changed: Agent binary and service unit environment file.
- Components not changed: OS, database, gateway firmware, network policy.
- Dependencies: NTP, DNS, upload endpoint, local message queue.
- Known risks: Upload delay if retry config is incorrect.
- Rollback trigger: Agent fails health check twice within 10 minutes or upload queue grows for 15 minutes.

## 3. Pre-Deployment Checklist

| Item | Owner | Status | Evidence / Notes |
| --- | --- | --- | --- |
| Scope confirmed | Release engineer | Done | One edge host only. |
| Backup or snapshot confirmed | Customer IT | Done | VM snapshot completed. |
| Rollback plan confirmed | Release engineer | Done | Previous package available. |
| Package and version verified | TSE | Done | Checksum recorded. |
| Customer or stakeholder notified | TSE | Done | Site contact on bridge. |
| Required access confirmed | TSE | Done | SSH and service restart permission confirmed. |
| Monitoring/logs ready | TSE | Done | Agent logs and dashboard open. |
| Maintenance window approved | Customer contact | Done | Approved for 20:00 CST. |

## 4. Deployment Execution Log

| Time | Step | Command / Action | Owner | Result |
| --- | --- | --- | --- | --- |
| 20:05 | Capture pre-check | `./scripts/system_health_check.sh` | TSE | Host normal. |
| 20:10 | Stop agent | `systemctl stop telemetry-agent` | Release engineer | Stopped. |
| 20:13 | Install package | package manager install | Release engineer | Installed v2.4.1. |
| 20:18 | Start agent | `systemctl start telemetry-agent` | Release engineer | Started. |
| 20:22 | Verify port/process | `systemctl status`, `ss -tulpen` | TSE | Running and connected. |
| 20:30 | Verify upload | dashboard and logs | Customer contact / TSE | Fresh telemetry visible. |

## 5. Post-Deployment Verification

| Check | Expected result | Actual result | Owner | Status |
| --- | --- | --- | --- | --- |
| Service status | Active | Active | TSE | Pass |
| Listening port | Local management port open | Open | TSE | Pass |
| Core user flow | Telemetry visible in dashboard | Visible within 60 seconds | Customer contact | Pass |
| Logs | No repeated critical errors | Clean after startup warning | TSE | Pass |
| Metrics | CPU and memory near baseline | CPU 3%, memory stable | TSE | Pass |
| Dependency check | Upload endpoint reachable | Reachable | TSE | Pass |
| Customer acceptance | Site contact confirms | Confirmed at 20:32 | Customer contact | Pass |

## 6. Result

- Deployment result: Success.
- Rollback executed: No.
- Final version running: v2.4.1.
- Open issues: None.
- Customer / stakeholder sign-off: Site contact confirmed deployment success at 20:32 CST.

## 7. Lessons Learned

- What went well: Pre-check and dashboard verification reduced ambiguity.
- What caused delay or risk: Package checksum had to be retrieved from release notes manually.
- What should be automated: Include checksum in deployment ticket.
- What should be added to the checklist: Confirm NTP and DNS before agent restart.
- Follow-up owner and due date: Release engineer to update deployment ticket template by 2026-04-24.

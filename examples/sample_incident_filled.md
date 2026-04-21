# Sample Incident: Customer Site API Timeout

## 1. Basic Information

| Field | Value |
| --- | --- |
| Incident ID | TSE-DEMO-INC-001 |
| Title | Customer site dashboard API timeout after router replacement |
| Reporter | Customer operations contact |
| Owner | Technical service engineer |
| Customer / Site | Demo manufacturing site A |
| Environment | Field |
| Severity | Medium |
| Start time | 2026-04-22 09:20 CST |
| Last update time | 2026-04-22 11:10 CST |
| Timezone | CST |
| Current status | Resolved |

## 2. Symptom

- What happened: The dashboard could load static pages, but API calls to the local gateway timed out.
- Expected behavior: Dashboard should query gateway status within 2 seconds.
- Exact error message: `GET /api/v1/device/status net::ERR_CONNECTION_TIMED_OUT`
- First observed time: 2026-04-22 09:20 CST.
- Reproduction steps: Connect to site LAN, open dashboard, refresh device status.
- Frequency: Continuous until network route was corrected.

## 3. Impact Scope

- Affected users, devices, hosts, sites, or services: Operators on VLAN 30 accessing gateway `10.30.4.20`.
- Unaffected comparison group: Engineers on VLAN 20 could reach the gateway.
- Business or customer impact: Local status page unavailable; device control path was not affected.
- Workaround available: Operations could view status from engineering workstation.
- Deadline or SLA concern: Needed recovery before shift handover.

## 4. Evidence Collected

| Time | Host / Source | Command or source | Key output | Interpretation |
| --- | --- | --- | --- | --- |
| 09:45 | Operator PC | `ping 10.30.4.20` | 100% packet loss | Connectivity failed from operator VLAN. |
| 09:50 | Engineering PC | `curl http://10.30.4.20/health` | HTTP 200 | Gateway service was running. |
| 10:05 | Operator PC | `ip route` | default gateway `10.30.1.1` | Host had expected default route. |
| 10:20 | Router config review | ACL table | VLAN 30 to gateway subnet denied | Network control point matched symptom scope. |

## 5. Actions Taken

| Time | Action | Owner | Result | Notes |
| --- | --- | --- | --- | --- |
| 09:40 | Confirmed symptom and scope | TSE | Affected only operator VLAN | Avoided restarting healthy gateway. |
| 10:20 | Reviewed router ACL with network owner | Network owner | Deny rule found | Change introduced during router replacement. |
| 10:45 | Applied approved ACL correction | Network owner | VLAN 30 could reach gateway | Change approved by customer contact. |
| 11:00 | Verified dashboard API | TSE | Status returned in 600 ms | Customer confirmed recovery. |

## 6. Current Judgement

- Most likely cause: Router replacement introduced an ACL that blocked operator VLAN access to the gateway subnet.
- Rejected causes and evidence: Gateway process was healthy from engineering VLAN; DNS was not involved because the dashboard used a direct IP.
- Unknowns: Why the ACL template differed from the old router export.
- Risk: Similar VLAN rules may be missing for other local tools.

## 7. Next Steps

| Step | Owner | Due time | Expected output |
| --- | --- | --- | --- |
| Compare old and new router ACL exports | Network owner | 2026-04-23 | Confirm no other subnet rules were lost. |
| Add VLAN reachability check to field checklist | TSE | 2026-04-23 | Updated support checklist. |

## 8. Communication Log

| Time | Audience | Message summary | Owner |
| --- | --- | --- | --- |
| 09:55 | Customer operations | Scope narrowed to operator VLAN; gateway service appears healthy. | TSE |
| 10:30 | Customer operations and network owner | Likely ACL issue found; awaiting approved rule correction. | TSE |
| 11:10 | Customer operations | Dashboard API verified and issue resolved; follow-up ACL comparison assigned. | TSE |

## 9. Result

- Final status: Resolved.
- Recovery time: About 1 hour 50 minutes after first support engagement.
- Verification method: `curl` health check and dashboard refresh from operator VLAN.
- Customer / stakeholder confirmation: Operations contact confirmed status page recovered.
- Follow-up issue or ticket: TSE-DEMO-FU-001.

## 10. Lessons Learned

- What signal helped most: Comparing affected and unaffected VLANs.
- What should be checked earlier next time: Router ACL/NAT changes after network hardware replacement.
- Template, script, or document to update: Add VLAN-to-gateway test to `templates/field_support_checklist.md`.
- Preventive action: Keep a pre/post network reachability matrix for deployments involving routing changes.

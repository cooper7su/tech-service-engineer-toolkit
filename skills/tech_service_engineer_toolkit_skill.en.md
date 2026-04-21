# Tech Service Engineer Toolkit Skill

## When to Use

Use this skill when a task involves technical support, field support, Linux or network troubleshooting, deployment support, support handoff, issue closure, or interview demonstration based on this repository.

## Read First

1. `README.md` for repository purpose and navigation.
2. `docs/toolkit_usage_guide.md` for the operating path.
3. `docs/troubleshooting_flow.md` for the core troubleshooting method.
4. `ATTRIBUTION.md` if the task asks about sources or third-party boundaries.

## Scenario Routing

| Scenario | Use docs | Use templates | Use scripts |
| --- | --- | --- | --- |
| Unknown incident | `docs/troubleshooting_flow.md` | `templates/incident_report_template.md` | `scripts/system_health_check.sh` |
| Network issue | `docs/network_basics.md`, `docs/linux_quick_reference.md` | `templates/incident_report_template.md` | `scripts/network_basic_check.sh <target>` |
| Deployment support | `docs/deployment_checklist.md` | `templates/deployment_record_template.md` | `scripts/system_health_check.sh` before/after |
| Escalation package | `docs/toolkit_usage_guide.md` | incident or field template | `scripts/collect_logs.sh` |
| Case closure | `docs/troubleshooting_flow.md` | `templates/issue_closure_template.md` | optional evidence scripts |
| Interview prep | `docs/service_engineer_interview_mapping.md` | examples | `scripts/verify_toolkit.sh` |

## Minimal Executable Flow

1. Define the symptom and impact in one sentence.
2. Open the matching template and start the record.
3. Run read-only checks first:

```bash
./scripts/system_health_check.sh
./scripts/network_basic_check.sh <target>
```

4. If escalation is needed, collect a bundle:

```bash
./scripts/collect_logs.sh
```

5. Summarize evidence as: fact, interpretation, next step.
6. Close with verification, owner, remaining risk, and lesson learned.

## Common Mistakes

- Running scripts without recording the original symptom.
- Sharing support bundles without redaction.
- Treating a failed `ping` as final proof of service failure.
- Closing an issue without customer or stakeholder confirmation.
- Using templates as paperwork instead of decision support.

## Recommended Output Format

```text
Status:
Impact:
Evidence:
Current judgement:
Next step:
Owner:
Risk:
Reusable lesson:
```

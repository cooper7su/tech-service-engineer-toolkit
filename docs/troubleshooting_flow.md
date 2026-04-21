# Structured Troubleshooting Flow

The goal is to move from symptom to evidence-backed conclusion without guessing, over-fixing, or losing communication context.

## Flow Overview

```text
symptom -> scope -> hypothesis -> validation -> conclusion -> sync -> closure
```

## Step-by-Step Flow

| Step | Input | Output | Common actions |
| --- | --- | --- | --- |
| 1. Symptom | User report, alert, screenshot, error text, logs. | A precise problem statement. | Ask what failed, when it started, exact error, expected behavior, and business impact. |
| 2. Scope | Affected users, sites, hosts, versions, networks, accounts. | A boundary: who/what is affected and who/what is not. | Compare affected vs unaffected cases; check recent changes. |
| 3. Hypothesis | Symptom plus scope plus known system path. | Ranked possible causes. | Separate host, network, service, dependency, config, permission, and data issues. |
| 4. Validation | Commands, logs, metrics, reproduction, customer confirmation. | Evidence that supports or rejects a hypothesis. | Run read-only checks first; record timestamps and command outputs. |
| 5. Conclusion | Validated evidence. | Current judgement and recommended action. | State what is known, unknown, and next safest step. |
| 6. Sync | Stakeholder needs and timing. | Clear update with status, impact, owner, ETA or next checkpoint. | Send short updates; avoid hiding uncertainty. |
| 7. Closure | Fix result, verification, customer confirmation. | Closed issue with lesson learned and follow-up actions. | Document root cause or best-known cause, recovery action, prevention, and reusable notes. |

## Inputs to Collect Early

- Environment: production, staging, lab, customer site, device model, OS, version.
- Timeline: first seen, last known good, recent deployment or config change.
- Impact: user count, service, feature, region, severity, workaround.
- Evidence: exact error, logs, command output, monitoring graph, ticket links.
- Ownership: current owner, escalation contact, customer contact, next checkpoint time.

## Output Format for Updates

```text
Status: investigating / mitigated / resolved / waiting for customer / escalated
Impact: who or what is affected
Evidence: one or two facts that changed the diagnosis
Current judgement: likely cause or rejected cause
Next step: action + owner + time
Need: access, logs, approval, maintenance window, or confirmation
```

## Interview Talk Track

"My troubleshooting method is structured. I first make the symptom precise, then narrow the scope by comparing affected and unaffected cases. I form a small set of hypotheses, validate them with logs and read-only commands, and keep stakeholders updated with evidence and next steps. I only close the issue after verification, customer confirmation, and a reusable note or template update."

## Common Mistakes to Avoid

- Jumping to a fix before confirming scope.
- Reporting only symptoms without a current judgement.
- Running destructive commands without rollback.
- Mixing customer-facing updates with internal guesses.
- Closing the issue without verification or lessons learned.
- Saving logs without timestamps, host names, or command context.

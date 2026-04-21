# Troubleshooting Skill

## Purpose

Use this skill to turn a vague technical problem into a scoped, evidence-backed support conclusion.

## Standard Flow

```text
symptom -> scope -> hypothesis -> validation -> conclusion -> sync -> closure
```

## Inputs

- exact symptom or error
- expected behavior
- affected and unaffected scope
- timeline and recent changes
- environment details
- logs, command output, screenshots only if needed
- owner and next checkpoint time

## Steps

1. Symptom: rewrite the problem in one precise sentence.
2. Scope: identify who or what is affected and what is not.
3. Hypothesis: list 2-4 likely causes, ranked by evidence and blast radius.
4. Validation: run read-only checks first; record command, host, time, output, and interpretation.
5. Conclusion: state what is known, what is rejected, and what remains unknown.
6. Sync: send short updates with status, impact, evidence, next step, and owner.
7. Closure: close only after verification, confirmation, remaining-risk statement, and reusable lesson.

## Fact Collection Rules

- Prefer text logs and command output over screenshots.
- Record timestamps and timezone.
- Keep source and target addresses together for network issues.
- Compare a working case with a failing case.
- Preserve original error text.
- Redact secrets before sharing.

## Narrowing Scope

Ask:

- one user or all users?
- one host or many hosts?
- one subnet/site/region or global?
- one version or all versions?
- one feature or the whole service?
- after a change or unrelated to changes?

## Progress Update Format

```text
Status:
Impact:
Evidence:
Current judgement:
Next validation:
Owner / ETA:
Need:
```

## Closure Criteria

- The expected behavior is verified.
- Customer or stakeholder confirmation is recorded.
- Root cause or best-known cause is documented.
- Follow-up owner exists for remaining risk.
- A reusable lesson is added to a template, doc, FAQ, or script backlog.

## Avoid

- "It should be fixed now" without verification.
- "Network issue" without source, target, protocol, and evidence.
- "No logs found" without saying where you checked.
- Changing multiple variables at once.
- Escalating without a concise evidence summary.

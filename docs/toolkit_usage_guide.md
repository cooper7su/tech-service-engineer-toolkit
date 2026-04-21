# Toolkit Usage Guide

This guide explains how to use the repository as a working support toolkit.

## First-Time User Path

1. Read `README.md` or `README.zh-CN.md` for project purpose and navigation.
2. Read `docs/troubleshooting_flow.md` to understand the support method.
3. Read `docs/linux_quick_reference.md` and `docs/network_basics.md` for command-level basics.
4. Run `scripts/verify_toolkit.sh` to confirm the repository is complete.
5. Open one template under `templates/` and one example under `examples/` to see the expected record style.
6. Read one distilled skill under `skills/` if you want an agent-style operating instruction.

## When an Issue Appears

Start here:

- `docs/troubleshooting_flow.md` for the method.
- `templates/incident_report_template.md` to record the case.
- `scripts/system_health_check.sh` for a quick host snapshot.
- `scripts/network_basic_check.sh <target>` when the symptom may involve connectivity.
- `scripts/collect_logs.sh` when escalation or offline review is needed.

## When Supporting Deployment

Start here:

- `docs/deployment_checklist.md` for pre/during/post structure.
- `templates/deployment_record_template.md` for the formal record.
- `scripts/system_health_check.sh` before and after deployment when the target is a Linux host.
- `examples/sample_deployment_record.md` for a filled example.

## When Closing a Case

Start here:

- `templates/issue_closure_template.md`
- `examples/sample_incident_filled.md`
- `docs/troubleshooting_flow.md` closure step

Before closure, confirm:

- symptom is gone or workaround is accepted
- verification is recorded
- customer or stakeholder confirmation exists
- remaining risk is stated
- follow-up owner is assigned
- reusable lesson is captured

## When Preparing for an Interview

Start here:

- `docs/service_engineer_interview_mapping.md`
- `skills/interview_usage_skill.en.md`
- `skills/interview_usage_skill.zh-CN.md`
- `meta/repo_summary_en.txt`
- `meta/repo_summary_zh.txt`

Recommended demo sequence:

1. Explain why the repository exists.
2. Show the troubleshooting flow.
3. Show one script and its graceful degradation behavior.
4. Show one filled example.
5. Show the distilled skills and explain knowledge reuse.

## Minimal Practical Workflow

```bash
./scripts/verify_toolkit.sh
./scripts/system_health_check.sh
./scripts/network_basic_check.sh example.com
./scripts/collect_logs.sh
```

Then record the case with:

- `templates/incident_report_template.md`
- `templates/issue_closure_template.md`

## Redaction Reminder

Before sharing script output or support bundles, remove secrets, tokens, customer identifiers, private IPs if required by policy, usernames if sensitive, and any regulated data. This toolkit helps collect facts; it does not decide what is safe to disclose.

# Interview Usage Skill

## Goal

Use this skill to present the repository as a job-relevant technical service engineering project, not as a generic notes collection.

## Positioning

One-sentence pitch:

"This is a technical service engineering toolkit that turns troubleshooting, deployment support, issue closure, and knowledge reuse into reusable docs, templates, scripts, examples, and distilled skills."

## How to Explain the Project

1. Problem: support work can become scattered across chat, screenshots, partial logs, and memory.
2. Method: define symptom, narrow scope, validate hypotheses, communicate progress, verify recovery, close with lessons learned.
3. Implementation: docs for method, templates for records, scripts for evidence collection, examples for demonstration, skills for reuse.
4. Boundary: public English references were studied, but content was rewritten and attribution is documented.
5. Result: the repository is runnable, auditable, and easy to explain in a technical service interview.

## Capability Mapping

| Interview capability | Show this |
| --- | --- |
| Linux and network basics | `docs/linux_quick_reference.md`, `docs/network_basics.md` |
| Troubleshooting | `docs/troubleshooting_flow.md`, `templates/incident_report_template.md` |
| Deployment support | `docs/deployment_checklist.md`, `templates/deployment_record_template.md` |
| Communication | `examples/sample_field_support_case.md` |
| Automation mindset | `scripts/system_health_check.sh`, `scripts/collect_logs.sh` |
| Issue closure | `templates/issue_closure_template.md` |
| Knowledge reuse | `skills/` and `docs/toolkit_usage_guide.md` |

## Best Demo Sequence

1. Open `README.md` and explain the repository purpose.
2. Open `docs/troubleshooting_flow.md` and explain the flow in 30 seconds.
3. Show `scripts/collect_logs.sh` and explain graceful degradation.
4. Show `examples/sample_incident_filled.md` to prove the template is usable.
5. Show `skills/interview_usage_skill.en.md` to explain distilled reuse.

## Sample Answer

"I built this because technical service work is not only about knowing commands. A good support engineer has to collect facts, narrow scope, communicate clearly, support deployments safely, and close issues with reusable knowledge. This repository demonstrates that. It contains concise fundamentals, a troubleshooting flow, deployment and incident templates, lightweight Linux shell scripts, filled examples, and distilled skills that tell an AI agent or teammate how to use the toolkit."

## Avoid Saying

- "This solves all support issues."
- "This is an official incident response framework."
- "These scripts are enough for production diagnostics."
- "I copied proven templates."

Say instead:

- "It is a lightweight personal method repository."
- "It is designed to be adapted to each environment."
- "It shows how I structure support work and build reusable assets."

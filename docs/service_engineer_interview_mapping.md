# Service Engineer Interview Mapping

This document maps the repository to technical service engineer capability areas so it can be explained as a job-relevant portfolio project.

## Capability Mapping

| Capability | Repository evidence | Interview angle |
| --- | --- | --- |
| Technical fundamentals | `docs/network_basics.md`, `docs/linux_quick_reference.md`, `docs/security_basics.md` | "I organized the fundamentals I expect to use in support: Linux, networking, services, logs, and security controls." |
| Structured troubleshooting | `docs/troubleshooting_flow.md`, `templates/incident_report_template.md`, `scripts/system_health_check.sh` | "I use a repeatable flow: symptom, scope, hypothesis, validation, conclusion, sync, closure." |
| Customer-facing communication | `templates/field_support_checklist.md`, `templates/issue_closure_template.md`, examples | "The templates force me to write impact, owner, next step, and customer confirmation instead of only technical notes." |
| Deployment support | `docs/deployment_checklist.md`, `templates/deployment_record_template.md`, `examples/sample_deployment_record.md` | "I treat deployment as a controlled change with pre-checks, execution record, verification, and rollback." |
| Issue closure | `templates/issue_closure_template.md`, `examples/sample_incident_filled.md` | "I do not close an issue just because the symptom disappeared; I record verification and lessons learned." |
| Documentation habit | README files, `docs/`, `templates/`, `research/related_projects.md`, `ATTRIBUTION.md` | "I can turn repeated work into reusable documents and keep source boundaries clear." |
| Knowledge reuse | `skills/`, `docs/toolkit_usage_guide.md`, examples | "I distilled the repository into skills so future agents, collaborators, or myself can execute the workflow quickly." |
| Lightweight automation | `scripts/system_health_check.sh`, `scripts/collect_logs.sh`, `scripts/network_basic_check.sh`, `scripts/verify_toolkit.sh` | "I automate repetitive evidence collection without heavy dependencies." |

## How to Introduce the Project

Short version:

"I built this repository as a technical service engineering toolkit. It combines troubleshooting methodology, Linux and network quick references, deployment and closure templates, lightweight diagnostic scripts, examples, and distilled skills. The goal is to show how I turn field-support work into a repeatable engineering process."

Detailed version:

"Technical service work is not only knowing commands. The harder part is structuring the case: define the symptom, narrow scope, collect reliable evidence, communicate progress, verify the fix, and close the loop. This repository demonstrates that process in a reusable way. The scripts collect host and network evidence, the templates standardize incident and deployment records, and the skills explain how to use the toolkit during troubleshooting or interviews."

## Strong Modules to Demonstrate

1. `docs/troubleshooting_flow.md`: shows the method.
2. `scripts/collect_logs.sh`: shows lightweight automation and support handoff thinking.
3. `templates/incident_report_template.md`: shows customer-facing structure.
4. `docs/deployment_checklist.md`: shows delivery risk control.
5. `skills/interview_usage_skill.en.md` or `.zh-CN.md`: shows the project can be explained clearly.

## STAR-Style Story

Situation: "Support cases often become scattered across chat, screenshots, logs, and partial command outputs."

Task: "I wanted a reusable repository that shows how I would handle technical service work in a structured way."

Action: "I researched public English references, designed a compact toolkit, wrote docs and templates, implemented shell scripts, added examples, created distilled skills, and ran an audit loop."

Result: "The final repository is not a toy README. It is a runnable and explainable method repository for troubleshooting, deployment support, issue closure, and knowledge reuse."

## Interview Questions This Repository Helps Answer

- "How do you troubleshoot an issue you have never seen before?"
- "How do you collect logs before escalating?"
- "How do you communicate progress to a customer?"
- "What do you check before and after deployment?"
- "How do you make repeated support work more efficient?"
- "How do you document lessons learned?"

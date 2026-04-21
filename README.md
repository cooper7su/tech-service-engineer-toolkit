# tech-service-engineer-toolkit

English | [中文](README.zh-CN.md)

`tech-service-engineer-toolkit` is a personal methodology and engineering toolkit for Technical Service Engineer, Field Support, Troubleshooting, and Deployment Support roles.

It is designed to demonstrate structured troubleshooting, deployment support, issue closure, customer-facing communication, and knowledge reuse through reusable documentation, templates, lightweight scripts, examples, and distilled skills.

## Why This Repo

Technical service work often fails when information is scattered across chat messages, screenshots, partial logs, and personal memory. This repository turns that work into a repeatable loop:

```text
symptom -> scope -> hypothesis -> validation -> conclusion -> sync -> closure -> reusable knowledge
```

The goal is not to build a large operations platform. The goal is to keep a small, credible, runnable, and interview-ready toolkit that shows how support work can be structured and reused.

## Intended Roles and Scenarios

This repository is useful for:

- Technical Service Engineer
- Field Support Engineer
- Application Support Engineer
- Deployment Support Engineer
- Troubleshooting or escalation support roles
- Interview preparation for support-oriented engineering roles

Typical scenarios:

- Linux host health snapshot
- Basic network troubleshooting
- Customer incident record
- Field support checklist
- Deployment record and acceptance
- Issue closure and lessons learned
- Portfolio demonstration during interviews

## Repository Structure

```text
.
├── README.md
├── README.zh-CN.md
├── LICENSE
├── .gitignore
├── ATTRIBUTION.md
├── research/
│   └── related_projects.md
├── docs/
│   ├── network_basics.md
│   ├── linux_quick_reference.md
│   ├── troubleshooting_flow.md
│   ├── deployment_checklist.md
│   ├── security_basics.md
│   ├── service_engineer_interview_mapping.md
│   └── toolkit_usage_guide.md
├── templates/
│   ├── incident_report_template.md
│   ├── field_support_checklist.md
│   ├── deployment_record_template.md
│   └── issue_closure_template.md
├── scripts/
│   ├── system_health_check.sh
│   ├── collect_logs.sh
│   ├── network_basic_check.sh
│   └── verify_toolkit.sh
├── examples/
│   ├── sample_incident_filled.md
│   ├── sample_field_support_case.md
│   └── sample_deployment_record.md
├── skills/
│   ├── tech_service_engineer_toolkit_skill.zh-CN.md
│   ├── tech_service_engineer_toolkit_skill.en.md
│   ├── troubleshooting_skill.zh-CN.md
│   ├── troubleshooting_skill.en.md
│   ├── interview_usage_skill.zh-CN.md
│   └── interview_usage_skill.en.md
└── meta/
    ├── github_about_zh.txt
    ├── github_about_en.txt
    ├── repo_summary_zh.txt
    └── repo_summary_en.txt
```

## Directory Guide

| Directory | Purpose |
| --- | --- |
| `docs/` | Core technical notes and support methodology. Start with `docs/troubleshooting_flow.md` and `docs/toolkit_usage_guide.md`. |
| `templates/` | Reusable Markdown templates for incidents, field support, deployment, and issue closure. |
| `scripts/` | Lightweight Bash scripts for host health checks, log collection, network checks, and repository verification. |
| `examples/` | Filled examples showing how the templates are intended to be used. |
| `skills/` | Distilled operating instructions for AI agents, collaborators, or future self-use. |
| `research/` | Research notes on related English-language public references and local workspace findings. |
| `meta/` | GitHub About text and short repository summaries. |

## Quick Start

```bash
git clone <repo-url>
cd tech-service-engineer-toolkit
./scripts/verify_toolkit.sh
```

Run a quick host snapshot:

```bash
./scripts/system_health_check.sh
```

Run a basic network check:

```bash
./scripts/network_basic_check.sh example.com
```

Collect a support bundle:

```bash
./scripts/collect_logs.sh
```

The scripts are intentionally dependency-light. If a command such as `ip`, `ss`, `journalctl`, `free`, or `lsblk` is missing, the scripts print a skip or warning message and continue with available alternatives where possible.

## How to Run Scripts

| Script | Purpose | Example |
| --- | --- | --- |
| `scripts/system_health_check.sh` | Prints hostname, OS, uptime, CPU, memory, disk, interfaces, routes, DNS config, listening ports, and recent logs. | `./scripts/system_health_check.sh` |
| `scripts/collect_logs.sh` | Creates a `.tar.gz` support bundle with host, system, disk, memory, network, process, port, service, and recent log snapshots. | `./scripts/collect_logs.sh -o /tmp` |
| `scripts/network_basic_check.sh` | Checks local IP, default route, DNS config, gateway reachability, and optional target reachability. | `./scripts/network_basic_check.sh example.com` |
| `scripts/verify_toolkit.sh` | Checks required docs, templates, scripts, examples, skills, script permissions, and README references. | `./scripts/verify_toolkit.sh` |

Before sharing script output or support bundles, redact secrets, tokens, customer identifiers, private data, and any sensitive environment information.

## How to Use Templates

Use templates during work, not only after work:

1. Open `templates/incident_report_template.md` when a new issue appears.
2. Use `templates/field_support_checklist.md` for onsite or remote support sessions.
3. Use `templates/deployment_record_template.md` before, during, and after a deployment.
4. Use `templates/issue_closure_template.md` before closing a ticket.
5. Compare with `examples/sample_incident_filled.md`, `examples/sample_field_support_case.md`, and `examples/sample_deployment_record.md` for expected detail level.

## How to Use the Distilled Skills

The `skills/` files are compact operating instructions distilled from the repository. They are useful when giving this repository to an AI agent, a collaborator, or your future self.

Recommended paths:

- `skills/tech_service_engineer_toolkit_skill.en.md`
- `skills/tech_service_engineer_toolkit_skill.zh-CN.md`
- `skills/troubleshooting_skill.en.md`
- `skills/troubleshooting_skill.zh-CN.md`
- `skills/interview_usage_skill.en.md`
- `skills/interview_usage_skill.zh-CN.md`

Typical usage:

1. Pick the matching skill.
2. Follow its "read first" or input section.
3. Use the linked docs, templates, and scripts.
4. Produce the recommended output format.
5. Close with verification, owner, risk, and reusable lesson.

Example:

```text
For a network-related customer issue, read:
1. skills/troubleshooting_skill.en.md
2. docs/network_basics.md
3. templates/incident_report_template.md

Then run:
./scripts/network_basic_check.sh <target>
```

## Typical Use Cases

### 1. Unknown Customer Issue

- Start with `docs/troubleshooting_flow.md`.
- Record facts in `templates/incident_report_template.md`.
- Run `scripts/system_health_check.sh`.
- If network is involved, run `scripts/network_basic_check.sh <target>`.
- Close with `templates/issue_closure_template.md`.

### 2. Deployment Support

- Read `docs/deployment_checklist.md`.
- Use `templates/deployment_record_template.md`.
- Run `scripts/system_health_check.sh` before and after deployment.
- Record sign-off and remaining risk.

### 3. Escalation Package

- Run `scripts/collect_logs.sh`.
- Add a short summary using the troubleshooting update format.
- Redact the support bundle before sharing.
- Attach the relevant incident or field support template.

### 4. Interview Demonstration

- Read `docs/service_engineer_interview_mapping.md`.
- Show `docs/troubleshooting_flow.md`, one script, one template, one example, and one skill.
- Use `meta/repo_summary_en.txt` or `meta/repo_summary_zh.txt` as a short project summary.

## Relationship to Third-Party Projects

This repository was built after researching English-language public references and related repositories, including Google SRE incident response material, NIST and CISA incident response guidance, public incident response templates, Linux/network troubleshooting references, deployment checklist examples, and support diagnostic tools.

The repository does not copy large sections of third-party README text, source code, templates, or official documentation. Where ideas or structure were learned, the source and usage boundary are recorded in `research/related_projects.md` and `ATTRIBUTION.md`.

## References

Key references include:

- [Google SRE Workbook: Incident Response](https://sre.google/workbook/incident-response/)
- [NIST SP 800-61r3 Incident Response Recommendations](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r3.pdf)
- [CISA Federal Government Cybersecurity Incident and Vulnerability Response Playbooks](https://www.cisa.gov/ncas/current-activity/2021/11/16/new-federal-government-cybersecurity-incident-and-vulnerability)
- [Counteractive Incident Response Plan Template](https://github.com/counteractive/incident-response-plan-template)
- [AWS Incident Response Playbook Samples](https://github.com/aws-samples/aws-incident-response-playbooks)
- [linux-network-troubleshooting](https://bertvv.github.io/linux-network-troubleshooting/tldr-checklist.html)
- [Cisco Troubleshooting TCP/IP](https://www.cisco.com/en/US/docs/internetworking/troubleshooting/guide/tr1907.html)
- [Elastic Support Diagnostics](https://github.com/elastic/support-diagnostics)
- [Microsoft SQL LogScout](https://github.com/microsoft/SQL_LogScout)
- [GitHub Support Docs: Getting Help](https://docs.github.com/en/actions/how-tos/get-support)

See `ATTRIBUTION.md` for exact source-boundary notes.

## Future Extensions

Useful next steps:

- Add Windows PowerShell diagnostic scripts.
- Add service-specific checklists for web apps, databases, VPN, or IoT gateways.
- Add a redaction helper for support bundles.
- Add GitHub Actions validation for Markdown links and shell syntax.
- Add more filled examples for high CPU, disk full, DNS failure, and certificate expiry.
- Add an optional `docs/known_issue_index.md` for repeated support cases.

## License

Original content in this repository is released under the MIT License. Third-party references remain under their own licenses and terms.

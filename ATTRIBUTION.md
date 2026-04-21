# Attribution and Source Boundary

This repository is original work created for a personal technical service engineering portfolio. It was informed by English-language public references and local workspace structure checks, but it does not include large copied sections of third-party README text, source code, templates, playbooks, standards, or product documentation.

## Attribution Summary

| Source | Link | Borrowed or referenced content | Scope | Rewrite / reconstruction in this repository |
| --- | --- | --- | --- | --- |
| Google SRE Workbook: Incident Response | https://sre.google/workbook/incident-response/ | Incident response discipline: defined process, coordination, communication, and a running record. | Conceptual only. | Rewritten as a service-engineer troubleshooting flow in `docs/troubleshooting_flow.md` and distilled skills. |
| NIST SP 800-61r3 | https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r3.pdf | Incident lifecycle and continuous improvement framing. | Conceptual only. | Reframed into lightweight preparation, validation, recovery, closure, and lessons-learned sections. |
| CISA Federal Government Cybersecurity Incident and Vulnerability Response Playbooks | https://www.cisa.gov/ncas/current-activity/2021/11/16/new-federal-government-cybersecurity-incident-and-vulnerability | Checklist and playbook discipline for response work. | Conceptual only. | Converted into smaller support templates and an audit checklist. |
| Counteractive Incident Response Plan Template | https://github.com/counteractive/incident-response-plan-template | Template-driven incident response organization and after-action review idea. | Conceptual only. No template text copied. | Rebuilt as concise support-engineer templates under `templates/`. |
| AWS Incident Response Playbook Samples | https://github.com/aws-samples/aws-incident-response-playbooks | Need to customize and test playbooks before relying on them. | Conceptual only. | Added environment-adaptation notes in README, usage guide, and skills. |
| Scoutflo SRE Playbooks | https://github.com/Scoutflo/Scoutflo-SRE-Playbooks | README navigation, quick-reference mindset, and playbook discovery pattern. | Conceptual only. | Applied as compact navigation and use-case sections in README files. |
| linux-network-troubleshooting | https://bertvv.github.io/linux-network-troubleshooting/tldr-checklist.html | Layered Linux network troubleshooting approach. | Conceptual command-selection inspiration. | Rewritten as `docs/network_basics.md`, `docs/linux_quick_reference.md`, and `scripts/network_basic_check.sh`. |
| Cisco Troubleshooting TCP/IP | https://www.cisco.com/en/US/docs/internetworking/troubleshooting/guide/tr1907.html | Path-based network troubleshooting, DNS and VLAN concepts, hop-by-hop thinking. | Conceptual only. | Rewritten into concise vendor-neutral network basics and troubleshooting entry points. |
| Cloudflare Network Layers Reference | https://developers.cloudflare.com/fundamentals/reference/network-layers/ | Compact protocol-to-layer sanity check. | Conceptual only. | Used to keep OSI layer explanations concise and accurate. |
| Elastic Support Diagnostics | https://github.com/elastic/support-diagnostics | Diagnostic archive concept, system/log collection scope, and support handoff value. | Conceptual only. No code copied. | Rebuilt as generic shell scripts `system_health_check.sh` and `collect_logs.sh`. |
| Microsoft SQL LogScout | https://github.com/microsoft/SQL_LogScout | Scenario-oriented diagnostic collection with clear progress messages. | Conceptual only. No code copied. | Rebuilt as simple collector sections and clear output messages in shell scripts. |
| GitHub Support Docs | https://docs.github.com/en/actions/how-tos/get-support | Support data should be well formatted and redacted before sharing. | Conceptual only. | Added redaction reminders to templates and collection guidance. |
| IdeaPlan Deployment Checklist Template | https://www.ideaplan.io/templates/deployment-checklist-template | Pre-deployment, execution, post-deployment, rollback, and sign-off checklist rhythm. | Conceptual only. | Rewritten into `docs/deployment_checklist.md` and `templates/deployment_record_template.md`. |
| Local ADAS toolkit repository | `/Users/coopersu/Documents/ADAS_TEST` | Local example of portfolio repository hygiene: docs, templates, examples, audit report, attribution boundaries. | Local structure inspiration only. | This repository uses a different topic, different content, Bash scripts instead of Python tools, and embedded distilled skills. |
| Local ADAS skill repository | `/Users/coopersu/Documents/adas-homologation-scenario-workflow-skill` | Local example of compact skill-style operational instructions. | Local structure inspiration only. | Skills were rewritten from scratch for technical service, troubleshooting, and interview usage. |

## Copied Content Statement

- No third-party source code was copied into this repository.
- No third-party README, checklist, or template was copied in bulk.
- No official standard, playbook, or product documentation was reproduced.
- The shell scripts in `scripts/` are original lightweight utilities written for this repository.
- Templates in `templates/` are original, field-service-oriented Markdown templates.
- Any future direct quotation, code import, or template import should be added to this file with the exact source, license, scope, and reason.

## Practical Boundary

This repository is a learning and portfolio project. It is not official guidance from Google, NIST, CISA, AWS, Cisco, Cloudflare, Elastic, Microsoft, GitHub, or IdeaPlan. Users should adapt scripts and templates to their own environment, remove secrets before sharing artifacts, and verify procedures before using them in production or customer environments.

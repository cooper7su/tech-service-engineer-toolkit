# Deployment Support Checklist

This checklist is designed for technical service engineers who support deployment, acceptance, handover, or field rollout work.

## Pre-Deployment Checks

| Check | Why it matters | Status / Notes |
| --- | --- | --- |
| Deployment scope confirmed | Prevents uncontrolled changes. | |
| Target environment identified | Avoids deploying to the wrong host, site, or tenant. | |
| Version and package checksum recorded | Supports rollback and later audit. | |
| Dependencies confirmed | Database, middleware, network, certificates, storage, and accounts. | |
| Change window approved | Ensures support and customer availability. | |
| Rollback plan ready | Defines how to return to last known good state. | |
| Backup or snapshot confirmed | Reduces recovery risk. | |
| Monitoring and logs ready | Makes post-deploy verification measurable. | |
| Customer or stakeholder notified | Prevents surprise and aligns expectations. | |
| Known risks documented | Makes risk explicit before execution. | |

## During Deployment

Record every important event with time and owner:

- start time
- operator
- command or action
- package or version
- config file changed
- service restart
- observed warning or error
- decision made
- rollback trigger if any

## Post-Deployment Verification

| Verification | Example evidence |
| --- | --- |
| Service is running | `systemctl status`, health endpoint, process list |
| Port is listening | `ss -tulpen` |
| Basic user flow works | login, query, upload, device connection, API call |
| Logs are clean enough | no repeated critical errors after deployment |
| Metrics are within baseline | CPU, memory, disk, latency, error rate |
| Dependency checks pass | database, DNS, external API, device gateway |
| Customer acceptance confirmed | named contact and timestamp |

## Handover and Sign-Off

Include:

- deployed version
- target environment
- change summary
- validation result
- unresolved issues
- workaround, if any
- rollback status
- owner for follow-up
- customer or internal sign-off

## Risk Prompts

Ask these before declaring success:

1. What would prove the deployment failed?
2. What is the fastest rollback path?
3. Which logs or metrics should be watched for the next 30 minutes?
4. Which customer-facing function must be verified first?
5. What changed compared with the last successful deployment?

## Interview Talk Track

"For deployment support, I treat the work as a controlled change. I confirm scope, version, dependencies, rollback, and backup before deployment. During the deployment I record actions and timestamps. Afterward I verify service health, user flow, logs, and customer acceptance, then write a deployment record so the result is reusable and auditable."

# Security Basics for Technical Service Engineers

This document is a practical support-level summary. It is not a security policy or compliance guide.

## Firewall

A firewall controls network traffic based on rules such as source, destination, protocol, and port. In support work, a firewall issue often appears as a timeout, one-way connectivity, or a service reachable from one network but not another.

Support checks:

- source IP, destination IP, protocol, and port
- direction of traffic
- whether the service is actually listening
- host firewall and network firewall
- recent rule or policy changes

## Intrusion Detection and Prevention

Intrusion Detection Systems (IDS) observe suspicious activity and generate alerts. Intrusion Prevention Systems (IPS) can block traffic. In a support case, these tools can explain why an apparently correct request is dropped or reset.

Support checks:

- alert timestamp vs customer symptom timestamp
- blocked source or destination
- signature or policy name
- whether the block is expected
- escalation path to security owner

## Endpoint Security

Endpoint security protects servers, laptops, industrial PCs, or field devices. It may include antivirus, EDR, host firewall, device control, and vulnerability monitoring.

Support checks:

- agent status and version
- quarantined files
- blocked process or script
- host firewall policy
- recent security updates
- exception request process

## Access Control

Access control decides who or what can access a resource. In technical service, many issues that look like "system down" are actually identity, permission, token, certificate, or role problems.

Support checks:

- user, service account, token, certificate, or API key
- role or group membership
- expiration time
- failed login or authorization logs
- least-privilege impact: grant only what is needed

## Log Auditing

Logs create the evidence trail for troubleshooting, security review, and issue closure. Good logs answer what happened, when, where, by whom, and with what result.

Support checks:

- system logs
- application logs
- access logs
- audit logs
- security tool logs
- time synchronization
- retention and redaction requirements

## Zero Trust

Zero trust means access should not be trusted only because a user or device is "inside the network." Access decisions should consider identity, device state, policy, least privilege, and continuous monitoring.

Support explanation:

"A VPN connection or internal IP is not enough by itself. I still need to verify the identity, device posture, policy, target resource, and logs before concluding why access is allowed or denied."

## Support Boundary

Technical service engineers often collect facts and coordinate with security owners; they should not silently bypass security controls. If a security control blocks work, record evidence, business impact, requested exception, owner approval, and expiration time.

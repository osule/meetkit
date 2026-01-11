# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability in MeetKit, please report it responsibly.

### How to Report

1. **Do not** create a public GitHub issue for security vulnerabilities
2. Email security details to the maintainers via GitHub Issues (mark as security-related)
3. Include as much detail as possible:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### What to Expect

- Acknowledgment within 48 hours
- Regular updates on investigation progress
- Credit for responsible disclosure (if desired)
- Notification when the vulnerability is fixed

### Security Best Practices

When deploying MeetKit:

- Use strong, randomly generated passwords in secrets
- Keep Kubernetes cluster updated
- Use network policies to restrict traffic
- Enable TLS for all communications
- Regularly update Jitsi Meet images
- Monitor logs for suspicious activity
- Use JWT authentication in production
- Restrict OAuth callback URLs

### Scope

This security policy covers:
- MeetKit Helm chart templates
- Configuration vulnerabilities
- Documentation security guidance

This policy does not cover:
- Vulnerabilities in upstream Jitsi Meet components
- Kubernetes cluster security
- Infrastructure security
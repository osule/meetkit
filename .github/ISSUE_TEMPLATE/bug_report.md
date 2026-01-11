---
name: Bug report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Deploy with values '...'
2. Access '....'
3. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Environment:**
- Kubernetes version: [e.g. 1.28]
- Helm version: [e.g. 3.12]
- MeetKit version: [e.g. 1.0.0]
- Ingress controller: [e.g. traefik, nginx]

**Configuration**
```yaml
# Your values.yaml (remove sensitive data)
```

**Logs**
```
# Relevant pod logs
kubectl logs -l app.kubernetes.io/name=meetkit
```

**Additional context**
Add any other context about the problem here.
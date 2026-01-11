# MeetKit

Production-ready Helm chart for self-hosting Jitsi Meet on Kubernetes. Deploy your own secure video conferencing platform with JWT authentication, Google OAuth integration, and automatic TLS certificates.

## Features

- 🔒 **Secure by default**: All credentials via Kubernetes secrets
- 🔑 **Flexible authentication**: JWT, Google OAuth, or internal auth
- 🌐 **Auto TLS**: cert-manager integration for automatic certificates
- 📦 **Zero hardcoded values**: Fully configurable for any organization
- 🚀 **Production-ready**: Resource limits, health probes, and scaling support
- 🎯 **Lobby support**: Require moderator approval for guests

## Quick Start

### Prerequisites

- Kubernetes cluster (1.19+)
- Helm 3.x
- cert-manager (for automatic TLS)
- Public IP address for JVB
- Domain name pointing to your cluster

### 1. Create Secrets

```bash
# Create credentials secret
kubectl create secret generic jitsi-credentials \
  --from-literal=jicofo-password=$(openssl rand -hex 16) \
  --from-literal=jvb-password=$(openssl rand -hex 16) \
  --from-literal=prosody-password=$(openssl rand -hex 16)

# Create JWT secret
kubectl create secret generic jitsi-jwt \
  --from-literal=jwt-secret=$(openssl rand -hex 32)

# Optional: Create Google OAuth secret
kubectl create secret generic google-oauth \
  --from-literal=clientId=YOUR_CLIENT_ID \
  --from-literal=clientSecret=YOUR_CLIENT_SECRET
```

### 2. Create values.yaml

```yaml
domain: "meet.yourcompany.com"

jvb:
  advertiseIps: ["YOUR_PUBLIC_IP"]

auth:
  type: jwt
  jwt:
    secretName: "jitsi-jwt"

credentials:
  secretName: "jitsi-credentials"
```

### 3. Install

```bash
helm install meetkit ./meetkit -f values.yaml
```

### 4. Access

Visit `https://meet.yourcompany.com`

## Configuration

### Required Values

| Parameter | Description | Example |
|-----------|-------------|---------|
| `domain` | Your domain name | `meet.company.com` |
| `jvb.advertiseIps` | Public IP addresses for JVB | `["1.2.3.4"]` |
| `credentials.secretName` | Secret with component passwords | `jitsi-credentials` |

### Authentication

#### JWT Authentication (Recommended)

```yaml
auth:
  type: jwt
  enableGuests: true
  enableLobby: true
  jwt:
    appId: "jitsi"
    secretName: "jitsi-jwt"
```

#### Google OAuth

```yaml
auth:
  type: jwt
  jwt:
    secretName: "jitsi-jwt"
  oauth:
    google:
      enabled: true
      secretName: "google-oauth"
```

Users who authenticate via Google OAuth become moderators automatically.

#### No Authentication

```yaml
auth:
  type: none
```

### Networking

```yaml
jvb:
  advertiseIps: ["1.2.3.4", "5.6.7.8"]  # Multiple IPs for HA
  hostPort: 10000  # Optional: bind to host port
  nodePort: 30000  # NodePort for JVB service

ingress:
  enabled: true
  className: traefik  # or nginx
  tls: true
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt
```

### Resources

```yaml
resources:
  web:
    limits:
      cpu: 500m
      memory: 512Mi
    requests:
      cpu: 200m
      memory: 256Mi
```

## Examples

See the `examples/` directory for complete configuration examples:

- `minimal.yaml` - Minimal configuration to get started
- `production.yaml` - Production-ready with all features
- `development.yaml` - Development/testing setup

## Architecture

MeetKit deploys four main components:

- **Web**: Nginx serving the Jitsi Meet web interface
- **Prosody**: XMPP server for signaling
- **Jicofo**: Jitsi Conference Focus for managing conferences
- **JVB**: Jitsi Videobridge for media routing

## Security

- All credentials stored in Kubernetes secrets
- No plain text passwords in values.yaml
- TLS encryption via cert-manager
- Optional XMPP encryption
- Non-root containers
- Minimal RBAC permissions

## Troubleshooting

### Can't join meetings

1. Check JVB public IP is correct: `kubectl logs -l app.kubernetes.io/component=jvb`
2. Verify firewall allows UDP 10000
3. Check JWT secret is configured correctly

### Connection issues

1. Verify domain DNS points to cluster
2. Check TLS certificate is valid
3. Review ingress logs

### OAuth not working

1. Verify Google OAuth credentials are correct
2. Check authorized redirect URIs include `https://YOUR_DOMAIN/auth/callback`
3. Review oauth pod logs

## License

MIT

## Contributing

Contributions welcome! Please open an issue or PR.

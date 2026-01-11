# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial release of MeetKit Helm chart
- JWT authentication support
- Google OAuth integration
- Automatic TLS certificate management
- Production-ready resource limits and health probes
- Lobby support for guest approval
- Multiple authentication modes (JWT, internal, none)
- Comprehensive configuration examples
- Security-focused design with Kubernetes secrets
- Open source governance files (LICENSE, CONTRIBUTING.md, CODE_OF_CONDUCT.md)
- Security policy and vulnerability reporting process
- GitHub issue and PR templates
- Authors file for contributor recognition

### Features
- Web interface deployment (Jitsi Meet)
- Prosody XMPP server
- Jicofo conference focus
- JVB videobridge with public IP support
- Ingress configuration with cert-manager
- Configurable resource limits
- Multi-replica support
- Feature flags for P2P, simulcast, and more

### Security
- No hardcoded credentials
- TLS encryption by default
- Non-root containers
- Minimal RBAC permissions

## [1.0.0] - TBD

### Added
- First stable release
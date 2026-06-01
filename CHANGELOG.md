# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [Unreleased]

---

## [0.2.0] - 2026-06-01

### Added

- Documentação GitFlow no README
- Workflows de GitFlow (feature, release, hotfix) em `.gitflow/workflows/`
- Templates de Pull Request (feature, bug, hotfix)
- GitHub Action de auto-review de PRs (validação de branch, destino, conventional commits, changelog)
- GitHub Action de auto-label de PRs (feature, bug, fix, release)
- Dependabot configurado para NuGet, Docker e GitHub Actions
- Docker com multi-stage build (Dockerfile, Dockerfile.test)
- Docker Compose para produção e desenvolvimento
- `.dockerignore` para builds otimizados
- Arquivo de changelog

## [0.1.0] - 2026-06-01

### Added

- Inicialização do repositório
- `.gitignore` para projetos .NET
- Configuração do GitFlow com branches `main` e `develop`

[Unreleased]: https://github.com/bzn-digital/vouchify/compare/v0.2.0...develop
[0.2.0]: https://github.com/bzn-digital/vouchify/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/bzn-digital/vouchify/releases/tag/v0.1.0

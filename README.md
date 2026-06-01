# Vouchify

## GitFlow

Este projeto utiliza o modelo de branching **GitFlow** com as seguintes branches:

| Branch | Descrição |
|--------|-----------|
| `main` | Código em produção. Cada merge recebe uma **tag** de versão (ex: `v1.0.0`). |
| `develop` | Branch de integração. Base para desenvolvimento ativo. |
| `feature/*` | Branches para novas funcionalidades. Sempre derivam de `develop` e são mergeadas de volta em `develop`. |
| `release/*` | Branches de preparação para release. Derivam de `develop` e são mergeadas em `main` (com tag) e em `develop`. |
| `hotfix/*` | Correções urgentes em produção. Derivam de `main` e são mergeadas em `main` (com tag) e em `develop`. |

### Fluxo de Feature

```bash
git checkout develop
git pull origin develop
git checkout -b feature/nome-da-feature

# Desenvolvimento...
git add .
git commit -m "feat: descrição da feature"

git push -u origin feature/nome-da-feature
# Abrir Pull Request para develop
```

### Fluxo de Release

```bash
git checkout develop
git pull origin develop
git checkout -b release/1.0.0

# Ajustes finais (versionamento, fixes menores)...
git add .
git commit -m "chore: prepara release 1.0.0"

# Merge em main com tag
git checkout main
git merge --no-ff release/1.0.0
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin main --tags

# Merge de volta em develop
git checkout develop
git merge --no-ff release/1.0.0
git push origin develop

# Remover branch de release
git branch -d release/1.0.0
git push origin --delete release/1.0.0
```

### Fluxo de Hotfix

```bash
git checkout main
git checkout -b hotfix/1.0.1

# Correção...
git add .
git commit -m "fix: descrição do hotfix"

# Merge em main com tag
git checkout main
git merge --no-ff hotfix/1.0.1
git tag -a v1.0.1 -m "Hotfix v1.0.1"
git push origin main --tags

# Merge em develop
git checkout develop
git merge --no-ff hotfix/1.0.1
git push origin develop

# Remover branch de hotfix
git branch -d hotfix/1.0.1
git push origin --delete hotfix/1.0.1
```

### Versionamento (SemVer)

Seguimos **Semantic Versioning** (`MAJOR.MINOR.PATCH`):

- **MAJOR**: mudanças incompatíveis com versões anteriores
- **MINOR**: novas funcionalidades compatíveis
- **PATCH**: correções de bugs compatíveis

### Proteção de Branches (GitHub)

As branches `main` e `develop` devem ser protegidas no GitHub:

1. Acesse **Settings → Branches → Branch protection rules**
2. Para `main` e `develop`:
   - **Require a pull request before merging** (com pelo menos 1 approval)
   - **Require status checks to pass** (quando houver CI)
   - **Require linear history** (opcional, para manter histórico limpo)
   - **Do not allow force pushes**
   - **Do not allow deletions**

## Stack

- **.NET** (a definir versão e tipo de projeto)
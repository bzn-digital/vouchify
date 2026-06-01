---
description: GitFlow Release - criar branch de release, merge em main com tag e em develop
---

## GitFlow Release Workflow

1. Certifique-se de estar na branch `develop` e atualizada:
   ```
   git checkout develop
   git pull origin develop
   ```

2. Crie a branch de release com a versão adequada (SemVer):
   ```
   git checkout -b release/X.Y.Z
   ```

3. Atualize o versionamento no projeto (.NET: `Directory.Build.props` ou `.csproj`)

4. Commit as alterações de versionamento:
   ```
   git add .
   git commit -m "chore: prepara release X.Y.Z"
   ```

5. Push da branch de release e abra PR para `main`:
   ```
   git push -u origin release/X.Y.Z
   ```

6. Após aprovação e merge do PR em `main`, crie a tag:
   ```
   git checkout main
   git pull origin main
   git tag -a vX.Y.Z -m "Release vX.Y.Z"
   git push origin main --tags
   ```

7. Merge de volta em `develop`:
   ```
   git checkout develop
   git merge --no-ff release/X.Y.Z
   git push origin develop
   ```

8. Delete a branch de release:
   ```
   git branch -d release/X.Y.Z
   git push origin --delete release/X.Y.Z
   ```

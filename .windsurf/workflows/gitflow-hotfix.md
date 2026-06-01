---
description: GitFlow Hotfix - correção urgente em produção
---

## GitFlow Hotfix Workflow

1. Crie a branch de hotfix a partir de `main`:
   ```
   git checkout main
   git pull origin main
   git checkout -b hotfix/X.Y.Z
   ```

2. Aplique a correção e commit:
   ```
   git add .
   git commit -m "fix: descrição do hotfix"
   ```

3. Push e abra PR para `main`:
   ```
   git push -u origin hotfix/X.Y.Z
   ```

4. Após merge do PR em `main`, crie a tag:
   ```
   git checkout main
   git pull origin main
   git tag -a vX.Y.Z -m "Hotfix vX.Y.Z"
   git push origin main --tags
   ```

5. Merge em `develop`:
   ```
   git checkout develop
   git merge --no-ff hotfix/X.Y.Z
   git push origin develop
   ```

6. Delete a branch de hotfix:
   ```
   git branch -d hotfix/X.Y.Z
   git push origin --delete hotfix/X.Y.Z
   ```

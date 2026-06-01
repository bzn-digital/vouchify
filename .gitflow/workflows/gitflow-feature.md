---
description: GitFlow Feature - criar branch de feature a partir de develop
---

## GitFlow Feature Workflow

1. Certifique-se de estar na branch `develop` e atualizada:
   ```
   git checkout develop
   git pull origin develop
   ```

2. Crie a branch de feature:
   ```
   git checkout -b feature/nome-da-feature
   ```

3. Desenvolva a funcionalidade com commits convencionais:
   ```
   git add .
   git commit -m "feat: descrição da feature"
   ```

4. Push e abra Pull Request para `develop`:
   ```
   git push -u origin feature/nome-da-feature
   ```

5. Após merge do PR, delete a branch local e remota:
   ```
   git checkout develop
   git pull origin develop
   git branch -d feature/nome-da-feature
   git push origin --delete feature/nome-da-feature
   ```

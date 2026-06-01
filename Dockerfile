# Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copia arquivos de projeto e restaura dependências
COPY *.csproj Directory.Build.props* ./
RUN dotnet restore

# Copia o restante e faz o build
COPY . .
RUN dotnet publish -c Release -o /app/publish --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# Segurança: não rodar como root
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
USER appuser

COPY --from=build /app/publish .

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

EXPOSE 8080

ENTRYPOINT ["dotnet", "Vouchify.dll"]

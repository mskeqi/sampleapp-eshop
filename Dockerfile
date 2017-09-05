# Stage 1
FROM microsoft/aspnetcore-build:1.1.2 AS builder
WORKDIR /source

# copies and restore
COPY . .
RUN dotnet restore src/Web/WebMVC/WebMVC.csproj
RUN dotnet publish src/Web/WebMVC/WebMVC.csproj --output /app/

# Stage 2
FROM microsoft/aspnetcore:1.1.2
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "WebMVC.dll"]


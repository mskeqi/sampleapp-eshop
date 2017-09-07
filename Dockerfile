# Stage 1
FROM microsoft/aspnetcore-build:1.1.2
WORKDIR /source

# copies and restore
COPY . .
RUN dotnet restore src/Web/WebMVC/WebMVC.csproj
RUN dotnet publish src/Web/WebMVC/WebMVC.csproj --output /app/

# Stage 2
FROM microsoft/aspnetcore:1.1.2
WORKDIR /app
COPY --from=0 /app .
ENTRYPOINT ["dotnet", "WebMVC.dll"]


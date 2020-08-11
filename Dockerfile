
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build
WORKDIR /app

COPY . .

RUN cp ./DOKKU_SCALE ./app
RUN cp ./CHECKS ./app
RUN dotnet restore
RUN dotnet publish -c Release -o build --no-restore

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 as runtime

WORKDIR /app

COPY --from=build /app/build .

ENTRYPOINT ["dotnet", "zhalmakh-testing.dll"]

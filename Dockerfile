FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base
WORKDIR /src
COPY *.sln .
# copy and restore all projects
COPY Calculations/*.csproj Calculations/
RUN dotnet restore Calculations/*.csproj
COPY Calculations.Tests/*.csproj Calculations.Tests/
RUN dotnet restore Calculations.Tests/*.csproj
# Copy everything else
COPY . .
#Testing
FROM base AS testing
WORKDIR /src/Calculations
RUN dotnet build
#WORKDIR /src/Calculations.Tests
WORKDIR /src/Calculations.Tests
RUN dotnet test

#Publishing
FROM base AS publish
WORKDIR /src/Calculations
RUN dotnet publish -c Release -o /src/publish

#Get the runtime into a folder called app
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=publish /src/publish .
#ENTRYPOINT ["dotnet", "Calculations.Demo.dll"]
CMD ASPNETCORE_URLS=http://*:$PORT dotnet Calculations.dll
    
    
 
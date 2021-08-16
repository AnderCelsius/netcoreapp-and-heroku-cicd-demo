#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base
WORKDIR /src
COPY *.sln .
COPY Calculations/*.csproj Calculations/
RUN dotnet restore Calculations/*.csproj
COPY Calculations.Tests/*.csproj Calculations.Tests/
RUN dotnet restore Calculations.Tests/*.csproj
COPY . .

#Testing
FROM base AS testing
WORKDIR /src/Calculations
RUN dotnet build 
WORKDIR /src/Calculations.Tests
RUN dotnet test 

#Publishing
FROM base AS publish
WORKDIR /src/Calculations
RUN dotnet publish -c Release -o /src/publish


#Get the run time into a folder called app
FROM mcr.microsoft.com/dotnet/runtime:5.0 AS runtime
WORKDIR /app
COPY --from=publish /src/publish .
#ENTRYPOINT ["dotnet", "Calculations.dll"]
CMD ASPNETCORE_URLS=http://*:$PORT dotnet Calculations.dll
FROM vnd.nexus.lisec.internal/lisec/dotnet/sdk:8.0-alpine AS buildenv
ARG MinVerBuildMetadata
# set build metadata for MinVer
ENV MinVerBuildMetadata=$MinVerBuildMetadata
COPY . /code/
WORKDIR /code/
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages,sharing=shared dotnet build *.Library -c Release -o output
RUN echo "MinVerBuildMetadata=$MinVerBuildMetadata"
RUN ls -la ./output

FROM buildenv AS testruntime
WORKDIR /code/
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages,sharing=shared dotnet test --logger "trx;LogFileName=unit_tests.xml" --collect:"XPlat Code Coverage" --settings coverlet.runsettings -o output || echo "There were failing tests!"

FROM scratch as testresult
COPY --from=testruntime /code ./

FROM buildenv AS packruntime
ARG NUGET_KEY
ARG NUGET_URL=https://nexus.lisec.internal/repository/nuget/
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages,sharing=shared dotnet pack *.Library -c Release -o output
RUN --mount=type=cache,id=nuget,target=/root/.nuget/packages,sharing=shared dotnet nuget push output/*.nupkg -s $NUGET_URL -k $NUGET_KEY

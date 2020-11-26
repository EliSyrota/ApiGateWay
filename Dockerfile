#Build image
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

ARG Version=1.0.0

WORKDIR /app

COPY . ./
RUN dotnet publish -c Release -p:PublishDir=.\out

#Runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app

COPY start.sh ./
RUN chmod +x start.sh

COPY --from=build /app/src/IMS.ApiGateway/.out ./api-gateway
COPY --from=build /app/src/IMS.ApiGateway.Identity/.out ./identity-api
COPY --from=build /app/src/IMS.ApiGateway.GrpcApi/.out ./grpc-api
COPY --from=build /app/src/IMS.ApiGateway.PlatformApi/.out ./platform-api
COPY --from=build /app/src/IMS.ApiGateway.SignalRApi/.out ./signalr-api
ENV ASPNETCORE_URLS http://0.0.0.0:5000/
EXPOSE 5000

ENTRYPOINT ["bash", "start.sh"]
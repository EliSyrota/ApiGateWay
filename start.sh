#!/bin/sh
set -e
case $1 in
     platform-api)
          cd platform-api #this is necessary for dotnet to set correct ContentRootPath
          dotnet IMS.ApiGateway.PlatformApi.dll #/connection=$2
          ;;
     grpc-api)
          cd grpc-api #this is necessary for dotnet to set correct ContentRootPath
          dotnet IMS.ApiGateway.GrpcApi.dll #/connection=$2
          ;;
     signalr-api)
          cd signalr-api #this is necessary for dotnet to set correct ContentRootPath
          dotnet IMS.ApiGateway.SignalRApi.dll #/connection=$2
          ;;
     identity-api)
          cd identity-api #this is necessary for dotnet to set correct ContentRootPath
          dotnet IMS.ApiGateway.Identity.dll #/connection=$2
          ;;
     api-gateway)
          cd api-gateway #this is necessary for dotnet to set correct ContentRootPath
          dotnet IMS.ApiGateway.dll #/connection=$2
          ;;
     *)
          #cd api #this is necessary for dotnet to set correct ContentRootPath
          #dotnet IMS.ApiGateway.dll
          exit 1
          ;;
esac
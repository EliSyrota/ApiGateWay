# ApiGateway 

**STAGE:** MVP in progress

## How it works?

### Run infrastructure
1. Install [Consul](https://www.consul.io/docs/install)
2. Run it one 
3. Explore http://localhost:8500/

NOTE: you can run Consul in Docker as well ```docker-compose up consul``` 

### Run Services - Using Visual Studio
1. Choose Multiple Startup 
2. Select IMS.ApiGateway
3. Select IMS.ApiGateway.Identity
4. Select IMS.ApiGateway.PlatformApi
5. Select IMS.ApiGateway.GrpcApi
6. Select IMS.ApiGateway.SignalRApi
7. Run Tests 

### Run Everything - Using Docker 
1. ```docker-compose up --build```
2. ```dotnet test```
3. ```docker-compose down```

## Summary 
ApiGateway is [bastion-host](https://en.wikipedia.org/wiki/Bastion_host) / service between Internet (Customer's Network) and Private SCD Network.

## Base case

![Base case image](docs/BaseCaseApiGateway.jpg)

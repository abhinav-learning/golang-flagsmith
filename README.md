# Flagsmith Golang Project

## Tools used
- [Task](https://taskfile.dev)
- [Redis](https://redis.io/)
- [Docker](https://www.docker.com/)
- [Flagsmith](https://www.flagsmith.com/)
- [Golang](https://go.dev/)

## Setup Steps

### Local Setup
- Clone the Repo
- run `go mod tidy` to install deps
- create `.env` file to create the following environment variables in local
```shell
REDIS_URL=localhost:6379
PORT=8080
RATE_LIMIT=10
FLAGSMITH_ENVIRONMENT_KEY=ser.ZRd***********469
```
- run `task up` to bring up the local redis cluster
- run `task local` to open the local gin server

### Docker Setup

- Follow the above steps
- run `task db` to build the docker image
- run `task dr` to run the local docker image

## References
- https://www.freecodecamp.org/news/build-a-flexible-api-with-feature-flags-using-open-source-tools/#heading-conclusion

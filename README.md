# Misakai.Dotnet
A simple way of deploying a .NET Core application inside a docker container. The simple deploy script pulls the code from a GIT repository specified using an environment variable `APP_REPO`.

In order to configure the docker container, set the following environment variables
```bash
# APP_REPO: The git clone URL which contains
# APP_PATH: (optional) The path of the application to start
```

The docker image is built here: https://hub.docker.com/r/misakai/dotnet/
# solana-anchor-react-docker
Solana x Anchor x React in Docker.

## Enviornment
- Debian Buster Slim
- Rust latest
- Solana CLI v 1.8.5
- Node latest
- npm latest
- n latest
- Anchor CLI latest
- React latest

## Notice
Please version up to latest all. Expecially Solana CLI.
[Install the Solana Tool Suite](https://docs.solana.com/cli/install-solana-cli-tools)

## Setup
1. DL this code.

2. Run docker. Make sure running Docker Desktop.
```
$ docker-compose up
```

3. Get docker app name.
```
$ docker-compose ps
NAME                           COMMAND             SERVICE             STATUS              PORTS
solana-anchor-react-docker-app-1   "bash"              app                 exited (137)
```

4. Connect to Docker.
```
$ docker container exec -it solana-anchor-react-docker-app-1 bash
```
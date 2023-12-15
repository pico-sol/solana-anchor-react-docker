# solana-anchor-react-docker
Solana x Anchor x React in Docker.

## Enviornment
- ubuntu:20.04
- Rust latest
- Solana CLI v 1.16.23
- Node latest
- npm latest
- n latest
- Anchor CLI latest
- React latest

## Notice
Please version up to latest all. Especially Solana CLI.
[Install the Solana Tool Suite](https://docs.solana.com/cli/install-solana-cli-tools)

## Run Docker
1. DL this and moving to DL directory.

2. Run Docker. Make sure running Docker Desktop before it.
```
% docker compose up -d
```

3. Check running App in Docker Desktop.

## Connecting to Docker
Get Docker NAME.
```
% docker compose ps
NAME                               IMAGE                            COMMAND       SERVICE   CREATED          STATUS          PORTS
solana-anchor-react-docker-app-1   solana-anchor-react-docker-app   "/bin/bash"   app       XX seconds ago   Up XX seconds   
```

If you get "no configuration file provided: not found" error, you are wrong directory. You need to be in DL directory.

Connecting to Docker.
% docker exec -it [NAME] bash
```
% docker container exec -it solana-anchor-react-docker-app-1 bash
```

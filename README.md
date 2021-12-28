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
Please version up to latest all. Especially Solana CLI.
[Install the Solana Tool Suite](https://docs.solana.com/cli/install-solana-cli-tools)

## Run Docker
1. DL this and moving to DL directory.

2. Run Docker. Make sure running Docker Desktop before it.
```
% docker-compose up -d
```

3. Check running App in Docker Desktop.

## Connecting to Docker
Get Docker NAME.
```
% docker-compose ps
NAME                                    COMMAND             SERVICE             STATUS              PORTS
solana-anchor-react-docker-main_app_1   "bash"              app                 running             0.0.0.0:3000->3000/tcp
```

If you get "no configuration file provided: not found" error, you are wrong directory.  

Connecting to Docker.
% docker container exec -it [NAME] bash
```
% docker container exec -it solana-anchor-react-docker-main_app_1 bash
```

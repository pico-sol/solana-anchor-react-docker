FROM debian:buster-slim

WORKDIR /usr/src/app
COPY . .

#--- Base Command ---
RUN echo 'alias ll="ls -la"' >> ~/.bashrc
RUN echo 'alias ll="ls -la"' >> ~/.zshenv

#--- Update & Install Base Packages ---
RUN apt update
RUN apt install -y curl
RUN apt install -y vim
RUN apt install -y iputils-ping
RUN apt install -y git-all
RUN apt install -y zsh
RUN apt install -y wget

#--- Setup Rust ---
# Following arguments(sh -s -- -y) skip for prompt.
# [details] https://forge.rust-lang.org/infra/other-installation-methods.html#other-ways-to-install-rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Use ENV instead of source, export and dot command.
ENV PATH="/root/.cargo/bin:${PATH}"
RUN ["/bin/bash", "-c", "source $HOME/.cargo/env"]
RUN rustup component add rustfmt

#--- Install Solana ---
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.9.2/install)"
# Use ENV instead of source, export and dot command.
ENV PATH="/root/.local/share/solana/install/active_release/bin:${PATH}"

#--- Install Node ---
RUN apt install -y nodejs

RUN apt install -y npm
RUN npm install -g n
RUN n latest
RUN ln -sf /usr/local/bin/node /usr/bin/node

RUN npm install -g yarn
# for "error:0308010C:digital envelope routines::unsupported" error
ENV NODE_OPTIONS=--openssl-legacy-provider

#--- Install Anchor ---
RUN npm i -g @project-serum/anchor-cli
RUN npm i -y mocha

#--- Install React ---
RUN npm install -g create-react-app

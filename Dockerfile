FROM debian:buster-slim

WORKDIR /usr/src/app
COPY . .

#--- Update & Install Base Packages ---
RUN apt update
RUN apt -y install curl
RUN apt -y install expect

#--- Setup Rust ---
# Following arguments(sh -s -- -y) skip for prompt.
# [details] https://forge.rust-lang.org/infra/other-installation-methods.html#other-ways-to-install-rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Use ENV instead source or dot command.
ENV PATH="/root/.cargo/bin:${PATH}"
RUN ["/bin/bash", "-c", "source $HOME/.cargo/env"]
RUN echo $PATH
RUN rustup component add rustfmt

#--- Install Solana ---
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.8.0/install)"
RUN export PATH=/root/.local/share/solana/install/active_release/bin:$PATH

#--- Install Node, npm, Yarn ---
RUN apt install -y nodejs npm
RUN npm install -g yarn

#--- Install Anchor ---
RUN npm i -g @project-serum/anchor-cli

#--- Install React ---
RUN npm install -g create-react-app

FROM debian:buster-slim

WORKDIR /usr/src/app
COPY . .

#--- Base Command ---
RUN echo 'alias ll="ls -la"' >> ~/.bashrc

#--- Update & Install Base Packages ---
RUN apt update
RUN apt -y install curl
RUN apt -y install vim

#--- Setup Rust ---
# Following arguments(sh -s -- -y) skip for prompt.
# [details] https://forge.rust-lang.org/infra/other-installation-methods.html#other-ways-to-install-rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Use ENV instead of source, export and dot command.
ENV PATH="/root/.cargo/bin:${PATH}"
RUN ["/bin/bash", "-c", "source $HOME/.cargo/env"]
RUN rustup component add rustfmt

#--- Install Solana ---
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.8.0/install)"
# Use ENV instead of source, export and dot command.
ENV PATH="/root/.local/share/solana/install/active_release/bin:${PATH}"

#--- Install Node ---
RUN apt install -y nodejs

RUN apt install -y npm
RUN npm install -g n
RUN n latest
RUN ln -sf /usr/local/bin/node /usr/bin/node

RUN npm install -g yarn

#--- Install Anchor ---
RUN npm i -g @project-serum/anchor-cli

#--- Install React ---
RUN npm install -g create-react-app

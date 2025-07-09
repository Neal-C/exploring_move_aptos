# I take no responsibility for bloated Docker images. Proceed at your own risk :)
FROM ubuntu AS aptos

RUN apt-get update && apt-get install -y curl git
# This will likely break
RUN curl -fsSL "https://aptos.dev/scripts/install_cli.sh" | bash
ENV PATH=$PATH:/root/.local/bin/
WORKDIR /app
COPY . .
CMD ["aptos", "move", "test", "--named-addresses", "exploring_move_aptos=0x1cecfef9e239eff12fb1a3d189a121c37f48908d86c0e9c02ec103e0a05ddebb"]
FROM python:3.12-slim

RUN apt-get update && apt-get install -y curl

WORKDIR /app

ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"

RUN curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash

COPY . .
RUN rye sync --no-dev --no-lock

CMD ["rye", "run", "server"]

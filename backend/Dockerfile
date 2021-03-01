FROM alpine:3.13.2

RUN apk update && \
apk add bash rustup gcc musl-dev && \
rustup-init -y

ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /loginsrv/backend

RUN rustup default nightly && rustup update

CMD ["/loginsrv/backend/docker_entrypoint.sh"]

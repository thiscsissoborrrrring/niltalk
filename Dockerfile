FROM alpine:latest AS deploy
WORKDIR /niltalk
COPY niltalk .
COPY config.toml /static/config.toml
ENTRYPOINT [ "./niltalk" ]

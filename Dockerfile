FROM alpine:latest

COPY ./content /workdir/

RUN apk add --no-cache curl caddy jq runit apache2-utils tzdata ttyd \
    && wget -qO - https://github.com/rclone/rclone-webui-react/releases/download/v2.0.5/currentbuild.zip | busybox unzip -qd /workdir/rcloneweb - \
    && wget -qO - https://github.com/bastienwirtz/homer/releases/latest/download/homer.zip | busybox unzip -qd /workdir/homer - \
    && chmod +x /workdir/service/*/run /workdir/service/*/log/run /workdir/*.sh \
    && /workdir/install.sh \
    && ln -s /workdir/service/* /etc/service/

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]

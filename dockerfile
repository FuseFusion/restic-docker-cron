FROM alpine:latest
RUN apk add --no-cache tzdata

COPY ./entry.sh /usr/bin/entry
RUN chmod +x /usr/bin/entry

COPY ./backup.sh /usr/bin/backup
RUN chmod +x /usr/bin/backup

ENV CRON_BACKUP=""
ENV TZ=""
ENV BACKUP_PATH=""
ENV RESTIC_REPOSITORY=""
ENV RESTIC_PASSWORD=""
ENV RESTIC_TAG=""
ENV RESTIC_COMPRESSION="auto"
ENV RESTIC_REST_USERNAME=""
ENV RESTIC_REST_PASSWORD=""
ENV AWS_SECRET_ACCESS_KEY=""
ENV AWS_ACCESS_KEY_ID=""

COPY --from=restic/restic:0.17.2 /usr/bin/restic /usr/bin/restic
RUN chmod +x /usr/bin/restic

ENTRYPOINT [ "/bin/sh","/usr/bin/entry" ]
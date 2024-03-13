FROM alpine:3.19

RUN apk add                     \
    bash                        \
    mc                          \
    openldap                    \
    openldap-clients            \
    openldap-back-mdb           #

COPY bin/backup /bin/backup
COPY bin/restore /bin/restore
COPY bin/cleanup /bin/cleanup
COPY bin/rebuild-config /bin/rebuild-config

ADD ["sbin/boot.sh", "/sbin/"]
ENTRYPOINT ["/bin/bash", "/sbin/boot.sh"]

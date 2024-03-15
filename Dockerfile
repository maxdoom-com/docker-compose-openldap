FROM alpine:3.19

RUN apk add                     \
    bash                        \
    mc                          \
    openldap                    \
    openldap-clients            \
    openldap-back-mdb           #

COPY bin/* /bin/

ADD ["sbin/boot.sh", "/sbin/"]
ENTRYPOINT ["/bin/bash", "/sbin/boot.sh"]

FROM alpine

ADD start-container.sh /usr/bin/start-container
RUN chmod +x /usr/bin/start-container
ARG SOME_VALUE=devault_value
RUN echo "wow look at that ------------------------------------------------> $SOME_VAL"

ENTRYPOINT ["start-container"]

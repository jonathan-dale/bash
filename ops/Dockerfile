FROM ubuntu

# let people know how this container was built:
ADD ./Dockerfile /Dockerfile


# this is a simple docker file that adds start-container.sh
# modify start-container.sh to start daemons or run command passed in as args to 'docker run ...'
# To build container: 'docker build -t my-container .'
# To run container:   'docker run -it --rm my-container' and look for the output of start-container.sh

ADD start-container.sh /usr/bin/start-container
RUN chmod +x /usr/bin/start-container

ENTRYPOINT ["start-container"]

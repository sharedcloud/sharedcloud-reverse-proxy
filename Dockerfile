FROM nginx:1.15.5-alpine

RUN apk add --update bash

RUN mkdir /files/
WORKDIR /files/
ADD . /files/

EXPOSE 80

# Important: You still need to pass the following environmental vars:
# - ENVIRONMENT
# Furthermore, you need to link the following containers:
# - sharedcloud
# - tunnel-manager
# - wordpress

CMD ["./run.sh"]
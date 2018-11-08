# Sharedcloud-reverse-proxy

Reverse proxy in charge of redirecting requests to different endpoints.

### Use

The following ENV vars need to be passed when creating the Docker container:

* `ENVIRONMENT`: Describes the environment where the container is going to be installed.
You can choose between the following environments: `development`, `staging` and `production`.

Note 1: You will need to link the following containers: `wordpress` and `sharedcloud`
Note 2: In `production` and `staging` environments, you will need to link the ssl certificates.
```
>>> docker build . -t sharedcloud-reverse-proxy

>>> docker run --rm --name sharedcloud-reverse-proxy -e ENVIRONMENT=production \
                                                     -v ${SCRIPTPATH}/certs:/etc/nginx/certs:ro \  # Only on Staging and Production
                                                     -p 80:80 \
                                                     -p 443:443 \  # Only on Staging or Production
                                                     --link wordpress:wordpress \
                                                     --link sharedcloud:sharedcloud \
                                                     -d sharedcloud-reverse-proxy
```
FROM nginx:1.21

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y apache2-utils

# Replace nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

COPY setup.sh setup.sh

CMD ["/bin/bash", "setup.sh"]
 #!/bin/bash

if [[ -z "${MLFLOW_TRACKING_USERNAME}" ]]; then
    echo "Error: MLFLOW_TRACKING_USERNAME not set"
    exit 1  
fi

if [[ -z "${MLFLOW_TRACKING_PASSWORD}" ]]; then
    echo "Error: MLFLOW_TRACKING_PASSWORD not set"
    exit 1  
fi

htpasswd -b -c /etc/nginx/.htpasswd ${MLFLOW_TRACKING_USERNAME} ${MLFLOW_TRACKING_PASSWORD}

exec nginx -g "daemon off;"
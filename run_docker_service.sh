#/bin/bash
docker run --env-file="./.env" -p 0.0.0.0:6969:6969 -d alfonstore

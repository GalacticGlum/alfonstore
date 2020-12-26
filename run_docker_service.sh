#/bin/bash
# Load environment variables from .env
if [ -f .env ]
then
	export $(cat .env | sed 's/#.*//g' | xargs -0)
fi

# TODO: Fix this! Hard coding db url probably not a good idea.
docker run --env-file="./.env" -p 0.0.0.0:6969:6969 \
	--env DATABASE_URL="postgres://alfonstore:saleor@136.243.107.6:5432/saleor" \
	--mount type=bind,source="$SSL_CERTFILE",target="$SSL_CERTFILE" \
	--mount type=bind,source="$SSL_KEYFILE",target="$SSL_KEYFILE" \
	-d alfonstore

# Clear environment variables
if [ -f .env ]
then
	unset $(cat .env | sed 's/#.*//g' | xargs -0 | sed 's/=.*//')
fi

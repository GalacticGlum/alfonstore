#/bin/bash
# TODO: Fix this! Hard coding db url probably not a good idea.
docker run --env-file="./.env" -p 0.0.0.0:6969:6969 \
	--env DATABASE_URL="postgres://alfonstore:saleor@136.243.107.6:5432/saleor" \
	-d alfonstore

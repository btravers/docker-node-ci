#! /bin/sh

echo "@fonciastark:registry=https://${NPM_REGISTRY_URL}/" > ~/.npmrc
echo "//${NPM_REGISTRY_URL}/:_authToken=${NPM_REGISTRY_TOKEN}" >> ~/.npmrc

exec "$@"

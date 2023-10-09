#!/bin/bash

# set default nginx FQDN
BASE_URL=${BASE_URL:-'nginx.abcdesktop.svc.cluster.local'}

# run createdesktop_implicit.postman_collection.json

for f in "postman-collections/*.json" do 
  echo "Running collection $f"
  newman run --env-var "base_url=$BASE_URL" $f
done"

#!/bin/bash


BASE_URL=${BASE_URL:-'nginx.abcdesktop.svc.cluser.local'}

# run createdesktop_implicit.postman_collection.json
newman run --env-var "base_url=$BASE_URL" postman-collections/createdesktop_implicit.postman_collection.json

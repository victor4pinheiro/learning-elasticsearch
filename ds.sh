#!/bin/sh

docker compose up -d
docker cp elasticsearch:/usr/share/elasticsearch/config/certs/http_ca.crt hurl/
docker cp elasticsearch:/usr/share/elasticsearch/config/certs/http_ca.crt .

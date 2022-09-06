#!/usr/bin/env bash

echo "Something failed in the release pipeline, sending alert"

curl 'https://events.pagerduty.com/v2/enqueue' \
  --data-raw "{\"payload\":{\"summary\":\"CLI Release failed on tests\",\"severity\":\"warning\",\"source\":\"CircleCI\"},
  \"routing_key\":\"${PD_ROUTING_KEY}\",\"event_action\":\"trigger\"}"

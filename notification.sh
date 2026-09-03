#!/bin/bash

TELEGRAM_TOKEN=$(jq -r '.telegram_token' /etc/gitlab-runner/tg_conf.json)
TELEGRAM_CHAT_ID=$(jq -r '.telegram_chat_id' /etc/gitlab-runner/tg_conf.json)

URL="https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage"
TEXT="Project: [ ${CI_PROJECT_NAME} ] "$'\n'"Job:  [ ${CI_JOB_NAME} ]"$'\n'"Status:  [ ${CI_JOB_STATUS} ]"$'\n'"check it: ${CI_JOB_URL}"

curl curl --resolve api.telegram.org:443:149.154.167.220 -s -X POST "$URL" \
  -d chat_id="${TELEGRAM_CHAT_ID}" \
  -d text="${TEXT}"
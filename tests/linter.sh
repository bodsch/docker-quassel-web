#!/bin/bash

HADOLINT_VERSION='1.16.3'
HADOLINT_PATH='/usr/local/bin/hadolint'

if ! [[ -e "${HADOLINT_PATH}_${HADOLINT_VERSION}" ]]
then
  sudo curl \
    --silent \
    --location \
    --output "${HADOLINT_PATH}_${HADOLINT_VERSION}" \
    "https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64"
  sudo chmod +x "${HADOLINT_PATH}_${HADOLINT_VERSION}"
  sudo ln -sf ${HADOLINT_PATH}_${HADOLINT_VERSION} ${HADOLINT_PATH}
fi

hadolint Dockerfile

shellcheck \
  --shell=sh \
  --external-sources \
  --exclude=SC1091,SC2039,SC2086 \
  rootfs/init/*.sh

  #--exclude=SC1091,SC2039,SC2164,SC2002,SC2181,SC2086,SC2046,SC1117 \

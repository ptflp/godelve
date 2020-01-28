#!/bin/bash

if [ -z "$CONFIG_FILE" ]
then
  echo "No config file specified"
else
      CONFIG_FILE="-- $CONFIG_FILE"
fi

export CONFIG_FILE

exec "$@"
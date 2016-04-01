#!/bin/bash

VOLUME=/sql-src
NEW_USER=container-user
NEW_GROUP=$NEW_USER
NEW_UID=$(stat -c "%u" $VOLUME)
NEW_GID=$(stat -c "%g" $VOLUME)

getent group $NEW_GID
[ $? -gt 0 ] && groupadd --gid $NEW_GID $NEW_GROUP
getent passwd $NEW_UID 
[ $? -gt 0 ] && useradd -M --home $VOLUME --uid $NEW_UID --gid $NEW_GID $NEW_USER

COMMAND=$1
if [ "$COMMAND" == "" ]
then
  exec su $NEW_USER
else
  echo "subommand $COMMAND $@"
  shift
  echo "subommand $COMMAND $@"
  exec su $NEW_USER -c "/usr/local/bin/${COMMAND} $(printf " %q" "$@")"
fi
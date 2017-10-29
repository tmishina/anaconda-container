#! /bin/sh

CONTAINER_NAME='anaconda3'
. ./image_name.sh
CONTAINER_PORT_TO_EXPORT=8888
HOST_PORT_FOR_CONTAINER=8888

if [ $# -ge 1 ]; then
  port=$1
else
  port=${CONTAINER_PORT_TO_EXPORT}
fi
command=
if [ $# -eq 2 ]; then
  command="$2"
fi

type gawk > /dev/null 2>&1
result=$?
if [ $result -eq 0 ]; then
  awk='gawk'
else
  awk='awk'
fi

docker ps | grep ${CONTAINER_NAME} > /dev/null
if [ $? -eq 0 ] ; then
  docker ps | grep ${CONTAINER_NAME} | ${awk} '{print $1}' | while read container; do docker kill ${container}; done
  echo "existing ${CONTAINER_NAME} container has been killed."
fi
docker rm ${CONTAINER_NAME} > /dev/null
docker run --name ${CONTAINER_NAME} -d -h ${CONTAINER_NAME} -v ${PWD}:/host:rw -p ${HOST_PORT_FOR_CONTAINER}:${port} ${IMAGE_NAME} ${command}


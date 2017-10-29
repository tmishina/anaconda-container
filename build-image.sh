#! /bin/sh

. ./image_name.sh

while getopts c OPT
do
    case $OPT in
        c)  CLEAN='--no-cache=true'
            ;;
    esac
done

shift $((OPTIND - 1))

docker build ${CLEAN} -t ${IMAGE_NAME} .


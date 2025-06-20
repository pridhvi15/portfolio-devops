#!/bin/bash
if [ -n $(docker ps -a -q) ]; then
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker run -d -p 80:80 pridhvi15/pridhviportfolio:$1
else
docker run -d -p 80:80 pridhvi15/pridhviportfolio:$1
fi

echo "Deployment Succesful"
# rm for remove the intermediate container
docker rmi --force postgres:ch
docker build --rm=true -t postgres:ch .

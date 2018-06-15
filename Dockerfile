# docker build --force-rm=true -t romach007/front:latest .
# docker push romach007/front:latest
# docker service create \
#    --name front \
#    --mount type=volume,source=front,destination=/front \
#    --with-registry-auth romach007/front:latest
FROM alpine:3.7
# build from sources is ommited
ADD newApp /newApp
CMD cp -a /newApp/. /front/ && tail -f /dev/null

#docker service create \
#  --mode=global \
#  --publish mode=host,target=80,published=8080 \
#  --name nginx \
#  --mount type=volume,source=front,destination=/usr/share/nginx/html \
#  nginx:latest

# docker service update --image romach007/front:latest front
# docker run --rm -v front:/front romach007/front:latest
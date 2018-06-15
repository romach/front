# front
sample front repository

```
docker build --force-rm=true -t romach007/front:latest .
docker push romach007/front:latest
```

Create 2 Docker Swarm nodes then run:

```
docker service create \
    --mode=global \
    --name front \
    --mount type=volume,source=front,destination=/front \
    --with-registry-auth romach007/front:latest
```
```
docker service create \
  --mode=global \
  --publish mode=host,target=80,published=8080 \
  --name nginx \
  --mount type=volume,source=front,destination=/usr/share/nginx/html \
  nginx:latest
```
Change something in `newApp/imdex.html`.
Build and push image.
```
docker build --force-rm=true -t romach007/front:latest .
docker push romach007/front:latest
```
Update front service
```
docker service update --image romach007/front:latest front
```
Content on all nginx nodes will change.

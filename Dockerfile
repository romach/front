FROM alpine:3.7
# build from sources is ommited
ADD newApp /newApp
CMD cp -a /newApp/. /front/ && tail -f /dev/null

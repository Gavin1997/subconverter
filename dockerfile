# you can save the files you want to replace to a folder, then copy it into to the docker
# using the latest build of the official docker
FROM tindy2013/subconverter:latest
# assume your files are inside replacements/
# subconverter folder is located in /base/, which has the same structure as the base/ folder in the repository
COPY replacements/ /base/
# expose internal port
EXPOSE 25500
# notice that you still need to use '-p 25500:25500' when starting the docker to forward this port

# build with this Dockerfile and tag it subconverter-custom
# docker build -t subconverter-custom:latest .
# run the docker detached, forward internal port 25500 to host port 25500
# docker run -d --restart=always -p 25500:25500 subconverter-custom:latest
# then check its status
# curl http://localhost:25500/version
# if you see `subconverter vx.x.x backend` then the container is up and running
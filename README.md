Battle.net games in Docker
==========================

This Dockerfile allows you to run Battle.net and play games with wine in an unprivileged container running in a standard Gnome desktop session.

Build
-----
`$ docker build . -t docker-battlenet`

Use
---

Create once with:

```
$ docker create \
    --name battlenet \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -e DISPLAY=$DISPLAY \
    --device /dev/dri \
    -v /share:/share \
    docker-battlenet
```

Then run it each time with:

```
$ docker start battlenet
```

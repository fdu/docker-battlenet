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

Use on a remote VM through VNC with mediated GPU passthrough
------------------------------------------------------------

Follow the instructions to setup [mediated GPU passthrough (GVT-g)](https://github.com/intel/gvt-linux/wiki/GVTg_Setup_Guide) the pass those extra arguments to Docker create : `-e MESA_LOADER_DRIVER_OVERRIDE=i965 --privileged --ipc=host`.

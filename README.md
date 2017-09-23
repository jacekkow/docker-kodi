To start Kodi from this Docker image, run:

```
#!/bin/bash
XAUTH=/tmp/.docker-xauth
touch "${XAUTH}"
xauth nlist "${DISPLAY}" | sed -e 's/^..../ffff/' | xauth -f "${XAUTH}" nmerge -
docker run -i -t --rm \
	\
	--device /dev/dri \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v "${XAUTH}:${XAUTH}" \
	-e "DISPLAY=${DISPLAY}" \
	-e "XAUTHORITY=${XAUTH}" \
	--group-add video \
	\
	--device /dev/snd \
	-v /dev/shm:/dev/shm \
	-v /run/dbus:/run/dbus \
	--group-add audio \
	\
	-v /home/kodi/.kodi:/home/kodi/.kodi \
	--name kodi \
	--user kodi \
	jacekkow/kodi \
	kodi
```

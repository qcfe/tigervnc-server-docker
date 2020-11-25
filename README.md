# tigervnc-server-docker
### Docker image for a TigerVNC server + fluxbox session

## Usage
`docker run -p 8080:80 --name novnc qcfe/novnc-c-websockify-nginx`
`docker build . --tag tigervnc-server-docker`
`docker run -v /tmp/virt_x_dir:/tmp/.X11-unix -it --rm --network container:novnc tigervnc-server-docker`

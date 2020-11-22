# tigervnc-server-docker
### Docker image for a TigerVNC server + fluxbox session

## Usage
`docker build . --tag tigervnc-server-docker`
`docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -p 5900:5900 -it --rm`

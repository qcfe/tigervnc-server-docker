FROM ubuntu:20.04

ARG USER=vncuser

### Connection ports
ENV DISPLAY=:0 \
    USER=${USER} \
    DEBIAN_FRONTEND=noninteractive

### Installing required softwares & cleanup
RUN apt-get update && \
    apt-get install -y \
        fluxbox \
        tigervnc-standalone-server && \
    apt-get --purge autoremove -y && \
    apt-get autoclean -y

EXPOSE 5900

RUN useradd -ms /bin/bash $USER

ENV HOME=/home/$USER

COPY --chown=${USER}:${USER} startup.sh $HOME/startup.sh
COPY --chown=${USER}:${USER} fluxbox $HOME/.fluxbox
COPY Xvnc-session /etc/X11/Xvnc-session

CMD chown -R ${USER}:${USER} /tmp/.X11-unix && \
    rm -rfv /tmp/.X*-lock ;\
    su -p $USER -c "cd && bash ./startup.sh"

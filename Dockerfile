FROM alpine:3.7                                                                                  
RUN apk add --no-cache bash git unzip curl wget python3 py3-pip python3-dev ca-certificates      
RUN cd /tmp \  
 && git clone https://github.com/ahmetb/kubectx.git ~/.kubectx \
 && COMPDIR=$(pkg-config --variable=completionsdir bash-completion) \
 && ln -sf ~/.kubectx/completion/kubens.bash $COMPDIR/kubens \
 && ln -sf ~/.kubectx/completion/kubectx.bash $COMPDIR/kubectx \
 && cat << FOE >> ~/.bashrc \
 && export PATH=~/.kubectx:\$PATH \
 && FOE
ENTRYPOINT ["sleep"]

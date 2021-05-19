FROM alpine:3.7                                                                                  
RUN apk add --no-cache bash git unzip curl wget python3 py3-pip python3-dev ca-certificates      
RUN cd /tmp \                                                                                    
 && git clone https://github.com/ahmetb/kubectx \                                                
 && cd kubectx \                                                                                 
 && mv kubectx /usr/local/bin/kctx \                                                             
 && mv kubens /usr/local/bin/kns \                                                               
 && mv completion/*.bash $COMPLETIONS \                                                          
 && cd .. \ 
 && bash $COMPLETIONS/kubectx \
 && bash $COMPLETIONS/kubens
ENTRYPOINT ["sleep"]

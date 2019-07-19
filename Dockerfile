FROM ethereum/solc:nightly-alpine
RUN apk update && apk upgrade \
    && apk add -t .gyp --no-cache yarn g++ make 
RUN apk add git python python3 vim curl \
	&& apk add openjdk11-jre \
    && apk add geth \
    && apk add nodejs && apk add npm
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
RUN yarn add web3 --dev \
    && npm install -g truffle@3.2.x && apk del .gyp \
    && npm i -g ganache-cli \
    && npm i -g @angular/cli && npm install -g create-react-app
RUN mkdir -p /home/scrapbook/tutorial
ENV HOME=/home/scrapbook/tutorial
WORKDIR /home/scrapbook/tutorial
ENTRYPOINT ["/bin/sh"]
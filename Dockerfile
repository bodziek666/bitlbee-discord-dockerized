FROM alpine:3.7
RUN apk add --no-cache bitlbee bitlbee-dev autoconf automake libtool make gcc build-base git && \
  git clone https://github.com/sm00th/bitlbee-discord.git && \
  ln -s /usr/share/bitlbee /usr/local/share && \
  cd /bitlbee-discord && ./autogen.sh && \
  ./configure && \
  make && \
  make install && \
  libtool --finish /usr/lib/bitlbee && \
  apk del --no-cache autoconf automake libtool make gcc build-base git && \
  rm -rf /bitlbee-discord
EXPOSE 6667
CMD ["/usr/sbin/bitlbee", "-D", "-n", "-i", "0.0.0.0"]

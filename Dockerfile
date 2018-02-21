FROM debian:stretch-slim
RUN apt-get update && apt-get install -y bitlbee bitlbee-common bitlbee-dev git libglib2.0-dev autotools-dev dh-autoreconf libtool-bin && \
  git clone https://github.com/sm00th/bitlbee-discord.git && \
  ln -s /usr/share/bitlbee /usr/local/share && \
  cd /bitlbee-discord && ./autogen.sh && \
  ./configure && \
  make && \
  make install && \
  libtool --finish /usr/lib/bitlbee && \
  apt-get remove -y --purge git libglib2.0-dev autotools-dev dh-autoreconf libtool-bin && \
  apt-get autoremove -y && \
  apt-get clean -y && \
  rm -rf /bitlbee-discord && \
  rm -rf rm -rf /var/lib/apt/lists/*
EXPOSE 6667
CMD ["/usr/sbin/bitlbee", "-D", "-n", "-i", "0.0.0.0"]

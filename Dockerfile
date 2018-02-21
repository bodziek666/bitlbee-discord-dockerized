FROM debian:stretch
RUN apt-get update && \ 
  apt-get install --no-install-recommends -y bitlbee bitlbee-common bitlbee-dev git ca-certificates build-essential libglib2.0-dev autotools-dev dh-autoreconf libtool-bin && \
  git clone https://github.com/sm00th/bitlbee-discord.git && \
  ln -s /usr/share/bitlbee /usr/local/share && \
  chmod -R 0644 /etc/bitlbee/* && \
  cd /bitlbee-discord && ./autogen.sh && \
  ./configure && \
  make && \
  make install && \
  libtool --finish /usr/lib/bitlbee && \
  apt-get autoremove -y --purge git ca-certificates build-essential libglib2.0-dev autotools-dev dh-autoreconf libtool-bin && \
  rm -rf /bitlbee-discord && \
  rm -rf rm -rf /var/lib/apt/lists/*
EXPOSE 6667
CMD ["/usr/sbin/bitlbee", "-D", "-n", "-i", "0.0.0.0"]

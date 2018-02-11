FROM fedora:27
VOLUME ["/var/lib/bitlbee"]
RUN dnf install -y bitlbee purple-discord pidgin-discord && chown -R bitlbee:bitlbee /var/lib/bitlbee 
EXPOSE 6667
CMD ["/usr/sbin/bitlbee", "-F", "-n", "-i", "0.0.0.0"]

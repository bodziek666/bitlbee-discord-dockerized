FROM fedora:27
RUN dnf install -y bitlbee purple-discord pidgin-discord
EXPOSE 6667
CMD ["/usr/sbin/bitlbee", "-F", "-n", "-i", "0.0.0.0", "-u", "root"]

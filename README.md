Bitlbee Discord via Docker Container 

This project uses bitlbee wih libpurple as IRC gateway and purple-discord plugin which allows us to connect to discord.
Docker image is based on fedora 27 because it has all required packages out of the box.

You may ask, why docker?
Because it will just work on all distros without messing around with packages and dependendies and there are a lot of them.

Anyway, after running this containter you would be able to conenct bo bitlbee from your favorite IRC client. Enjoy. 

Quick how to use:
1. Run container like this
```
docker run -d -p <bitlbee_port_on_your_host>:6667 -v your/bitlbee/settings/dir/on/host:/var/lib/bitlbee bitlbee-discord
```
or execute `setup.sh` script and them move to point 3.

2. After running this container just connect to it from your IRC client

3. Set up bitlbee to use discord by swtiching to "&bitlbee" window:
```
identify <bitlbee_password>
account add eionrobb-discord <your@discord.mail> <discord_pass>
account eionrobb-discord on
```
And you are connected to Discord!

Use `chat list eionrobb-discord` to list available rooms, then execute these commands to join one of them:

```
  chat add eionrobb-discord !1 #mydiscordchannel
  chan #mydiscordchannel set auto_join true
  /join #mydiscordchannel
```

Further reading: bitlbee offical docs.

# A simple Transmission Docker container

## What is it?

This [repository](https://github.com/bh42/docker-transmission) contains a Docker container which embeds [Transmission](https://transmissionbt.com/) on a [Debian](https://www.debian.org/) Sid slim distro.

You can find it on Docker Hub: [bh42/transmission](https://hub.docker.com/r/bh42/transmission)

## Usage

Just run `docker run -p 9091:9091 -p 51413:51413 -v /home/user/transmission:/downloads bh42/transmission` to get a working Transmission container.

Port 9091 is used to access the Web GUI and the API.

Port 51413 is used as peer listening port.

Feel free to map these ports accordingly to your needs.

The container will expect a "settings.json" file in `/downloads/config`. Be sure to have one.

The container will create multiple directories in the `/downloads` volume:
* `/downloads/download`: once finished, your downloaded files will be stored here;
* `/downloads/incomplete`: the files which are currently being downloaded will be stored here;
* `/downloads/watch`: place .torrent files here and they will automatically be processed by Transmission.

## Notes

For now, Transmission is configured to be accessed without authentication.

This is set directly in `entrypoint.sh`.

## Transmission configuration file

Here is an example configuration file (`settings.json`):
```json
{
    "alt-speed-down": 50,
    "alt-speed-enabled": false,
    "alt-speed-time-begin": 540,
    "alt-speed-time-day": 127,
    "alt-speed-time-enabled": false,
    "alt-speed-time-end": 1020,
    "alt-speed-up": 50,
    "bind-address-ipv4": "0.0.0.0",
    "bind-address-ipv6": "::",
    "blocklist-enabled": true,
    "blocklist-url": "http://john.bitsurge.net/public/biglist.p2p.gz",
    "cache-size-mb": 4,
    "dht-enabled": true,
    "download-dir": "/downloads/download",
    "download-queue-enabled": true,
    "download-queue-size": 10,
    "encryption": 1,
    "idle-seeding-limit": 30,
    "idle-seeding-limit-enabled": false,
    "incomplete-dir": "/downloads/incomplete",
    "incomplete-dir-enabled": true,
    "lpd-enabled": false,
    "message-level": 2,
    "peer-congestion-algorithm": "",
    "peer-id-ttl-hours": 6,
    "peer-limit-global": 200,
    "peer-limit-per-torrent": 50,
    "peer-port": 51413,
    "peer-port-random-high": 65535,
    "peer-port-random-low": 49152,
    "peer-port-random-on-start": false,
    "peer-socket-tos": "default",
    "pex-enabled": true,
    "port-forwarding-enabled": true,
    "preallocation": 1,
    "prefetch-enabled": true,
    "queue-stalled-enabled": true,
    "queue-stalled-minutes": 30,
    "ratio-limit": 2,
    "ratio-limit-enabled": false,
    "rename-partial-files": true,
    "rpc-authentication-required": false,
    "rpc-bind-address": "0.0.0.0",
    "rpc-enabled": true,
    "rpc-host-whitelist": "",
    "rpc-host-whitelist-enabled": true,
    "rpc-password": "",
    "rpc-port": 9091,
    "rpc-url": "/transmission/",
    "rpc-username": "",
    "rpc-whitelist": "127.*,192.168.1.*,172.16.*,172.17.*,172.18.*,172.19.*,172.20.*,172.21.*,172.22.*,172.23.*,172.24.*,172.25.*,172.26.*,172.27.*,172.28.*,172.29.*,172.30.*,172.31.*",
    "rpc-whitelist-enabled": true,
    "scrape-paused-torrents-enabled": true,
    "script-torrent-done-enabled": false,
    "script-torrent-done-filename": "",
    "seed-queue-enabled": false,
    "seed-queue-size": 10,
    "speed-limit-down": 100,
    "speed-limit-down-enabled": false,
    "speed-limit-up": 190,
    "speed-limit-up-enabled": false,
    "start-added-torrents": true,
    "trash-original-torrent-files": false,
    "umask": 18,
    "upload-slots-per-torrent": 14,
    "utp-enabled": true,
    "watch-dir": "/downloads/watch",
    "watch-dir-enabled": true
}
```

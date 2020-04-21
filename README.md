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

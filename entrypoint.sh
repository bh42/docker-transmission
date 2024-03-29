#!/bin/sh

mkdir -vp /downloads/download
mkdir -vp /downloads/incomplete
mkdir -vp /downloads/watch

/usr/bin/transmission-daemon \
  --allowed 127.*,10.*,192.168.*,172.16.*,172.17.*,172.18.*,172.19.*,172.20.*,172.21.*,172.22.*,172.23.*,172.24.*,172.25.*,172.26.*,172.27.*,172.28.*,172.29.*,172.30.*,172.31.* \
	--watch-dir /downloads/watch \
	--encryption-preferred \
	--foreground \
	--config-dir /downloads/config \
	--incomplete-dir /downloads/incomplete \
	--dht \
	--no-auth \
	--download-dir /downloads/download

# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# DoPa (20140608) - made 'busybox' a package to automate creation of symlinks
# DoPa (20140724) - replaced 'busybox' binary with one that's staticly linked
# note: symlinks for commands that duplicate those in 'toolbox' or are
#       inappropriate for the Sero7Pro (e.g. MTD functions) have been omitted

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := busybox
LOCAL_SRC_FILES := busybox
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

TOOLS := \
	[ \
	[[ \
	adjtimex \
	arp \
	arping \
	ash \
	awk \
	base64 \
	basename \
	beep \
	blkid \
	blockdev \
	bunzip2 \
	bzcat \
	bzip2 \
	cal \
	catv \
	chattr \
	chgrp \
	chpst \
	chroot \
	chrt \
	cksum \
	comm \
	cp \
	cpio \
	crond \
	crontab \
	cut \
	dc \
	depmod \
	devmem \
	df \
	diff \
	dirname \
	dnsd \
	dnsdomainname \
	dos2unix \
	echo \
	ed \
	egrep \
	env \
	envdir \
	envuidgid \
	expand \
	expr \
	false \
	fbset \
	fbsplash \
	fdisk \
	fgrep \
	find \
	findfs \
	flock \
	fold \
	free \
	freeramdisk \
	fsck \
	fstrim \
	fsync \
	ftpd \
	ftpget \
	ftpput \
	fuser \
	getopt \
	grep \
	groups \
	gunzip \
	gzip \
	head \
	hexdump \
	hostname \
	httpd \
	hush \
	hwclock \
	ifdown \
	ifup \
	inetd \
	install \
	iostat \
	ip \
	ipaddr \
	ipcalc \
	iproute \
	iprule \
	iptunnel \
	killall \
	killall5 \
	less \
	losetup \
	lsattr \
	lsusb \
	lzcat \
	lzma \
	lzop \
	lzopcat \
	man \
	md5sum \
	mkdosfs \
	mke2fs \
	mkfifo \
	mkfs.ext2 \
	mkfs.vfat \
	modinfo \
	modprobe \
	more \
	mountpoint \
	mpstat \
	nameif \
	nbd-client \
	nice \
	nmeter \
	nslookup \
	ntpd \
	od \
	patch \
	pgrep \
	pidof \
	ping \
	ping6 \
	pipe_progress \
	pkill \
	pmap \
	printf \
	pscan \
	pstree \
	pwd \
	pwdx \
	rdate \
	rdev \
	readahead \
	realpath \
	reset \
	resize \
	rev \
	run-parts \
	script \
	scriptreplay \
	sed \
	seq \
	setconsole \
	setlogcons \
	setserial \
	setsid \
	setuidgid \
	sha1sum \
	sha256sum \
	sha3sum \
	sha512sum \
	slattach \
	smemcap \
	softlimit \
	sort \
	split \
	stat \
	strings \
	stty \
	sum \
	sysctl \
	tac \
	tail \
	tar \
	tcpsvd \
	tee \
	telnet \
	telnetd \
	test \
	tftp \
	tftpd \
	time \
	timeout \
	tr \
	traceroute \
	traceroute6 \
	true \
	tty \
	ttysize \
	tunctl \
	udpsvd \
	uname \
	unexpand \
	uniq \
	unix2dos \
	unlzma \
	unlzop \
	unxz \
	unzip \
	usleep \
	uudecode \
	uuencode \
	vi \
	watch \
	watchdog \
	wc \
	wget \
	which \
	whoami \
	whois \
	xargs \
	xz \
	xzcat \
	yes \
	zcat \
	zcip

SYMLINKS := $(addprefix $(LOCAL_MODULE_PATH)/,$(TOOLS))
$(SYMLINKS): BUSYBOX_BINARY := $(LOCAL_MODULE)
$(SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(BUSYBOX_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(BUSYBOX_BINARY) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)
ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
    $(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(SYMLINKS)


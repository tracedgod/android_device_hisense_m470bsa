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
	ash \
	awk \
	base64 \
	basename \
	bbconfig \
	blkid \
	blockdev \
	brctl \
	bunzip2 \
	bzcat \
	bzip2 \
	cal \
	cat \
	catv \
	chattr \
	chgrp \
	chmod \
	chown \
	chroot \
	clear \
	cmp \
	comm \
	cp \
	cpio \
	crond \
	crontab \
	cut \
	date \
	dc \
	dd \
	depmod \
	devmem \
	df \
	diff \
	dirname \
	dmesg \
	dnsd \
	dos2unix \
	du \
	echo \
	ed \
	egrep \
	env \
	expand \
	expr \
	false \
	fbsplash \
	fdisk \
	fgrep \
	find \
	flash_lock \
	flash_unlock \
	flashcp \
	flock \
	fold \
	free \
	freeramdisk \
	fstrim \
	fsync \
	ftpget \
	ftpput \
	fuser \
	getopt \
	grep \
	groups \
	gunzip \
	gzip \
	halt \
	head \
	hexdump \
	id \
	ifconfig \
	inetd \
	insmod \
	install \
	ionice \
	iostat \
	ip \
	kill \
	killall \
	killall5 \
	less \
	ln \
	losetup \
	ls \
	lsattr \
	lsmod \
	lsusb \
	lzcat \
	lzma \
	lzop \
	lzopcat \
	man \
	md5sum \
	mesg \
	mkdir \
	mke2fs \
	mkfifo \
	mkfs.ext2 \
	mkfs.vfat \
	mknod \
	mkswap \
	mktemp \
	modinfo \
	modprobe \
	more \
	mount \
	mountpoint \
	mpstat \
	mv \
	nanddump \
	nandwrite \
	nbd-client \
	netstat \
	nice \
	nohup \
	nslookup \
	ntpd \
	od \
	patch \
	pgrep \
	pidof \
	ping \
	pipe_progress \
	pkill \
	pmap \
	poweroff \
	printenv \
	printf \
	ps \
	pstree \
	pwd \
	pwdx \
	rdev \
	readlink \
	realpath \
	renice \
	reset \
	resize \
	rev \
	rm \
	rmdir \
	rmmod \
	route \
	run-parts \
	rx \
	sed \
	seq \
	setconsole \
	setserial \
	setsid \
	sh \
	sha1sum \
	sha256sum \
	sha3sum \
	sha512sum \
	sleep \
	sort \
	split \
	stat \
	strings \
	stty \
	sum \
	swapoff \
	swapon \
	sync \
	sysctl \
	tac \
	tail \
	tar \
	taskset \
	tee \
	telnet \
	telnetd \
	test \
	tftp \
	tftpd \
	time \
	timeout \
	top \
	touch \
	tr \
	traceroute \
	true \
	ttysize \
	tune2fs \
	umount \
	uname \
	uncompress \
	unexpand \
	uniq \
	unix2dos \
	unlzma \
	unlzop \
	unxz \
	unzip \
	uptime \
	usleep \
	uudecode \
	uuencode \
	vi \
	watch \
	wc \
	wget \
	which \
	whoami \
	xargs \
	xz \
	xzcat \
	yes \
	zcat

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


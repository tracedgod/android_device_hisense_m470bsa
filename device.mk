#
# Copyright (C) 2010 The Android Open Source Project
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
# DoPa (2014/02/11) - a fusion of grouper's & randomblame's TakTik device.mk;
#                     all files pulled from the tablet (except ramdisk files)
#                     are listed in device-vendor.mk

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PROPERTY_OVERRIDES := \
    drm.service.enabled=true \
    ro.carrier=wifi-only \
    tf.enable=y \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_TAGS += dalvik.gc.type-precise

DEVICE_PACKAGE_OVERLAYS := \
    device/hisense/m470/overlay

PRODUCT_PACKAGES := \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    bttest \
    charger \
    charger_res_images \
    com.android.future.usb.accessory \
    hcitool \
    keystore.m470 \
    l2ping \
    libdumpstate.m470 \
    libemoji \
    libhealthd.m470 \
    librs_jni \
    lights.m470 \
    updater \
    setup_fs \
    busybox \
    fuse \
    exfat \
    ntfs-3g \
    ntfsfix \
    mkntfs \
    e2fsck \
    mkfs.f2fs \
    fsck.f2fs

PRODUCT_PACKAGES += \
    libnfc-nci \
    nfc_nci.m470 \
    NfcNci \
    Tag \
    com.android.nfc_extras

###### PhilZ Recovery ######

ifeq ($(RECOVERY_VARIANT),philz)

PRODUCT_PACKAGES += \
    bootscripts_mnt.sh \
    e2fsck_recovery \
    killrecovery.sh \
    minivold \
    mke2fs_recovery \
    mkntfs.recovery \
    mount.exfat_static \
    mount.ntfs-3g \
    parted \
    raw-backup.sh \
    sdparted \
    stitch.png \
    tune2fs_recovery \
    virtual_keys.png \
    zip

endif

###### AOSP ######

### Permissions ###
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

### Sound effect files ###
$(call inherit-product, frameworks/base/data/sounds/AudioPackage10.mk)

###### Prebuilt / Proprietary ######

### Kernel and modules ###
ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/hisense/m470/prebuilt/kernel/kernel
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/kernel/modules/baseband_usb_chr.ko:system/lib/modules/baseband_usb_chr.ko \
    device/hisense/m470/prebuilt/kernel/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/hisense/m470/prebuilt/kernel/modules/cfg80211.ko:system/lib/modules/cfg80211.ko \
    device/hisense/m470/prebuilt/kernel/modules/lib80211.ko:system/lib/modules/lib80211.ko \
    device/hisense/m470/prebuilt/kernel/modules/mac80211.ko:system/lib/modules/mac80211.ko \
    device/hisense/m470/prebuilt/kernel/modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
    device/hisense/m470/prebuilt/kernel/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/hisense/m470/prebuilt/kernel/modules/tcrypt.ko:system/lib/modules/tcrypt.ko


### Ramdisk ###
PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/ramdisk/fstab.m470:root/fstab.m470 \
    device/hisense/m470/prebuilt/ramdisk/init.m470.rc:root/init.m470.rc \
    device/hisense/m470/prebuilt/ramdisk/init.m470.usb.rc:root/init.m470.usb.rc \
    device/hisense/m470/prebuilt/ramdisk/init.tf.rc:root/init.tf.rc \
    device/hisense/m470/prebuilt/ramdisk/ueventd.m470.rc:root/ueventd.m470.rc

PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner

### Blobs ###
$(call inherit-product, vendor/hisense/m470/device-vendor.mk)

### Whatever you want to add to make the ROM yours ###
$(call inherit-product-if-exists, vendor/builder/m470/device-builder.mk)


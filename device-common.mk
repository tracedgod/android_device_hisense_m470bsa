#
# Copyright (C) 2011 The Android Open-Source Project
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

$(call inherit-product-if-exists, $(DEVICE_PATH)/m470-vendor.mk)

PRODUCT_AAPT_CONFIG := normal large
PRODUCT_AAPT_PREF_CONFIG := tvdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := tvdpi hdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PROPERTY_OVERRIDES := \
    drm.service.enabled=true \
    persist.sys.media.legacy-drm=true \
    ro.carrier=wifi-only \
    ro.radio.noril=true \
    tf.enable=y \
    wifi.interface=wlan0

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

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
    charger \
    charger_res_images \
    com.android.future.usb.accessory \
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
    fsck.exfat \
    mount.ntfs \
    fsck.ntfs \
    mkfs.ntfs \
    e2fsck \
    mkfs.f2fs \
    fsck.f2fs

PRODUCT_PACKAGES += \
    libnfc-nci \
    nfc_nci.bcm2079x.default \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    Performance \
    Launcher3 \
    Terminal

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

### media codec configs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/hisense/m470/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

### Wifi
PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    hardware/broadcom/wlan/bcmdhd/config/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

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
    device/hisense/m470/prebuilt/kernel/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/hisense/m470/prebuilt/kernel/modules/cfg80211.ko:system/lib/modules/cfg80211.ko \
    device/hisense/m470/prebuilt/kernel/modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
    device/hisense/m470/prebuilt/kernel/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \

### Ramdisk ###
PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/ramdisk/fstab.m470:root/fstab.m470 \
    device/hisense/m470/prebuilt/ramdisk/init.m470.rc:root/init.m470.rc \
    device/hisense/m470/prebuilt/ramdisk/init.m470.usb.rc:root/init.m470.usb.rc \
    device/hisense/m470/prebuilt/ramdisk/init.tf.rc:root/init.tf.rc \
    device/hisense/m470/prebuilt/ramdisk/ueventd.m470.rc:root/ueventd.m470.rc

PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner

PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

### Whatever you want to add to make the ROM yours ###
$(call inherit-product-if-exists, vendor/builder/m470/device-builder.mk)
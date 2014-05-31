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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#
# DoPa (2014/02/11) - a fusion of grouper's & randomblame's TakTik BoardConfig.mk
#                     with various mods

TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t30

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
NEED_WORKAROUND_CORTEX_A9_745320 := true

# Image info
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488
BOARD_FLASH_BLOCK_SIZE := 4096

# Bootloader & Kernel
TARGET_NO_BOOTLOADER := true
TARGET_PREBUILT_KERNEL := device/hisense/m470/prebuilt/kernel/kernel
#
# BOARD_KERNEL_CMDLINE := androidboot.selinux=enforcing
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive

BOARD_HAL_STATIC_LIBRARIES := \
    libdumpstate.m470 \
    libhealthd.m470

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/hisense/m470/bluetooth

# Recovery
TARGET_RECOVERY_UI_LIB := librecovery_ui_m470
TARGET_RECOVERY_FSTAB = device/hisense/m470/prebuilt/ramdisk/fstab.m470

# Sensors
BOARD_USES_GENERIC_INVENSENSE := false

# Video
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := vendor/hisense/m470/prebuilt/lib/egl/egl.cfg
BOARD_HAVE_PIXEL_FORMAT_INFO := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/bcm4330/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/vendor/firmware/bcm4330/fw_bcmdhd.bin nvram_path=/system/etc/nvram.txt iface_name=wlan0"

# SELinux
BOARD_SEPOLICY_DIRS += \
        device/hisense/m470/sepolicy

BOARD_SEPOLICY_UNION += \
        app.te \
        btmacwriter.te \
        device.te \
        dhcp.te \
        drmserver.te \
        file.te \
        file_contexts \
        genfs_contexts \
        gpsd.te \
        healthd.te \
        init.te \
        init_shell.te \
        kernel.te \
        keystore.te \
        logd.te \
        mediaserver.te \
        netd.te \
        rild.te \
        sensors_config.te \
        surfaceflinger.te \
        system_app.te \
        system_server.te \
        ueventd.te \
        untrusted_app.te \
        zygote.te


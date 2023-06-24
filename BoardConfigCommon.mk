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

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
NEED_WORKAROUND_CORTEX_A9_745320 := true

# SDClang
TARGET_USE_SDCLANG := true

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_IMAGE_NAME = zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
#BOARD_KERNEL_CMDLINE += vmalloc=340M
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000
TARGET_KERNEL_SOURCE := kernel/hisense/m470
TARGET_KERNEL_CONFIG := m470_v2_dopa1_defconfig

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO:= true
BOARD_USES_LEGACY_ALSA_AUDIO:= false
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := false
BLUETOOTH_HCI_USE_MCT := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t30

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Display
TARGET_SCREEN_DENSITY := 320

# Crypto
BOARD_HAS_TF_CRYPTO_SST := true

# Wifi
BOARD_HAS_QCOM_WLAN := false
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/bcm4330/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_NAME := "bcmdhd"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/vendor/firmware/bcm4330/fw_bcmdhd.bin nvram_path=/system/etc/nvram.txt iface_name=wlan0"

# Sensors
BOARD_USES_GENERIC_INVENSENSE := false

# Video
#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_OPENGL_RENDERER := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 3200000
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITON := true
BOARD_EGL_CFG := vendor/hisense/m470/prebuilt/lib/egl/egl.cfg
BOARD_HAVE_PIXEL_FORMAT_INFO := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368

#Reduce space taken by the journal
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Dexpreopt
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false

BOARD_FLASH_BLOCK_SIZE := 4096
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 5972672512

BOARD_USES_SECURE_SERVICES := false

USE_CAMERA_STUB := false
BOARD_USES_CAMERA_FAST_AUTOFOCUS := false

#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
#BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
#TARGET_NO_RPC := true

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 536870912

BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880

#TARGET_USES_POST_PROCESSING := true
#TARGET_CUSTOM_DISPLAY_TUNING := true
#TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

#USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true
#OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

USE_DEVICE_SPECIFIC_CAMERA:= false

HAVE_ADRENO_SOURCE:= false

# SELinux
#BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Media HAL
#BOARD_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY
#BOARD_GLOBAL_CPPFLAGS += -DQCOM_BSP_LEGACY

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true


# CM Hardware
BOARD_HARDWARE_CLASS += \
    hardware/cyanogen/cmhw

# Recovery
# comment-out RECOVERY_VARIANT to build the AOSP version of recovery
RECOVERY_VARIANT := twrp
#
ifeq ($(RECOVERY_VARIANT),twrp)
    TARGET_RECOVERY_INITRC := device/hisense/m470/prebuilt/twrp/init.rc
    TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
    RECOVERY_SDCARD_ON_DATA := true
    BOARD_UMS_LUNFILE := /sys/devices/platform/tegra-udc.0/gadget/lun%d/file
    TWRP_INCLUDE_LOGCAT := true
    TARGET_USES_LOGD := true
    TW_EXCLUDE_DEFAULT_USB_INIT := true
    TW_THEME := portrait_hdpi
    TW_EXCLUDE_SUPERSU := true
    TW_NO_EXFAT_FUSE := true
    TW_INCLUDE_NTFS_3G := true
    TW_INCLUDE_L_CRYPTO := true
    # re-include to update path to recovery_variant
    include $(BUILD_SYSTEM)/pathmap.mk
endif

-include vendor/asus/flo/BoardConfigVendor.mk
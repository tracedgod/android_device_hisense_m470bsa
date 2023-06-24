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

DEVICE_PATH := device/hisense/m470

TARGET_BOOTLOADER_BOARD_NAME := m470
TARGET_BOOTLOADER_NAME := m470
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# the OTA packaging scripts don't like twrp.fstab so we have to include
# the standard fstab regardless of which recovery is being built
TARGET_RECOVERY_FSTAB := device/hisense/m470/prebuilt/ramdisk/fstab.m470

include $(DEVICE_PATH)/BoardConfigCommon.mk
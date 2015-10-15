# Copyright (C) 2011 The Android Open Source Project
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

ifneq (,$(filter m470, $(TARGET_DEVICE)))

# Keystore.m470 is Open Source, but it links against a non-Open library,
# Print a warning and skip this module if the library is not present in the
# vendor directory or BOARD_HAS_TF_CRYPTO_SST has not been set
BOARD_HAS_TF_CRYPTO_SST ?= $(if $(wildcard vendor/*/$(TARGET_DEVICE)/*/libtf_crypto_sst.so),true)

ifeq ($(BOARD_HAS_TF_CRYPTO_SST),true)
	LOCAL_PATH := $(call my-dir)
	include $(CLEAR_VARS)
	LOCAL_MODULE := keystore.m470
	LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
	LOCAL_SRC_FILES := keymaster_m470.cpp
	LOCAL_CFLAGS := -Werror
	LOCAL_SHARED_LIBRARIES := libcutils liblog libcrypto libtf_crypto_sst
	LOCAL_MODULE_TAGS := optional
	include $(BUILD_SHARED_LIBRARY)
else
$(warning WARNING : Skipping keystore.m470 - Dependency Not Found libtf_crypto_sst )

endif
endif

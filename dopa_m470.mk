#
# Copyright 2014 The Android Open-Source Project
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

$(call inherit-product, device/hisense/m470/full_m470.mk)

# Release name
PRODUCT_RELEASE_NAME := Sero7pro

# Discard inherited values and use our own instead.
PRODUCT_NAME := dopa_m470
PRODUCT_DEVICE := m470
PRODUCT_MODEL := Sero 7 Pro
PRODUCT_MANUFACTURER := Hisense

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m470 BUILD_FINGERPRINT="Hisense/m470/m470:$(PLATFORM_VERSION)/$(BUILD_ID)/$(shell date +%Y%m%d%H%M%S):$(TARGET_BUILD_VARIANT)/test-keys" PRIVATE_BUILD_DESC="m470-$(TARGET_BUILD_VARIANT) $(PLATFORM_VERSION) $(BUILD_ID) $(shell date +%Y%m%d%H%M%S) test-keys"


# Copyright (C) 2022-2024 ForkAospX01
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

ANDROID_VERSION := 15
X01VERSION := 1.0

X01_BUILD_TYPE ?= UNOFFICIAL
X01_MAINTAINER ?= fos0g
X01_DATE_YEAR := $(shell date -u +%Y)
X01_DATE_MONTH := $(shell date -u +%m)
X01_DATE_DAY := $(shell date -u +%d)
X01_DATE_HOUR := $(shell date -u +%H)
X01_DATE_MINUTE := $(shell date -u +%M)
X01_BUILD_DATE := $(X01_DATE_YEAR)$(X01_DATE_MONTH)$(X01_DATE_DAY)-$(X01_DATE_HOUR)$(X01_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst x01_,,$(X01_BUILD))

# OFFICIAL_DEVICES
ifeq ($(X01_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/x01/config/x01.devices)
    ifeq ($(filter $(X01_BUILD), $(LIST)), $(X01_BUILD))
      IS_OFFICIAL=true
      X01_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
      X01_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(X01_BUILD)")
    endif
endif

X01_VERSION := $(X01VERSION)-$(X01_BUILD)-$(X01_BUILD_DATE)-VANILLA-$(X01_BUILD_TYPE)
ifeq ($(WITH_GAPPS), true)
X01_VERSION := $(X01VERSION)-$(X01_BUILD)-$(X01_BUILD_DATE)-GAPPS-$(X01_BUILD_TYPE)
endif
X01_MOD_VERSION :=$(ANDROID_VERSION)-$(X01VERSION)
X01_DISPLAY_VERSION := AospX01-$(X01VERSION)-$(X01_BUILD_TYPE)
X01_DISPLAY_BUILDTYPE := $(X01_BUILD_TYPE)
X01_FINGERPRINT := AospX01/$(X01_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(X01_BUILD_DATE)

# X01 System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.x01.version=$(X01_DISPLAY_VERSION) \
  ro.x01.build.status=$(X01_BUILD_TYPE) \
  ro.modversion=$(X01_MOD_VERSION) \
  ro.x01.build.date=$(X01_BUILD_DATE) \
  ro.x01.buildtype=$(X01_BUILD_TYPE) \
  ro.x01.fingerprint=$(X01_FINGERPRINT) \
  ro.x01.device=$(X01_BUILD) \
  org.x01.version=$(X01VERSION) \
  ro.x01.maintainer=$(X01_MAINTAINER)

# Sign Build
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/x01/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/x01/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/x01/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/x01/signing/keys/otakey.x509.pem
endif
endif

# Sign Build
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/x01/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/x01/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/x01/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/x01/signing/keys/otakey.x509.pem
endif
endif
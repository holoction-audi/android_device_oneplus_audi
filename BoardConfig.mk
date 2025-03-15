#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm7675-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/audi

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5CFBL1

# Charging
TARGET_CHARGE_RATE_MULTIPLIER := 2000

# Camera
TARGET_CAMERA_SERVICE_EXT_LIB := //$(DEVICE_PATH):libcameraservice_extension.audi

# Display
TARGET_SCREEN_DENSITY := 510

# Kernel
TARGET_KERNEL_CONFIG += vendor/oplus/audi.config

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Vibrator
#SOONG_CONFIG_NAMESPACES += OPLUS_LINEAGE_VIBRATOR_HAL
#SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL := \
#    USE_EFFECT_STREAM
#SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL_USE_EFFECT_STREAM := true

# Include the proprietary files BoardConfig.
include vendor/oneplus/audi/BoardConfigVendor.mk

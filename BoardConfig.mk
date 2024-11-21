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

# Display
TARGET_SCREEN_DENSITY := 510

# Kernel (prebuilt)
PREBUILT_PATH := device/oneplus/audi-prebuilt
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := $(PREBUILT_PATH)/kernel-headers
BOARD_PREBUILT_DTBIMAGE_DIR := $(PREBUILT_PATH)/images/dtbs/
BOARD_PREBUILT_DTBOIMAGE := $(PREBUILT_PATH)/images/dtbo.img
PRODUCT_COPY_FILES += \
	$(PREBUILT_PATH)/images/kernel:kernel

# Kernel modules
DLKM_MODULES_PATH := $(PREBUILT_PATH)/modules/vendor_dlkm
RAMDISK_MODULES_PATH := $(PREBUILT_PATH)/modules/vendor_boot
SYSTEM_DLKM_MODULES_PATH := $(PREBUILT_PATH)/modules/system_dlkm/6.1.57-android14-11-o-g982ce5cd78f9

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(SYSTEM_DLKM_MODULES_PATH)/,$(TARGET_COPY_OUT_SYSTEM_DLKM)/lib/modules/6.1.57-android14-11-o-g982ce5cd78f9/)

BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(DLKM_MODULES_PATH)/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(patsubst %,$(DLKM_MODULES_PATH)/%,$(shell cat $(DLKM_MODULES_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DLKM_MODULES_PATH)/modules.blocklist

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(RAMDISK_MODULES_PATH)/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(patsubst %,$(RAMDISK_MODULES_PATH)/%,$(shell cat $(RAMDISK_MODULES_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD  := $(patsubst %,$(RAMDISK_MODULES_PATH)/%,$(shell cat $(RAMDISK_MODULES_PATH)/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(RAMDISK_MODULES_PATH)/modules.blocklist

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

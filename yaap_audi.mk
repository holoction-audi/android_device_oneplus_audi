#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from audi device
$(call inherit-product, device/oneplus/audi/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/yaap/config/common_full_phone.mk)

PRODUCT_NAME := yaap_audi
PRODUCT_DEVICE := audi
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := PJF110

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi-user 16 BP2A.250605.015 1763201356522 release-keys" \
    BuildFingerprint=OnePlus/PJF110/OP5CFBL1:16/UKQ1.231108.001/U.23f7937-2f2dd9-2fb722:user/release-keys \
    DeviceName=OP5CFBL1 \
    DeviceProduct=PJF110 \
    SystemDevice=OP5CFBL1 \
    SystemName=PJF110

#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm7250-common
include device/motorola/sm7250-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/nairo

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := vendor/nairo_defconfig vendor/debugfs.config

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 4194304
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 4861198336
BOARD_SUPER_PARTITION_SIZE := 9730785280

# ODM
ODM_MANIFEST_SKUS := \
    dn \
    f \
    n

ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/sku/manifest_dn.xml
ODM_MANIFEST_F_FILES := $(DEVICE_PATH)/sku/manifest_f.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/sku/manifest_n.xml

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Copy to recovery
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := \
    utags \
    mmi_annotate \
    mmi_info \
    tzlog_dump \
    mmi_sys_temp \
    qpnp-power-on-mmi \
    wl2864c \
    qpnp-smbcharger-mmi \
    mcDrvModule \
    exfat \
    aw8695 \
    sensors_class \
    mmi_relay \
    sx933x_sar \
    nova_0flash_mmi

RECOVERY_KERNEL_MODULES := $(addsuffix .ko,$(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD))

# Security
VENDOR_SECURITY_PATCH := 2022-09-01

# Inherit the proprietary files
include vendor/motorola/nairo/BoardConfigVendor.mk

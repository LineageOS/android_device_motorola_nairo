#
# Copyright (C) 2017-2020 The LineageOS Project
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

-include device/motorola/sm7250-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/nairo

# Display
TARGET_SCREEN_DENSITY := 420

# FM
BOARD_HAVE_QCOM_FM := true
BOARD_HAS_QCA_FM_SOC := "cherokee"

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := vendor/nairo_defconfig vendor/debugfs.config
TARGET_KERNEL_ADDITIONAL_FLAGS += \
    DTC_PREBUILT=true \
    DTC=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/dtc/dtc \
    DTC_OVERLAY_TEST_EXT=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/libufdt/ufdt_apply_overlay \
    MKDTIMG=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/libufdt/mkdtimg

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 4194304

# ODM
ODM_MANIFEST_SKUS := \
    dn \
    f \
    n

ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/odm/manifest_dn.xml
ODM_MANIFEST_F_FILES := $(DEVICE_PATH)/odm/manifest_f.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/odm/manifest_n.xml

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
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

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

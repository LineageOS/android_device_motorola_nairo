#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
    # Patch configureRpcThreadpool
    vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so)
        hexdump -ve '1/1 "%.2X"' "${2}" | sed "s/8A0A0094/1F2003D5/g" | xxd -r -p > "${TMPDIR}/${1##*/}"
        mv "${TMPDIR}/${1##*/}" "${2}"
        ;;
    # memset shim
    vendor/bin/charge_only_mode)
        "${PATCHELF}" --add-needed libmemset_shim.so "${2}"
        ;;
    # Prebuilt Audio
    vendor/lib/hw/audio.primary.lito.so)
        "${PATCHELF}" --replace-needed android.hardware.power-V1-ndk_platform.so android.hardware.power-V1-ndk.so "${2}"
        ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=nairo
export DEVICE_COMMON=sm7250-common
export VENDOR=motorola

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8960
-include device/htc/msm8960-common/BoardConfigCommon.mk

BOARD_SKIP_ANDROID_DOC_BUILD := true

# CAMERA
USE_CAMERA_STUB := false
BOARD_HAVE_HTC_FFC := true
COMMON_GLOBAL_CFLAGS += -DJB_CAMERA_BLOB -DDISABLE_HW_ID_MATCH_CHECK 
COMMON_GLOBAL_CPPFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := dlx
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

#Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=dlx user_debug=31  
BOARD_FORCE_RAMDISK_ADDRESS := 0x81a08000

TARGET_PREBUILT_KERNEL := device/htc/dlx/prebuilt/kernel
TARGET_KERNEL_CONFIG := dlx_defconfig

# Audio
BOARD_USES_ALSA_AUDIO:= true

# Use libril in the device tree
BOARD_PROVIDES_LIBRIL := true

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# QCOM GPS
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := dlx

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true
TARGET_PROVIDES_LIBRIL := vendor/htc/dlx/proprietary/lib/libhtc-ril.so

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
WIFI_DRIVER_MODULE_NAME          := prima_wlan
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/prima_wlan.ko"

# HTC DNA PARTITION LAYOUT 

#dev:        size     erasesize name
#mmcblk0p21: 000ffa00 00000200 "misc"
#mmcblk0p20: 00fffe00 00000200 "recovery"
#mmcblk0p19: 01000000 00000200 "boot"
#mmcblk0p32: 73fffc00 00000200 "system"
#mmcblk0p28: 00140200 00000200 "local"
#mmcblk0p33: 27fffe00 00000200 "cache"
#mmcblk0p34: 2e8000000 00000200 "userdata"
#mmcblk0p24: 01400000 00000200 "devlog"
#mmcblk0p26: 00040000 00000200 "pdata"
#mmcblk0p29: 00010000 00000200 "extra"
#mmcblk0p16: 03200200 00000200 "radio"
#mmcblk0p17: 00a00000 00000200 "adsp"
#mmcblk0p15: 00100000 00000200 "dsps"
#mmcblk0p18: 007ffa00 00000200 "radio_config"
#mmcblk0p22: 00400000 00000200 "modem_st1"
#mmcblk0p23: 00400000 00000200 "modem_st2"
#mmcblk0p30: 00100000 00000200 "cdma_record"
#mmcblk0p31: 06069e00 00000200 "reserve"


# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1946156032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12482248704
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 35
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

#TWRP
DEVICE_RESOLUTION := 800x1280
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_FLASH_FROM_STORAGE := true

# Added for Clockworkmod
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

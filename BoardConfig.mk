#
# Copyright (C) 2011 The Android Open-Source Project
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


# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
-include device/samsung/galaxys2-common/BoardCommonConfig.mk

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
BOARD_USE_SKIA_LCDTEXT := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

TARGET_BOARD_INFO_FILE := device/samsung/d710/board-info.txt
TARGET_RECOVERY_INITRC := device/samsung/d710/recovery.rc

# Kernel Config
TARGET_KERNEL_SOURCE := kernel/samsung/smdk4210
TARGET_KERNEL_CONFIG := cyanogenmod_d710_defconfig

# Audio
BOARD_USES_ALSA_AUDIO := true

# Graphics
EGL_ALWAYS_ASYNC := true

# Notification LED
BOARD_HAS_LED_NOTIF := true

# HWComposer
BOARD_SAMSUNG_TVOUT := true
BOARD_HDMI_DDC_CH := DDC_CH_I2C_7

# RIL
BOARD_MOBILEDATA_INTERFACE_NAME := "ppp0"

# Wifi
WIFI_DRIVER_FW_PATH_MFG          := "/system/etc/wifi/bcm4330_mfg.bin"

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/d710/recovery/recovery_keys.c
BOARD_UMS_LUNFILE := "/sys/devices/platform/s3c-usbgadget/gadget/lun%d/file"
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_SPECIFIC_HEADER_PATH := device/samsung/d710/include
EXYNOS4210_ENHANCEMENTS := true
# assert
TARGET_OTA_ASSERT_DEVICE := epic4gtouch,SPH-D710,d710,smdk4210

# Use the non-open-source parts, if they're present
-include vendor/samsung/d710/BoardConfigVendor.mk

BOARD_CUSTOM_BOOTIMG_MK := device/samsung/d710/shbootimg.mk

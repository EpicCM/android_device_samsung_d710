#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS := device/samsung/d710/overlay \
	device/samsung/galaxys2-common/overlay

# Screen density is actually considered a locale (since it is taken into account
# the the build-time selection of resources). The product definitions including
# this file must pay attention to the fact that the first entry in the final
# PRODUCT_LOCALES expansion must not be a density.
# This device is hdpi.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

# Init files
PRODUCT_COPY_FILES := \
	device/samsung/galaxys2-common/lpm.rc:root/lpm.rc \
	device/samsung/galaxys2-common/init.smdk4210.usb.rc:root/init.smdk4210.usb.rc \
	device/samsung/d710/init.smdk4210.rc:root/init.smdk4210.rc \
	device/samsung/d710/ueventd.smdk4210.rc:root/ueventd.smdk4210.rc

# Audio
PRODUCT_COPY_FILES += \
	device/samsung/galaxys2-common/configs/asound.conf:system/etc/asound.conf

# Vold
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/vold.fstab:system/etc/vold.fstab

# Local Init
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/init.local.rc:system/etc/init.local.rc
# Misc	
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/apns-conf.xml:system/etc/apns-conf.xml
	
# gps
PRODUCT_COPY_FILES += \
  device/samsung/d710/gpsfix:system/bin/gpsfix
# Media
PRODUCT_COPY_FILES += \
	device/samsung/galaxys2-common/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/galaxys2-common/configs/media_codecs.xml:system/etc/media_codecs.xml

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# Gps
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/gps.conf:system/etc/gps.conf \
	device/samsung/d710/configs/sirfgps.conf:system/etc/sirfgps.conf

# Packages
PRODUCT_PACKAGES := \
    TvOut \
	audio.a2dp.default \
	com.android.future.usb.accessory \
	smdk4210_hdcp_keys \
	GalaxyS2Settings \
	SamsungServiceMode \
	libsurfaceflinger_client
	
# Camera
PRODUCT_PACKAGES += \
	camera.exynos4

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Sensors
PRODUCT_PACKAGES += \
	lights.exynos4 \
	sensors.exynos4

# MFC API
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libseccscapi \
	libsecbasecomponent \
	libsecosal \
	libSEC_OMX_Resourcemanager \
	libSEC_OMX_Core \
	libSEC_OMX_Vdec \
	libOMX.SEC.AVC.Decoder \
	libOMX.SEC.M4V.Decoder \
	libOMX.SEC.WMV.Decoder \
	libOMX.SEC.VP8.Decoder \
	libSEC_OMX_Venc \
	libOMX.SEC.AVC.Encoder \
	libOMX.SEC.M4V.Encoder \
	libSEC_OMX_Adec \
	libOMX.SEC.MP3.Decoder 

# WIMAX
PRODUCT_PACKAGES += \
    WiMAXSettings \
    SprintMenu \
    WiMAXHiddenMenu \
    SystemUpdateUI

# Ril
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=4 \
	ro.com.google.clientidbase=android-sprint-us \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	net.cdma.pppd.authtype=require-pap \
	net.cdma.pppd.user=user[SPACE]SprintNextel \
	net.cdma.datalinkinterface=/dev/ttyCDMA0 \
	net.interfaces.defaultroute=cdma \
	ro.telephony.ril_class=SamsungCDMAv6RIL \
	ro.carrier=Sprint \
	ro.wimax.interface=uwbr0 \
	ro.cdma.ppp.interface=ppp0 \
	mobiledata.interfaces=ppp0,uwbr0
	net.tcp.buffersize.wimax   4096,87380,256960,4096,16384,256960

PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/ip-up:system/etc/ppp/ip-up \
	device/samsung/d710/configs/ip-up:system/etc/ppp/ip-down 

# Filesystem management tools
PRODUCT_PACKAGES += \
	static_busybox \
	make_ext4fs \
	setup_fs

# Live Wallpapers
PRODUCT_PACKAGES += \
	Galaxy4 \
	HoloSpiralWallpaper \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	NoiseField \
	PhaseBeam \
	VisualizationWallpapers \
	librs_jni

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	hwui.render_dirty_regions=false

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240

PRODUCT_TAGS += dalvik.gc.type-precise

# Vold properties and default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
$(call inherit-product-if-exists, vendor/samsung/galaxys2-common/common-vendor.mk)
$(call inherit-product-if-exists, vendor/samsung/d710/d710-vendor.mk)
$(call inherit-product-if-exists, vendor/common/common.mk)
$(call inherit-product, hardware/samsung/exynos4210.mk)

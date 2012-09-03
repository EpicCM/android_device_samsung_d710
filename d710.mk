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
DEVICE_PACKAGE_OVERLAYS := device/samsung/d710/overlay

# Init files
PRODUCT_COPY_FILES := \
	device/samsung/d710/lpm.rc:root/lpm.rc \
	device/samsung/d710/init.smdk4210.usb.rc:root/init.smdk4210.usb.rc \
	device/samsung/d710/init.smdk4210.rc:root/init.smdk4210.rc \
	device/samsung/d710/ueventd.smdk4210.rc:root/ueventd.smdk4210.rc

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

# Keylayout
PRODUCT_COPY_FILES += \
	device/samsung/d710/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/d710/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
	device/samsung/d710/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/d710/usr/keylayout/max8997-muic.kl:system/usr/keylayout/max8997-muic.kl \
	device/samsung/d710/usr/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
	device/samsung/d710/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/samsung/d710/usr/keylayout/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
	device/samsung/d710/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
	device/samsung/d710/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
	device/samsung/d710/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
	device/samsung/d710/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
	device/samsung/d710/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
	device/samsung/d710/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
	device/samsung/d710/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
	device/samsung/d710/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
	device/samsung/d710/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
	device/samsung/d710/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl

# Keychars
PRODUCT_COPY_FILES += \
	device/samsung/d710/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
	device/samsung/d710/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
	device/samsung/d710/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
	device/samsung/d710/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

#idc
PRODUCT_COPY_FILES += \
	device/samsung/d710/usr/idc/melfas_ts.idc:system/usr/idc/melfas_ts.idc \
	device/samsung/d710/usr/idc/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc \
	device/samsung/d710/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
	device/samsung/d710/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
	device/samsung/d710/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Audio
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/asound.conf:system/etc/asound.conf

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Vold
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/vold.fstab:system/etc/vold.fstab

# EGL properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	hwui.render_dirty_regions=false
	
# Ril properties
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
	net.tcp.buffersize.wimax=4096,524288,1048576,4096,16384,110208 \
	mobiledata.interfaces=ppp0,uwbr0 \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=180
    ro.telephony.sends_barcount=1 \
    ro.ril.def.agps.mode=2 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=50

# Gps
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/gps.conf:system/etc/gps.conf \
	device/samsung/d710/configs/sirfgps.conf:system/etc/sirfgps.conf 

# Packages
PRODUCT_PACKAGES := \
	audio.a2dp.default \
	com.android.future.usb.accessory \
	smdk4210_hdcp_keys \
	TvOut \
	Camera \
	camera.exynos4 \
	GalaxyS2Settings \
	SamsungServiceMode \
	libsurfaceflinger_client

# Media
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/media_profiles.xml:system/etc/media_profiles.xml

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# HAL 
PRODUCT_PACKAGES += \
	lights.exynos4 \
	sensors.exynos4 \
	gps.exynos4 \
	libhwconverter \
	libs5pjpeg \
	libfimg

# MFC API
PRODUCT_PACKAGES += \
	libsecmfcapi \
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
	libOMX.SEC.MP3.Decoder \
	libhwconverter \
	libs5pjpeg \
	libfimg


# Local Init
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/init.local.rc:system/etc/init.local.rc

# Media
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/media_profiles.xml:system/etc/media_profiles.xml

# Wifi
PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_COPY_FILES += \
	device/samsung/d710/configs/ip-up:system/etc/ppp/ip-up \
	device/samsung/d710/configs/ip-up:system/etc/ppp/ip-down \
	device/samsung/d710/configs/pppd_runner:system/bin/pppd_runner

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

PRODUCT_COPY_FILES += \
	device/samsung/d710/dhd.ko:root/lib/modules/dhd.ko


# This device is hdpi.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

# Feature live wallpaper
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240

PRODUCT_TAGS += dalvik.gc.type-precise

# Vold properties and default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage,adb

# enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

# Include exynos4 platform specific parts
TARGET_HAL_PATH := hardware/samsung/exynos4/hal
TARGET_OMX_PATH := hardware/samsung/exynos/multimedia/openmax

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
$(call inherit-product, hardware/samsung/exynos4210.mk)
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/samsung/d710/d710-vendor.mk)
$(call inherit-product-if-exists, vendor/samsung/galaxys2-common/common-vendor-blobs.mk)

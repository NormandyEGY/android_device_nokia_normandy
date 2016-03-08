# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/nokia/normandy/normandy-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/nokia/normandy/overlay

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_normandy
PRODUCT_DEVICE := normandy

LOCAL_PATH := device/nokia/normandy

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += ar_EG
PRODUCT_LOCALES += sk_SK
PRODUCT_LOCALES += fr_FR
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BOOT_JARS += qcmediaplayer


# System Properties
#-include device/nokia/normandy/system_prop.mk

#Root Props
ADDITIONAL_DEFAULT_PROPERTIES += \
    service.adb.root=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.sys.usb.config=adb \
    ro.zygote=zygote32 \
    dalvik.vm.dex2oat-Xms=8m \
    dalvik.vm.dex2oat-Xmx=96m \
    dalvik.vm.image-dex2oat-Xms=48m \
    dalvik.vm.image-dex2oat-Xmx=48m

# Replace Kernel With prebuilt one to avoid booting errors
#ifeq ($(TARGET_PREBUILT_KERNEL),)
#	LOCAL_KERNEL := device/nokia/normandy/kernel
#else
#	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

#Root dir
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    init.qcom.usb.rc \
    ueventd.qcom.rc \
    init.qcom.class_core.sh \
    init.qcom.unicorn-dpi.sh \
    init.qcom.ril.sh

# Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/config/dhcpcd.conf:system/etc/dhcpcd.conf \
    $(LOCAL_PATH)/config/gps.conf:system/etc/gps.conf

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio.a2dp.default \
    audio.usb.default \
    libaudioutils \
    audio.r_submix.default \
    libaudioparameter \
    libaudio-resampler \
    libtinyalsa \
    libdashplayer

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf

# Display
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libc2dcolorconvert \
    liboverlay \
    libmemalloc \
    libtilerenderer \
    libgenlock \
    libqdutils \
    libqdMetaData

 # GPS
PRODUCT_PACKAGES += \
    gps.msm7x27a

# Keys
PRODUCT_PACKAGES += \
    7x27a_kp.kcm \
    atmel_mxt_ts.kl \
    synaptics_rmi4_i2c.kl \
    ft5x06_ts.kl \
    surf_keypad.kl \
    7k_handset.kl \
    7x27a_kp.kl \
    ft6306.kl

# Filesystem management tools
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    hwmac \
    make_ext4fs \
    setup_fs

# Misc
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    libcnefeatureconfig \
    libnl_2

# Lights
PRODUCT_PACKAGES += \
   lights.msm7x27a

# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf \
    wpa_supplicant.conf \
    wpa_supplicant

# Newer camera API isn't supported.
PRODUCT_PROPERTY_OVERRIDES += \
   camera2.portability.force_api=1

# Extras
PRODUCT_PACKAGES += \
    su \
    dexopt \
    dex2oat \
    librpc
    
# FM Radio
PRODUCT_PACKAGES += \
    FM2 \
    FMRecord \
    libqcomfm_jni \
    qcom.fmradio

# qcmediaplayer
PRODUCT_PACKAGES += qcmediaplayer

#llvm
PRODUCT_PACKAGES += \
    llvm

#Launcher3
#PRODUCT_PACKAGES += \
#    Launcher3

#Eleven
PRODUCT_PACKAGES += \
    Eleven

#Terminal
PRODUCT_PACKAGES += \
    Terminal

# SnapdragonCamera
PRODUCT_PACKAGES += \
    SnapdragonCamera

#Copying Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)


#Other
PRODUCT_PACKAGES += \
     wlan.ko \
     wlan \
     WCNSS_qcom_wlan_nv.bin \
     WCNSS_cfg.dat \
     WCNSS_qcom_cfg.ini

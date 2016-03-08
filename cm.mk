# Release name
PRODUCT_RELEASE_NAME := Normandy

# Inherit some common SLIM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/nokia/normandy/device_normandy.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Discard inherited values and use our own instead.
PRODUCT_NAME := cm_normandy
PRODUCT_DEVICE := normandy
PRODUCT_BRAND := NOKIA
PRODUCT_MANUFACTURER := NOKIA
PRODUCT_MODEL := NOKIAX

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_BRAND=Nokia \
    PRODUCT_NAME=Nokia_X \
    BUILD_PRODUCT=RM-980
#    BUILD_FINGERPRINT=qcom/msm8625/msm8625:4.1.2/JZO54K/eng.ZYC.20140213.151118:eng/test-keys

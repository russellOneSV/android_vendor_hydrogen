# Generic product
PRODUCT_NAME := hydrogen
PRODUCT_BRAND := hydrogen
PRODUCT_DEVICE := generic

# Inherit kitkat audio package.
$(call inherit-product, vendor/hydrogen/products/kitkataudio.mk)

# Common overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Build Launcher 3
PRODUCT_PACKAGES += \
    Launcher3 \

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/hydrogen/overlay/common

# Bootanimation
PRODUCT_COPY_FILES += \
     vendor/hydrogen/prebuilt/common/bootanimation/1080.zip:system/media/bootanimation.zip

# Latin IME lib
PRODUCT_COPY_FILES += \
    vendor/hydrogen/proprietary/common/system/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Motox dalvik patch
    ifneq ($(filter hydrogen_hammerhead hydrogen_mako,$(TARGET_PRODUCT)),)
    $(call inherit-product, vendor/hydrogen/products/motoxdalvikpatch.mk)
endif
    
# Versioning System
 PRODUCT_VERSION_MAJOR = PRE-ALPHA
 PRODUCT_VERSION_MINOR = v0.0
 HYDROGEN_POSTFIX := $(shell date +"%Y%m%d-%H%M")

 # Set all versions
 HYDROGEN_VERSION := $(PRODUCT_VERSION_MAJOR)::$(PRODUCT_VERSION_MINOR)
 HYDROGEN_MOD_VERSION := $(TARGET_PRODUCT)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(hydrogen_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.hydrogen.version=$(HYDROGEN_VERSION) \
    ro.modversion=$(HYDROGEN_MOD_VERSION)

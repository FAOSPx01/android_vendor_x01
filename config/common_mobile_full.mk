# Inherit common Lineage stuff
$(call inherit-product, vendor/x01/config/common_mobile.mk)

PRODUCT_SIZE := full

# Include {Lato,Rubik} fonts
$(call inherit-product-if-exists, external/google-fonts/lato/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/rubik/fonts.mk)

# Apps
PRODUCT_PACKAGES += \
    Eleven \
    Etar \
    Profiles \
    Recorder \
    Seedvault

ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd

# Fonts
PRODUCT_PACKAGES += \
    fonts_customization.xml \
    FontLatoOverlay \
    FontRubikOverlay

<<<<<<< HEAD
# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/x01/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/x01/overlay/dictionaries
=======
# Include Blaze LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/blaze/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/blaze/overlay/dictionaries
>>>>>>> d1b1c749 (config: Move LatinIME stuff to common_mobile*.mk)

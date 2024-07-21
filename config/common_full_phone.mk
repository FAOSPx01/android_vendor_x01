# Inherit mobile full common Lineage stuff
$(call inherit-product, vendor/x01/config/common_mobile_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include blaze LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/x01/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/x01/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/x01/config/telephony.mk)

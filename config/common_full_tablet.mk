# Inherit mobile full common Lineage stuff
$(call inherit-product, vendor/x01/config/common_mobile_full.mk)

# Inherit tablet common Lineage stuff
$(call inherit-product, vendor/x01/config/tablet.mk)

$(call inherit-product, vendor/x01/config/telephony.mk)

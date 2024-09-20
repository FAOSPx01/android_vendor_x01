# Inherit mobile mini common Lineage stuff
$(call inherit-product, vendor/x01/config/common_mobile_mini.mk)

# Inherit tablet common Lineage stuff
$(call inherit-product, vendor/x01/config/tablet.mk)

$(call inherit-product, vendor/x01/config/wifionly.mk)

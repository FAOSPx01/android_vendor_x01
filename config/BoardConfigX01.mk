include vendor/x01/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/x01/config/BoardConfigQcom.mk
endif

include vendor/x01/config/BoardConfigSoong.mk
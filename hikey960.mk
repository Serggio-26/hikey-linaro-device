ifndef TARGET_KERNEL_USE
  TARGET_KERNEL_USE=4.9
else
  $(error "Only 4.9 is supported")
endif

TARGET_PREBUILT_KERNEL := out/target/product/hikey960/Image.gz-hikey960-4.9
TARGET_PREBUILT_DTB := out/target/product/hikey960/hi3660-hikey960.dtb-4.9

ifeq ($(TARGET_KERNEL_USE), 4.4)
  HIKEY_USE_LEGACY_TI_BLUETOOTH := true
else
  HIKEY_USE_LEGACY_TI_BLUETOOTH := false
endif

#
# Inherit the full_base and device configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/linaro/hikey/hikey960/device-hikey960.mk)
$(call inherit-product, device/linaro/hikey/device-common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, vendor/gls/device-vendor.mk)

#
# Overrides
PRODUCT_NAME := hikey960
PRODUCT_DEVICE := hikey960
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on hikey960

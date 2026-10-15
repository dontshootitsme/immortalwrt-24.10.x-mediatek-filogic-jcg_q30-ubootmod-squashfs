# ---------------------------------------------------------------------
# Restored "(custom U-Boot layout)" variants for the vendor
# "unbrickable" U-Boot, as defined in ImmortalWrt openwrt-23.05
# (Device/jcg_q30-ubootmod and Device/qihoo_360t7-ubootmod).
# These keep the classic kernel/rootfs/rootfs_data UBI layout expected
# by the vendor U-Boot in the "fip"/"FIP" partition.
# ---------------------------------------------------------------------

define Device/jcg_q30-pro-ubootmod
  DEVICE_VENDOR := JCG
  DEVICE_MODEL := Q30 PRO
  DEVICE_VARIANT := (custom U-Boot layout)
  DEVICE_ALT0_VENDOR := JCG
  DEVICE_ALT0_MODEL := Q30
  DEVICE_ALT0_VARIANT := (custom U-Boot layout)
  DEVICE_ALT1_VENDOR := CMCC
  DEVICE_ALT1_MODEL := MR3000D-CIq
  DEVICE_ALT1_VARIANT := (custom U-Boot layout)
  DEVICE_DTS := mt7981b-jcg-q30-pro-ubootmod
  DEVICE_DTS_DIR := ../dts
  DEVICE_PACKAGES := kmod-mt7915e kmod-mt7981-firmware mt7981-wo-firmware
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 113152k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
  KERNEL = kernel-bin | lzma | \
	fit lzma $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb
  KERNEL_INITRAMFS = kernel-bin | lzma | \
	fit lzma $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb with-initrd
endef
TARGET_DEVICES += jcg_q30-pro-ubootmod

# --- end ubootmod overlay (auto-appended by scripts/build.sh) ---

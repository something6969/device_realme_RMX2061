#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:386b1ea35a3383d5f81ebc11cbb9f78b89bfd12c; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:d2e824d562fba629c9de5d628323141573b7c255 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:386b1ea35a3383d5f81ebc11cbb9f78b89bfd12c && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi

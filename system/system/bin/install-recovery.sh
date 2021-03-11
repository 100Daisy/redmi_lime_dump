#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:fe77fb5a9d4244ebb39397778fac1290f0bc51ac; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:604390e55ecc98a378446dde8ba1afec173107b2 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:fe77fb5a9d4244ebb39397778fac1290f0bc51ac && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

#!/usr/bin/busybox sh
#this is a temporary solution and should most likely be replaced by something faster and more stable than a shell script
export KVER=5.6.2-arch1-2
cd /home/kitty/Documents/projects/initramfs/usr/local/lib/
rm ./modules/*
cp /usr/lib/modules/$KVER/kernel/lib/crc16.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/video/fbdev/core/* ./
cp /usr/lib/modules/$KVER/kernel/drivers/char/agp/intel-gtt.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/char/agp/agpgart.ko.xz ./
#cp /usr/lib/modules/$KVER/kernel/drivers/scsi/sd_mod.ko.xz ./
#cp /usr/lib/modules/$KVER/kernel/drivers/scsi/scsi_mod.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/fs/jbd2/jbd2.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/i2c/algos/i2c-algo-bit.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/gpu/drm/i915/i915.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/media/rc/rc-core.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/media/cec/cec.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/gpu/drm/drm_kms_helper.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/gpu/drm/drm.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/input/serio/libps2.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/input/serio/serio.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/input/serio/i8042.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/input/keyboard/atkbd.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/crypto/crc32c_generic.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/fs/ext4/ext4.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/fs/mbcache.ko.xz ./
#cp /usr/lib/modules/$KVER/kernel/drivers/ata/libata.ko.xz ./
#cp /usr/lib/modules/$KVER/kernel/drivers/ata/libahci.ko.xz ./
#cp /usr/lib/modules/$KVER/kernel/drivers/ata/ahci.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/pci/hda/snd-hda-intel.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/pci/hda/snd-hda-codec-generic.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/pci/hda/snd-hda-codec-realtek.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/pci/hda/snd-hda-codec.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/hda/snd-hda-core.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/core/snd-hwdep.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/core/snd-pcm.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/core/snd-timer.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/core/snd.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/leds/trigger/ledtrig-audio.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/soundcore.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/usb/host/xhci-pci.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/drivers/usb/host/xhci-hcd.ko.xz ./
cp /usr/lib/modules/$KVER/kernel/sound/hda/snd-intel-dspcfg.ko.xz ./
unxz ./*
mv ./*.ko ./modules/
cd /home/kitty/Documents/projects/
echo '.set crc16SZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/crc16.ko) > msz.s
echo '.set fb_sys_fopsSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/fb_sys_fops.ko) >> msz.s
echo '.set syscopyareaSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/syscopyarea.ko) >> msz.s
echo '.set sysfillrectSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/sysfillrect.ko) >> msz.s
echo '.set sysimgbltSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/sysimgblt.ko) >> msz.s
echo '.set intel_gttSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/intel-gtt.ko) >> msz.s
echo '.set agpgartSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/agpgart.ko) >> msz.s
#echo '.set sd_modSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/sd_mod.ko) >> msz.s
#echo '.set scsi_modSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/scsi_mod.ko) >> msz.s
echo '.set jbd2SZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/jbd2.ko) >> msz.s
echo '.set i2c_algo_bitSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/i2c-algo-bit.ko) >> msz.s
echo '.set i915SZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/i915.ko) >> msz.s
echo '.set rc_coreSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/rc-core.ko) >> msz.s
echo '.set cecSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/cec.ko) >> msz.s
echo '.set drm_kms_helperSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/drm_kms_helper.ko) >> msz.s
echo '.set drmSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/drm.ko) >> msz.s
echo '.set libps2SZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/libps2.ko) >> msz.s
echo '.set serioSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/serio.ko) >> msz.s
echo '.set i8042SZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/i8042.ko) >> msz.s
echo '.set atkbdSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/atkbd.ko) >> msz.s
echo '.set crc32c_genericSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/crc32c_generic.ko) >> msz.s
echo '.set ext4SZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/ext4.ko) >> msz.s
echo '.set mbcacheSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/mbcache.ko) >> msz.s
#echo '.set libataSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/libata.ko) >> msz.s
#echo '.set libahciSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/libahci.ko) >> msz.s
#echo '.set ahciSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/ahci.ko) >> msz.s
echo '.set snd_hda_intelSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-hda-intel.ko) >> msz.s
echo '.set snd_hda_codec_genericSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-hda-codec-generic.ko) >> msz.s
echo '.set snd_hda_codec_realtekSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-hda-codec-realtek.ko) >> msz.s
echo '.set snd_hda_codecSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-hda-codec.ko) >> msz.s
echo '.set snd_hda_coreSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-hda-core.ko) >> msz.s
echo '.set snd_hwdepSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-hwdep.ko) >> msz.s
echo '.set snd_pcmSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-pcm.ko) >> msz.s
echo '.set snd_timerSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-timer.ko) >> msz.s
echo '.set sndSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd.ko) >> msz.s
echo '.set ledtrig_audioSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/ledtrig-audio.ko) >> msz.s
echo '.set soundcoreSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/soundcore.ko) >> msz.s
echo '.set xhci_pciSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/xhci-pci.ko) >> msz.s
echo '.set xhci_hcdSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/xhci-hcd.ko) >> msz.s
echo '.set snd_intel_dspcfgSZ,' $(stat -c'%s' ./initramfs/usr/local/lib/modules/snd-intel-dspcfg.ko) >> msz.s
as li3.s -o li3.o
ld li3.o -o li3
cp li3 ./initramfs/init
cd ./initramfs
find . -print | cpio -o -H newc | lz4 -9 -l > /mnt/sda5/boot/asminit.img
cp /usr/lib64/modules/$KVER/vmlinuz /mnt/sda5/boot/vmlinuz-linux

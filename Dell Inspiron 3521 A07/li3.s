.include "msz.s"
.data
dev1:
.string "dev"
dev2:
.string "devtmpfs"
#devpts1:
#.string "dev/pts"
#devpts2:
#.string "devpts"
sys1:
.string "sys"
sys2:
.string "sysfs"
proc:
.string "proc"
ext4:
.string "ext4"
sda5:
.string "/dev/sda5"
sda5mp:
.string "/mnt/sda5"
agpgart:
.string "/usr/local/lib/modules/agpgart.ko"
serio:
.string "/usr/local/lib/modules/serio.ko"
libps2:
.string "/usr/local/lib/modules/libps2.ko"
atkbd:
.string "/usr/local/lib/modules/atkbd.ko"
i8042:
.string "/usr/local/lib/modules/i8042.ko"
i8042op:
.string "noaux=1 nomux=1 unlock=1 direct=1 dumbkbd=1 debug=0"
syscopyarea:
.string "/usr/local/lib/modules/syscopyarea.ko"
sysfillrect:
.string "/usr/local/lib/modules/sysfillrect.ko"
sysimgblt:
.string "/usr/local/lib/modules/sysimgblt.ko"
fb_sys_fops:
.string "/usr/local/lib/modules/fb_sys_fops.ko"
drm:
.string "/usr/local/lib/modules/drm.ko"
drm_kms_helper:
.string "/usr/local/lib/modules/drm_kms_helper.ko"
intel_gtt:
.string "/usr/local/lib/modules/intel-gtt.ko"
i2c_algo_bit:
.string "/usr/local/lib/modules/i2c-algo-bit.ko"
i915:
.string "/usr/local/lib/modules/i915.ko" 
i915op:
.string "enable_hangcheck=0 modeset=1 alpha_support=0 error_capture=0 verbose_state_checks=0"
#scsi_mod:
#.string "/usr/local/lib/modules/scsi_mod.ko"
#sd_mod:
#.string "/usr/local/lib/modules/sd_mod.ko"
#libata:
#.string "/usr/local/lib/modules/libata.ko"
#libahci:
#.string "/usr/local/lib/modules/libahci.ko"
#ahci:
#.string "/usr/local/lib/modules/ahci.ko"
crc16:
.string "/usr/local/lib/modules/crc16.ko"
crc32c_generic:
.string "/usr/local/lib/modules/crc32c_generic.ko"
jbd2:
.string "/usr/local/lib/modules/jbd2.ko"
#fscrypto:
#.string "/usr/local/lib/modules/fscrypto.ko"
mbcache:
.string "/usr/local/lib/modules/mbcache.ko"
ext4ko:
.string "/usr/local/lib/modules/ext4.ko"
soundcore:
.string "/usr/local/lib/modules/soundcore.ko"
ledtrig_audio:
.string "/usr/local/lib/modules/ledtrig-audio.ko"
snd:
.string "/usr/local/lib/modules/snd.ko"
snd_timer:
.string "/usr/local/lib/modules/snd-timer.ko"
snd_pcm:
.string "/usr/local/lib/modules/snd-pcm.ko"
snd_pcmop:
.string "preallocate_dma=8192"
snd_hwdep:
.string "/usr/local/lib/modules/snd-hwdep.ko"
snd_hda_core:
.string "/usr/local/lib/modules/snd-hda-core.ko"
snd_hda_codec:
.string "/usr/local/lib/modules/snd-hda-codec.ko"
snd_hda_codec_generic:
.string "/usr/local/lib/modules/snd-hda-codec-generic.ko"
snd_hda_codec_realtek:
.string "/usr/local/lib/modules/snd-hda-codec-realtek.ko"
snd_intel_dspcfg:
.string "/usr/local/lib/modules/snd-intel-dspcfg.ko"
snd_hda_intel:
.string "/usr/local/lib/modules/snd-hda-intel.ko"
snd_hda_intelop:
.string "beep_mode=0 snoop=0"
xhci_pci:
.string "/usr/local/lib/modules/xhci_pci.ko"
xhci_hcd:
.string "/usr/local/lib/modules/xhci_hcd.ko"
noop:
.string ""
.globl sas
.type sas, @object
sas:
.int 0
.int 0
.int 3
.zero 16
#udev:
#.string "/usr/lib/systemd/systemd-udevd"
#.globl udev_args
#.type udev_args, @object
#ev:
#.string "systemd-udevd"
#ua:
#.string "-d"
#udev_args:
#.quad ev
#.quad ua
#.zero 16
display_server:
.string "/usr/local/bin/busybox"
.globl ds_args
.type ds_args,@object
er:
.string "busybox"
dsa1:
.string "sh"
dsa2:
.string "-l"
dsa3:
.string "/script"
ds_args:
.quad er
.quad dsa1
.quad dsa2
#.quad dsa3
.zero 16
.globl ds_env
.type ds_env,@object
dse1:
.string "HOME=/root"
dse2:
.string "XDG_RUNTIME_DIR=/tmp/root"
dse3:
.string "TERM=linux"
ds_env:
.quad dse1
.quad dse2
.quad dse3
.zero 16
.text
.globl _start
.type _start, @function
_start:
mov $165,%eax
lea dev1(%rip),%rsi
lea dev2(%rip),%rdx
syscall
#mov $165,%eax
#lea devpts1(%rip),%rsi
#lea devpts2(%rip),%rdx
#syscall
mov $165,%eax
lea sys1(%rip),%rsi
lea sys2(%rip),%rdx
mov $3076,%r10
syscall
mov $165,%eax
lea proc(%rip),%rsi
lea proc(%rip),%rdx
mov $3076,%r10
syscall
##do not listen children, so they will die
movl $13, %eax
movl $17, %edi
leaq sas(%rip), %rsi
movl $0, %edx
movq $8,%r10
syscall
##run udev. It doesn't work, if there is no /run
#parent0:
#mov $56,%rax
#syscall
#cmp $0,%rax
#jne parent2
#mov $59,%rax
#lea udev(%rip),%rdi
#lea udev_args(%rip),%rsi
#syscall
#mov %rax,%rdi
#mov $60,%eax
#syscall
## allocate memory
#mov $12,%rax
#mov $0,%rdi
#syscall
#add $4232929,%rax
#mov %rax,%rdi
#mov $12,%rax
#syscall
#mov %rax, %rsp
## load kernel modules for graphics
mov $56,%rax
xor %rdi,%rdi
xor %rsi,%rsi
xor %rdx,%rdx
xor %r10,%r10
syscall
cmp $0,%rax
jne lpp
mov $2,%rax
lea agpgart(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $agpgartSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea serio(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $serioSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea libps2(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $libps2SZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea atkbd(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $atkbdSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea i8042(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $i8042SZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea i8042op(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea syscopyarea(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $syscopyareaSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea sysfillrect(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $sysfillrectSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea sysimgblt(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $sysimgbltSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea fb_sys_fops(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $fb_sys_fopsSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea drm(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $drmSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea drm_kms_helper(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $drm_kms_helperSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea i2c_algo_bit(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $i2c_algo_bitSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea intel_gtt(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $intel_gttSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea i915(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $i915SZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea i915op(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall

##run display server
#mov $56,%rax
#syscall
#cmp $0,%rax
#jne parent2
#parent2:
#mov $56,%rax
#syscall
#cmp $0,%rax
#jne parent3
#mov $59,%rax
#lea game(%rip),%rdi
#lea ga(%rip),%rsi
#lea ge(%rip),%rdx
#syscall
#parent3:

#movq $13, %rax
#movq $17, %rdi
#leaq sas(%rip), %rsi
#xorq %rdx,%rdx
#movq $8,%r10
#syscall
#mov $56,%rax
#xor %rdi,%rdi
#xor %rsi,%rsi
#xor %rdx,%rdx
#xor %r10,%r10
#syscall
#cmp $0,%rax
#jne lpp
#mov $2,%rax
#lea scsi_mod(%rip),%rdi
#xor %rsi,%rsi
#xor %rdx,%rdx
#syscall
#mov %rax,%r8
#mov $9,%rax
#xor %rdi,%rdi
#mov $scsi_modSZ,%rsi
#mov $1,%rdx
#mov $1,%r10
#mov $0,%r9
#syscall
#mov %rax,%rdi
#mov $175,%rax
#lea noop(%rip),%rdx
#syscall
#mov $11,%rax
#syscall
#mov $3,%rax
#mov $3,%rdi
#syscall
#mov $2,%rax
#lea sd_mod(%rip),%rdi
#xor %rsi,%rsi
#xor %rdx,%rdx
#syscall
#mov %rax,%r8
#mov $9,%rax
#xor %rdi,%rdi
#mov $sd_modSZ,%rsi
#mov $1,%rdx
#mov $1,%r10
#mov $0,%r9
#syscall
#mov %rax,%rdi
#mov $175,%rax
#lea noop(%rip),%rdx
#syscall
#mov $11,%rax
#syscall
#mov $3,%rax
#mov $3,%rdi
#syscall
#mov $2,%rax
#lea libata(%rip),%rdi
#xor %rsi,%rsi
#xor %rdx,%rdx
#syscall
#mov %rax,%r8
#mov $9,%rax
#xor %rdi,%rdi
#mov $libataSZ,%rsi
#mov $1,%rdx
#mov $1,%r10
#mov $0,%r9
#syscall
#mov %rax,%rdi
#mov $175,%rax
#lea noop(%rip),%rdx
#syscall
#mov $11,%rax
#syscall
#mov $3,%rax
#mov $3,%rdi
#syscall
#mov $2,%rax
#lea libahci(%rip),%rdi
#xor %rsi,%rsi
#xor %rdx,%rdx
#syscall
#mov %rax,%r8
#mov $9,%rax
#xor %rdi,%rdi
#mov $libahciSZ,%rsi
#mov $1,%rdx
#mov $1,%r10
#mov $0,%r9
#syscall
#mov %rax,%rdi
#mov $175,%rax
#lea noop(%rip),%rdx
#syscall
#mov $11,%rax
#syscall
#mov $3,%rax
#mov $3,%rdi
#syscall
#mov $2,%rax
#lea ahci(%rip),%rdi
#xor %rsi,%rsi
#xor %rdx,%rdx
#syscall
#mov %rax,%r8
#mov $9,%rax
#xor %rdi,%rdi
#mov $ahciSZ,%rsi
#mov $1,%rdx
#mov $1,%r10
#mov $0,%r9
#syscall
#mov %rax,%rdi
#mov $175,%rax
#lea noop(%rip),%rdx
#syscall
#mov $11,%rax
#syscall
#mov $3,%rax
#mov $3,%rdi
#syscall
mov $2,%rax
lea crc16(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $crc16SZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea crc32c_generic(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $crc32c_genericSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
#mov $2,%rax
#lea crc32c_intel(%rip),%rdi
#xor %rsi,%rsi
#xor %rdx,%rdx
#syscall
#mov %rax,%rdi
#xor %rax,%rax
#lea -20825(%rsp),%rsi
#mov $20825,%rdx
#syscall
#mov %rax,%rsi
#mov $175,%rax
#lea -20825(%rsp),%rdi
#lea noop(%rip),%rdx
#syscall
#mov $3,%rax
#mov $3,%rdi
#syscall
#mov $2,%rax
#lea fscrypto(%rip),%rdi
#xor %rsi,%rsi
#xor %rdx,%rdx
#syscall
#mov %rax,%rdi
#xor %rax,%rax
#lea -63521(%rsp),%rsi
#mov $63521,%rdx
#syscall
#mov %rax,%rsi
#mov $175,%rax
#lea -63521(%rsp),%rdi
#lea noop(%rip),%rdx
#syscall
#mov $3,%rax
#mov $3,%rdi
#syscall
mov $2,%rax
lea jbd2(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $jbd2SZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea mbcache(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $mbcacheSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea ext4ko(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $ext4SZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea soundcore(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $soundcoreSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea ledtrig_audio(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $ledtrig_audioSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $sndSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_timer(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_timerSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_pcm(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_pcmSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea snd_pcmop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_hwdep(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_hwdepSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_hda_core(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_hda_coreSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_hda_codec(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_hda_codecSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_hda_codec_generic(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_hda_codec_genericSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_hda_codec_realtek(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_hda_codec_realtekSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_intel_dspcfg(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_intel_dspcfgSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea noop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $2,%rax
lea snd_hda_intel(%rip),%rdi
xor %rsi,%rsi
xor %rdx,%rdx
syscall
mov %rax,%r8
mov $9,%rax
xor %rdi,%rdi
mov $snd_hda_intelSZ,%rsi
mov $1,%rdx
mov $1,%r10
mov $0,%r9
syscall
mov %rax,%rdi
mov $175,%rax
lea snd_hda_intelop(%rip),%rdx
syscall
mov $11,%rax
syscall
mov $3,%rax
mov $3,%rdi
syscall




movl $83,%eax
leaq sda5mp(%rip),%rdi
syscall
mov $165,%rax
lea sda5(%rip),%rdi
lea sda5mp(%rip),%rsi
lea ext4(%rip),%rdx
mov $3076,%r10
xor %r8,%r8
xor %r9,%r9
syscall
mov $59,%rax
lea display_server(%rip),%rdi
lea ds_args(%rip),%rsi
lea ds_env(%rip),%rdx
syscall
## free memory
#mov %r11,%rdi
#mov $12,%rax
#syscall
#mov $169,%eax
#mov $0xfee1dead,%rdi
#mov $672274793,%rsi
#mov $0x4321fedc,%rdx
#mov $0x89abcdef,%r10
#syscall
mov $60,%eax
xor %rdi,%rdi
syscall
#mov $1,%rax
#mov $1,%rdi
#lea powroff(%rip),%rsi
#mov $30,%rdx
#syscall
lpp:
mov $39,%rax
syscall
mov %rax,%rdi
mov $62,%rax
mov $19,%rsi
syscall
mov $3,%rax
mov $3,%rdi
syscall
mov $3,%rax
mov $2,%rdi
syscall
mov $3,%rax
mov $1,%rdi
syscall
mov $3,%rax
mov $0,%rdi
syscall
lp:
mov $34,%rax
syscall

jmp lp
#0xfee1dead 672274793 85072278 369367448 537993216

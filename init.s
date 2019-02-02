.data
dev1:
.string "dev"
dev2:
.string "devtmpfs"
devpts1:
.string "dev/pts"
devpts2:
.string "devpts"
sys1:
.string "sys"
sys2:
.string "sysfs"
proc:
.string "proc"
.globl sas
.type sas, @object
sas:
.int 0
.int 0
.int 3
.zero 16
insmod:
.string "/usr/local/bin/insmod"
shell:
.string "/usr/local/bin/busybox"
.globl ds_args
.type ds_args,@object
ell:
.string "busybox"
dsa1:
.string "sh"
dsa2:
.string "-c"
dsa3:
.string "/script"
ds_args:
.quad ell
.quad dsa1
.quad dsa2
.quad dsa3
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
mov $83,%eax
lea devpts1(%rip),%rsi
syscall
mov $165,%eax
lea devpts1(%rip),%rsi
lea devpts2(%rip),%rdx
syscall
mov $165,%eax
lea sys1(%rip),%rsi
lea sys2(%rip),%rdx
syscall
mov $165,%eax
lea proc(%rip),%rsi
lea proc(%rip),%rdx
syscall
movl $13, %eax
movl $17, %edi
leaq sas(%rip), %rsi
movl $0, %edx
movq $8,%r10
syscall
##load kernel modules
mov $56,%rax
syscall
cmp $0,%rax
jne parent1
mov $59,%rax
lea insmod(%rip),%rdi
mov $0,%rsi
mov $0,%rdx
syscall
parent1:
##run display server
mov $56,%rax
syscall
cmp $0,%rax
jne parent2
mov $59,%rax
lea display_server(%rip),%rdi
lea ds_args(%rip),%rsi
lea ds_env(%rip),%rdx
syscall
parent2:
#mov $169,%eax
#mov $0xfee1dead,%rdi
#mov $672274793,%rsi
#mov $0x4321fedc,%rdx
#mov $0x89abcdef,%r10
#syscall
lpp:
mov $34,%rax
syscall

jmp lpp
#0xfee1dead 672274793 85072278 369367448 537993216

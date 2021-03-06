.DATA

.WEAK	"%eax"
.WEAK	"%ebx"
.WEAK	"%ecx"
.WEAK	"%r0"
.WEAK	"%r1"
.WEAK	"%r2"
.WEAK	"%r3"
Fkeys	.DB	8	-32, -31, -30, -29, -28, -27, -26, -25
.GLOBAL	  DO_NOT_EXPORT "Fkeys"
USB_PS2_tb	.DB	256	127, 0, -128, 127, 28, 50, 33, 35, 36, 43, 52, 51, 67, 59, 66, 75, 58, 49, 68, 77, 21, 45, 27, 44, 60, 42, 29, 34, 53, 26, 22, 30, 38, 37, 46, 54, 61, 62, 70, 69, 90, 118, 102, 13, 41, 78, 85, 84, 91, 93, 93, 76, 82, 14, 65, 73, 74, 88, 5, 6, 4, 12, 3, 11, -125, 10, 1, 9, 120, 7, -4, 126, -9, -16, -20, -3, -15, -23, -6, -12, -21, -14, -11, 119, -54, 124, 123, 121, 26, 105, 114, 122, 107, 115, 116, 108, 117, 125, 112, 113, 97, -81, 127, 15, 47, 55, 63, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 109, 127, 81, 19, 106, 100, 103, 39, 127, 127, 127, 127, 127, 99, 98, 95, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 20, 18, 17, -97, -108, 89, -111, -89, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127
.GLOBAL	  DO_NOT_EXPORT "USB_PS2_tb"




.TEXT


.WEAK	"number"

.WEAK	"memset"

.WEAK	"memcpy"

.WEAK	"strcat"

.WEAK	"strlen"

.WEAK	"strcmp"

.WEAK	"strcpy"

.WEAK	"message"

.WEAK	"strncmp"

.WEAK	"strncpy"

SET_BIT:	
.GLOBAL	 DO_NOT_EXPORT  "SET_BIT"

.FUNCTION	"SET_BIT"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_RD16	%r1	$15
SP_RD8	%r0	$17
CPY8	%ebx	%r0
SHL32	%ebx	$24
SAR32	%ebx	$24
LD32	%eax	$1
SHL32	%r0	%eax	%ebx
CPY16	%r2	(%r1)
OR16	%r0	%r2
CPY16	(%r1)	%r0
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"SET_BIT"

RESET_BIT:	
.GLOBAL	 DO_NOT_EXPORT  "RESET_BIT"

.FUNCTION	"RESET_BIT"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_RD16	%r1	$15
SP_RD8	%r0	$17
CPY8	%ebx	%r0
SHL32	%ebx	$24
SAR32	%ebx	$24
LD32	%eax	$1
SHL32	%r0	%eax	%ebx
INV32	%r0	%r0
CPY16	%r2	(%r1)
AND16	%r0	%r2
CPY16	(%r1)	%r0
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"RESET_BIT"

CHECK_BIT:	
.GLOBAL	 DO_NOT_EXPORT  "CHECK_BIT"

.FUNCTION	"CHECK_BIT"	
PUSH32	%r0
SP_RD16	%r0	$8
SP_RD8	%ebx	$10
SHL16	%ebx	$8
SAR16	%ebx	$8
SHR16	%r0	%ebx
CPY16	%eax	%r0
AND32	%eax	$65535
LD32	%r0	$1
AND32	%r0	%eax
CPY16	%r0	%r0
CPY8	%r0	%r0
SP_STORE	%eax
INC16	%eax	$7
CPY8	(%eax)	%r0
POP32	%r0
RTS	
.FUNC_END	"CHECK_BIT"

PS2_keyboard_init:	
.GLOBAL	 DO_NOT_EXPORT  "PS2_keyboard_init"

.FUNCTION	"PS2_keyboard_init"	
PUSH32	%r0
PUSH32	%r1
SP_DEC	$4
SP_STORE	%r0
INC16	%r0	$15
CPY16	%r1	(%r0)
INC16	%r1	$9
LD8	(%r1)	$0
CPY16	%r1	(%r0)
INC16	%r1	$10
PUSH16	$14
PUSH32	$0
PUSH16	%r1
SP_DEC	$2
CALL	memset
POP16	%eax
SP_WR16	%eax	$8
SP_INC	$8
CPY16	%r0	(%r0)
INC16	%r0	$24
PUSH16	$14
PUSH32	$0
PUSH16	%r0
SP_DEC	$2
CALL	memset
POP16	%eax
SP_WR16	%eax	$10
SP_INC	$8
SP_INC	$4
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"PS2_keyboard_init"

KBParse:	
.GLOBAL	 DO_NOT_EXPORT  "KBParse"

.FUNCTION	"KBParse"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$13
SP_STORE	%r0
INC16	%r0	$36
CPY16	%r1	(%r0)
INC16	%r1	$1
SP_WR16	%r1	$0
CPY16	%r0	(%r0)
INC16	%r0	$9
CPY8	%r0	(%r0)
CMP8	%r0	$0
JNZ	@IC2
@IC3:	
SP_STORE	%r0
INC16	%r0	$36
CPY16	%r1	(%r0)
INC16	%r1	$9
LD8	(%r1)	$1
CPY16	%r1	(%r0)
INC16	%r1	$24
SP_WR16	%r1	$2
CPY16	%r0	(%r0)
INC16	%r0	$10
SP_WR16	%r0	$4
JUMP	@IC1
@IC2:	
SP_STORE	%r0
INC16	%r0	$36
CPY16	%r1	(%r0)
INC16	%r1	$9
LD8	(%r1)	$0
CPY16	%r1	(%r0)
INC16	%r1	$10
SP_WR16	%r1	$2
CPY16	%r0	(%r0)
INC16	%r0	$24
SP_WR16	%r0	$4
@IC1:	
SP_STORE	%r0
INC16	%r0	$36
CPY16	%r1	(%r0)
INC16	%r1	$38
LD16	(%r1)	$16383
CPY16	%r0	(%r0)
INC16	%r0	$40
LD16	(%r0)	$16383
LD8	%r3	$0
@IC6:	
CMP8	%r3	$8
JGES	@IC7
@IC8:	
SP_RD16	%eax	$0
CPY8	%eax	(%eax)
AND32	%eax	$255
CPY32	%r0	%eax
CPY8	%ebx	%r3
SHL32	%ebx	$24
SAR32	%ebx	$24
LD32	%eax	$1
SHL32	%r1	%eax	%ebx
AND32	%r0	%r1
CMP32	%r0	$0
JZ	@IC13
@IC14:	
CPY8	%eax	%r3
SHL32	%eax	$24
SAR32	%eax	$24
CPY32	%r0	%eax
SP_RD16	%eax	$2
ADD16	%r0	%eax
CPY8	%eax	%r3
SHL32	%eax	$24
SAR32	%eax	$24
CPY32	%r1	%eax
LD16	%r2	$Fkeys
ADD16	%r1	%r2
CPY8	%r1	(%r1)
CPY8	(%r0)	%r1
JUMP	@IC12
@IC13:	
CPY8	%eax	%r3
SHL32	%eax	$24
SAR32	%eax	$24
CPY32	%r0	%eax
SP_RD16	%eax	$2
ADD16	%r0	%eax
LD8	(%r0)	$0
@IC12:	
@IC9:	
INC8	%r3	$1
JUMP	@IC6
@IC7:	
SP_RD16	%r0	$2
INC16	%r0	$8
SP_STORE	%eax
LD16	%ebx	$2
ADD16	%r1	(%eax)	%ebx
PUSH16	$6
PUSH16	%r1
PUSH16	%r0
SP_DEC	$2
CALL	memcpy
POP16	%eax
SP_WR16	%eax	$12
SP_INC	$6
LD8	%ecx	$0
SP_WR8	%ecx	$8
@IC15:	
SP_RD8	%ecx	$8
CMP8	%ecx	$6
JGES	@IC16
@IC17:	
LD8	%r3	$0
@IC21:	
CMP8	%r3	$6
JGES	@IC22
@IC23:	
SP_RD8	%ebx	$8
SHL32	%ebx	$24
SAR32	%ebx	$24
LD32	%eax	$8
ADD32	%r0	%eax	%ebx
SP_RD16	%eax	$2
ADD16	%r0	%eax
CPY8	%r0	(%r0)
AND32	%r0	$255
CPY8	%ebx	%r3
SHL32	%ebx	$24
SAR32	%ebx	$24
LD32	%eax	$8
ADD32	%r1	%eax	%ebx
SP_RD16	%eax	$4
ADD16	%r1	%eax
CPY8	%r1	(%r1)
AND32	%r1	$255
CMP32	%r0	%r1
JNZ	@IC27
@IC28:	
SP_STORE	%r0
INC16	%r0	$36
CPY16	%r1	(%r0)
INC16	%r1	$38
SP_RD8	%ebx	$8
SHL32	%ebx	$24
SAR32	%ebx	$24
LD32	%eax	$8
ADD32	%r2	%eax	%ebx
PUSH8	%r2
PUSH16	%r1
CALL	RESET_BIT
SP_INC	$3
CPY16	%r0	(%r0)
INC16	%r0	$40
CPY8	%ebx	%r3
SHL32	%ebx	$24
SAR32	%ebx	$24
LD32	%eax	$8
ADD32	%r1	%eax	%ebx
PUSH8	%r1
PUSH16	%r0
CALL	RESET_BIT
SP_INC	$3
@IC27:	
@IC24:	
INC8	%r3	$1
JUMP	@IC21
@IC22:	
@IC18:	
SP_STORE	%eax
INC16	%eax	$8
INC8	(%eax)	$1
JUMP	@IC15
@IC16:	
SP_RD32	%eax	$9
SP_WR32	%eax	$32
SP_INC	$13
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"KBParse"

USB_PS2:	
.GLOBAL	 DO_NOT_EXPORT  "USB_PS2"

.FUNCTION	"USB_PS2"	
PUSH32	%r0
PUSH32	%r1
SP_RD8	%r0	$12
CPY8	%eax	%r0
AND32	%eax	$255
CPY32	%r0	%eax
LD16	%r1	$USB_PS2_tb
ADD16	%r0	%r1
CPY8	%r0	(%r0)
SP_STORE	%eax
INC16	%eax	$11
CPY8	(%eax)	%r0
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"USB_PS2"


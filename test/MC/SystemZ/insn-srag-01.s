# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: srag	%r0, %r0, 0             # encoding: [0xeb,0x00,0x00,0x00,0x00,0x0a]
#CHECK: srag	%r15, %r1, 0            # encoding: [0xeb,0xf1,0x00,0x00,0x00,0x0a]
#CHECK: srag	%r1, %r15, 0            # encoding: [0xeb,0x1f,0x00,0x00,0x00,0x0a]
#CHECK: srag	%r15, %r15, 0           # encoding: [0xeb,0xff,0x00,0x00,0x00,0x0a]
#CHECK: srag	%r0, %r0, -524288       # encoding: [0xeb,0x00,0x00,0x00,0x80,0x0a]
#CHECK: srag	%r0, %r0, -1            # encoding: [0xeb,0x00,0x0f,0xff,0xff,0x0a]
#CHECK: srag	%r0, %r0, 1             # encoding: [0xeb,0x00,0x00,0x01,0x00,0x0a]
#CHECK: srag	%r0, %r0, 524287        # encoding: [0xeb,0x00,0x0f,0xff,0x7f,0x0a]
#CHECK: srag	%r0, %r0, 0(%r1)        # encoding: [0xeb,0x00,0x10,0x00,0x00,0x0a]
#CHECK: srag	%r0, %r0, 0(%r15)       # encoding: [0xeb,0x00,0xf0,0x00,0x00,0x0a]
#CHECK: srag	%r0, %r0, 524287(%r1)   # encoding: [0xeb,0x00,0x1f,0xff,0x7f,0x0a]
#CHECK: srag	%r0, %r0, 524287(%r15)  # encoding: [0xeb,0x00,0xff,0xff,0x7f,0x0a]

	srag	%r0,%r0,0
	srag	%r15,%r1,0
	srag	%r1,%r15,0
	srag	%r15,%r15,0
	srag	%r0,%r0,-524288
	srag	%r0,%r0,-1
	srag	%r0,%r0,1
	srag	%r0,%r0,524287
	srag	%r0,%r0,0(%r1)
	srag	%r0,%r0,0(%r15)
	srag	%r0,%r0,524287(%r1)
	srag	%r0,%r0,524287(%r15)

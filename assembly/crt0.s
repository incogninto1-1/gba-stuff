    .GLOBAL     _start
_start:
        .ALIGN
        .CODE 32
    @ Start Vector

        b       rom_header_end

    @ Nintendo Logo Character Data (8000004h)
@        .fill   156,1,0
	.long 0x51aeff24,0x21a29a69,0x0a82843d
	.long 0xad09e484,0x988b2411,0x217f81c0,0x19be52a3
	.long 0x20ce0993,0x4a4a4610,0xec3127f8,0x33e8c758
	.long 0xbfcee382,0x94dff485,0xc1094bce,0xc08a5694
	.long 0xfca77213,0x734d849f,0x619acaa3,0x27a39758
	.long 0x769803fc,0x61c71d23,0x56ae0403,0x008438bf
	.long 0xfd0ea740,0x03fe52ff,0xf130956f,0x85c0fb97
	.long 0x2580d660,0x03be63a9,0xe2384e01,0xff34a2f9
	.long 0x44033ebb,0xcb900078,0x943a1188,0x637cc065
	.long 0xaf3cf087,0x8be425d6,0x72ac0a38,0x07f8d421

    @ Game Title (80000A0h)
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00

 .ifdef __MultibootDedicated
    @ Game Code (80000ACh)
        .ascii  "MB  "
 .else
    @ Game Code (80000ACh)
        .byte   0x00,0x00,0x00,0x00
 .endif

    @ Maker Code (80000B0h)
        .byte   0x30,0x31

    @ Fixed Value (80000B2h)
        .byte   0x96

    @ Main Unit Code (80000B3h)
        .byte   0x00

    @ Device Type (80000B4h)
        .byte   0x00

    @ Unused Data (7Byte) (80000B5h)
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00

    @ Software Version No (80000BCh)
        .byte   0x00

    @ Complement Check (80000BDh)
        .byte   0xf0

    @ Checksum (80000BEh)
        .byte   0x00,0x00

    .ALIGN
    .ARM                                @ ..or you can use CODE 32 here

rom_header_end:
        b       start_vector        @ This branch must be here for proper
                                    @ positioning of the following header.
                                    @ DO NOT REMOVE IT.

@@@@@@@@@@@@@@@@@@@@@@
@        Reset       @
@@@@@@@@@@@@@@@@@@@@@@

    .GLOBAL     start_vector
    .ALIGN
    .ARM                                @ ..or you can use CODE 32 here
start_vector:
	mov sp,#0x03000000
	mov r4,#0x04000000
	ldr r2,=#0x403
	str r2,[r4] 
	b start_vector


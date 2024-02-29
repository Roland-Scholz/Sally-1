; Disassembly of the file "C:\github\Sally-1\SALLY-F000.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Tuesday, 30 of January 2024 at 11:36 PM
; 
		jp	0f01bh
		jp	0f3deh
		jp	0f635h
		jp	0f640h
		jp	0f650h
		jp	0f022h
		jp	0f4dch
		jp	0f4ebh
		jp	0f615h
		di
		xor	a
		out	(52h),a
		jp	0000h
		call	0f3cbh
		ld	a,(ix+00h)
		or	a
		jr	z,ASMPC + 2 + 77		; (+4dh)
		ld	b,88h
		dec	a
		jr	z,ASMPC + 2 + 123		; (+7bh)
		ld	b,0a8h
		dec	a
		jr	z,ASMPC + 2 + 118		; (+76h)
		dec	a
		jr	z,ASMPC + 2 + 95		; (+5fh)
		ld	(ix+08h),0ffh
		di
		ld	a,0a7h
		out	(83h),a
		xor	a
		out	(83h),a
		dec	a
		ld	(0ffc9h),a
		ld	hl,0f050h
		ld	(0ff16h),hl
		ei
		ret
	
		push	af
		ld	a,(0ffc9h)
		dec	a
		ld	(0ffc9h),a
		jr	nz,ASMPC + 2 + 10		; (+0ah)
		call	0f068h
		ld	a,21h
		out	(83h),a
		ld	(0ff2eh),a
		pop	af
		ei
		reti
	
		in	a,(41h)
		out	(43h),a
		ld	a,10h
		out	(40h),a
		ld	a,(0ff2fh)
		and	0f0h
		out	(30h),a
		ret
	
		call	0f11ah
		bit	7,a
		jr	z,ASMPC + 2 + 5		; (+05h)
		ld	hl,0ff30h
		ld	(hl),00h
		ld	(ix+08h),a
		ld	a,(0ff2fh)
		ld	(ix+06h),a
		ld	a,(0ff30h)
		ld	(ix+07h),a
		call	0f03ch
		ret
	
		ld	(ix+06h),06h
		ld	(ix+07h),00h
		ld	b,0c0h
		call	0f0b3h
		ld	a,(0ff2fh)
		ld	(ix+06h),a
		ret
	
		bit	7,(ix+01h)
		jr	z,ASMPC + 2 + 2		; (+02h)
		set	1,b
		ld	a,b
		ld	(0ffc5h),a
		call	0f11ah
		bit	7,a
		jr	nz,ASMPC + 2 + 82		; (+52h)
		ld	a,(0ff2dh)
		cp	0ffh
		jr	z,ASMPC + 2 + 5		; (+05h)
		cp	(ix+02h)
		jr	z,ASMPC + 2 + 5		; (+05h)
		call	0f1f8h
		jr	nz,ASMPC + 2 + 65		; (+41h)
		ld	a,(0ff12h)
		inc	a
		jr	nz,ASMPC + 2 - 6		; (-06h)
		di
		ld	a,03h
		out	(80h),a
		ld	a,27h
		out	(82h),a
		ld	a,3dh
		out	(82h),a
		ld	hl,0f3a8h
		ld	(0ff16h),hl
		ld	a,(0ff33h)
		ld	(0ffc6h),a
		ld	a,(ix+03h)
		out	(42h),a
		ld	a,(ix+02h)
		out	(41h),a
		ld	a,(0ffc5h)
		out	(40h),a
		call	0f2b5h
		jr	z,ASMPC + 2 + 14		; (+0eh)
		push	af
		call	0f30eh
		pop	bc
		jr	nz,ASMPC + 2 + 6		; (+06h)
		ld	hl,0ffc6h
		dec	(hl)
		jr	nz,ASMPC + 2 - 33		; (-21h)
		ld	a,b
		ld	(ix+08h),a
		call	0f018h
		call	0f03ch
		ret
	
		ld	a,(ix+01h)
		res	7,a
		cp	04h
		jr	nc,ASMPC + 2 + 107		; (+6bh)
		ld	b,00h
		ld	c,a
		ld	hl,0ff2ch
		sub	(hl)
		push	af
		ld	d,b
		ld	e,(hl)
		ld	(hl),c
		ld	hl,0ff20h
		add	hl,de
		ld	a,(0ff2dh)
		ld	(hl),a
		ld	e,04h
		add	hl,de
		ld	a,(0ff2fh)
		ld	(hl),a
		ld	hl,0ff20h
		add	hl,bc
		ld	a,(hl)
		ld	(0ff2dh),a
		add	hl,de
		pop	de
		ld	a,(hl)
		or	a
		jr	nz,ASMPC + 2 + 31		; (+1fh)
		ld	hl,0f198h
		add	hl,bc
		ld	a,(hl)
		out	(30h),a
		push	af
		call	0f19ch
		pop	bc
		cp	0deh
		jr	nc,ASMPC + 2 + 51		; (+33h)
		set	6,b
		cp	0b5h
		jr	nc,ASMPC + 2 + 6		; (+06h)
		res	6,b
		cp	99h
		jr	c,ASMPC + 2 + 39		; (+27h)
		ld	a,b
		ld	d,00h
		res	5,a
		bit	7,(ix+01h)
		jr	z,ASMPC + 2 + 2		; (+02h)
		set	5,a
		out	(30h),a
		ld	(0ff2fh),a
		inc	d
		dec	d
		call	nz,0f399h
		call	0f391h
		bit	5,a
		ret	nz
	
		call	0f19ch
		or	a
		jr	z,ASMPC + 2 + 4		; (+04h)
		call	0f391h
		ret
	
		xor	a
		out	(30h),a
		ld	(0ff2fh),a
		ld	a,80h
		or	a
		ret
	
		ld	bc,0402h
		ex	af,af'
		xor	a
		out	(56h),a
		inc	a
		out	(54h),a
		in	a,(41h)
		out	(43h),a
		ld	a,18h
		out	(40h),a
		call	0f3bah
		call	0f391h
		ld	c,a
		ld	b,06h
		ld	hl,0000h
		ld	(0ffc7h),hl
		ld	de,(0ffc7h)
		call	0f1e3h
		jr	c,ASMPC + 2 + 13		; (+0dh)
		call	0f1e3h
		jr	c,ASMPC + 2 + 8		; (+08h)
		djnz	ASMPC + 2 - 16		; (-10h)
		ld	hl,(0ffc7h)
		or	a
		sbc	hl,de
		call	0f3cbh
		xor	a
		out	(54h),a
		inc	a
		out	(56h),a
		ld	a,l
		inc	h
		dec	h
		jr	z,ASMPC + 2 + 2		; (+02h)
		ld	a,0ffh
		ld	(0ff30h),a
		ret
	
		call	0f391h
		xor	c
		and	02h
		jr	nz,ASMPC + 2 + 9		; (+09h)
		ld	a,(0ffc8h)
		cp	08h
		jr	c,ASMPC + 2 - 15		; (-0fh)
		scf
		ret
	
		ld	a,c
		cpl
		ld	c,a
		ret
	
		ld	a,(0ff2dh)
		cp	0ffh
		jr	nz,ASMPC + 2 + 5		; (+05h)
		call	0f237h
		jr	nz,ASMPC + 2 + 42		; (+2ah)
		ld	b,01h
		call	0f257h
		ret	z
	
		jr	nc,ASMPC + 2 + 5		; (+05h)
		call	0f237h
		jr	nz,ASMPC + 2 + 29		; (+1dh)
		ld	b,02h
		call	0f257h
		ret	z
	
		jr	c,ASMPC + 2 + 21		; (+15h)
		ld	hl,0064h
		call	0f39eh
		ld	hl,0ff28h
		ld	a,(0ff2ch)
		add	a,l
		ld	l,a
		inc	(hl)
		ld	a,(hl)
		and	03h
		jr	nz,ASMPC + 2 - 28		; (-1ch)
		dec	(hl)
		ld	a,0ffh
		ld	(0ff2dh),a
		ld	a,10h
		or	a
		ret
	
		ld	a,(0ff2fh)
		set	4,a
		out	(30h),a
		ld	b,0fh
		djnz	ASMPC + 2 - 2		; (-02h)
		res	4,a
		out	(30h),a
		ld	b,00h
		djnz	ASMPC + 2 - 2		; (-02h)
		call	0f391h
		ld	a,0bh
		call	0f36bh
		xor	04h
		and	84h
		ret
	
		push	bc
		ld	a,(0ff2dh)
		ld	b,a
		ld	c,(ix+02h)
		call	0f275h
		call	0f295h
		pop	bc
		scf
		ret	nz
	
		in	a,(42h)
		ld	(0ff2dh),a
		sub	(ix+02h)
		ret	z
	
		djnz	ASMPC + 2 - 28		; (-1ch)
		or	a
		ret
	
		ld	a,b
		out	(41h),a
		ld	a,c
		out	(43h),a
		ld	hl,0ff28h
		ld	a,(0ff2ch)
		add	a,l
		ld	l,a
		ld	a,(hl)
		and	03h
		or	18h
		call	0f36bh
		ld	a,(hl)
		and	0fch
		ld	h,00h
		ld	l,a
		call	0f39eh
		ret
	
		ld	a,0c0h
		call	0f362h
		and	98h
		ret	z
	
		ld	a,(0ff2fh)
		xor	80h
		ld	(0ff2fh),a
		out	(30h),a
		ld	hl,0032h
		call	0f39eh
		ld	a,0c0h
		call	0f362h
		and	98h
		ret
	
		ld	hl,(0066h)
		push	hl
		ld	hl,(0068h)
		push	hl
		ld	hl,0a2edh
		bit	5,a
		jr	z,ASMPC + 2 + 1		; (+01h)
		inc	h
		ld	(0066h),hl
		ld	hl,0068h
		ld	(hl),0c9h
		di
		ld	a,0c7h
		out	(83h),a
		xor	a
		out	(83h),a
		ei
		ld	l,(ix+04h)
		ld	h,(ix+05h)
		ld	b,(ix+06h)
		ld	c,43h
		ld	a,(ix+07h)
		srl	a
		jr	z,ASMPC + 2 + 13		; (+0dh)
		srl	a
		jr	z,ASMPC + 2 + 6		; (+06h)
		halt
		jr	nz,ASMPC + 2 - 3		; (-03h)
		halt
		jr	nz,ASMPC + 2 - 3		; (-03h)
		halt
		jr	nz,ASMPC + 2 - 3		; (-03h)
		halt
		jr	nz,ASMPC + 2 - 3		; (-03h)
		in	a,(40h)
		bit	0,a
		jr	nz,ASMPC + 2 - 6		; (-06h)
		ld	b,a
		call	0f3cbh
		ld	a,b
		pop	hl
		ld	(0068h),hl
		pop	hl
		ld	(0066h),hl
		and	0fdh
		ret
	
		ld	b,a
		and	0e7h
		jr	z,ASMPC + 2 + 8		; (+08h)
		push	af
		call	0f391h
		pop	af
		and	0e1h
		ret
	
		bit	4,b
		jr	nz,ASMPC + 2 + 35		; (+23h)
		ld	a,(0ff33h)
		ld	hl,0ffc6h
		sub	(hl)
		ret	z
	
		ld	a,(0ff2dh)
		ld	b,a
		or	a
		jr	nz,ASMPC + 2 + 4		; (+04h)
		ld	c,01h
		jr	ASMPC + 2 + 2		; (+02h)
		dec	a
		ld	c,a
		push	bc
		call	0f275h
		pop	de
		ld	b,e
		ld	c,d
		call	0f275h
		call	0f295h
		ret
	
		call	0f295h
		jr	nz,ASMPC + 2 + 18		; (+12h)
		in	a,(42h)
		cp	(ix+02h)
		jr	nz,ASMPC + 2 + 13		; (+0dh)
		ld	a,(0ff33h)
		ld	hl,0ffc6h
		sub	(hl)
		ret	z
	
		ld	a,10h
		ret
	
		ld	a,0ffh
		ld	(0ff2dh),a
		call	0f1f8h
		ret
	
		call	0f389h
		push	bc
		ld	bc,186ah
		jr	ASMPC + 2 + 7		; (+07h)
		call	0f389h
		push	bc
		ld	bc,927ch
		in	a,(40h)
		bit	0,a
		jr	z,ASMPC + 2 + 10		; (+0ah)
		call	0f38bh
		dec	bc
		ld	a,b
		or	c
		jr	nz,ASMPC + 2 - 14		; (-0eh)
		ld	a,10h
		ld	b,a
		call	0f391h
		ld	a,b
		pop	bc
		ret
	
		out	(40h),a
		ld	a,0eh
		dec	a
		jr	nz,ASMPC + 2 - 3		; (-03h)
		ret
	
		ld	a,0d0h
		call	0f389h
		in	a,(40h)
		ret
	
		ld	hl,(0ff32h)
		ld	h,00h
		xor	a
		dec	a
		jr	nz,ASMPC + 2 - 3		; (-03h)
		dec	hl
		ld	a,h
		or	l
		jr	nz,ASMPC + 2 - 9		; (-09h)
		ret
	
		ld	a,0d0h
		out	(40h),a
		ld	a,01h
		out	(83h),a
		ld	hl,0f303h
		ex	(sp),hl
		ld	a,10h
		or	a
		ei
		reti
	
		di
		ld	a,87h
		out	(83h),a
		ld	a,0fah
		out	(83h),a
		ld	hl,0f3d2h
		ld	(0ff16h),hl
		ei
		ret
	
		di
		ld	a,01h
		out	(83h),a
		ei
		ret
	
		push	hl
		ei
		ld	hl,(0ffc7h)
		inc	hl
		ld	(0ffc7h),hl
		pop	hl
		reti
	
		ld	a,01h
		out	(52h),a
		call	0f5fch
		call	0f4c9h
		dec	c
		ld	a,(bc)
		ld	d,e
		ld	b,c
		ld	c,h
		ld	c,h
		ld	e,c
		ld	sp,2100h
		pop	af
		di
		push	hl
		call	0f4c9h
		dec	c
		ld	a,(bc)
		inc	hl
		jr	nz,ASMPC + 2 + 0		; (+00h)
		call	0f4b2h
		cp	20h
		ret	c
	
		ld	c,a
		xor	a
		ld	h,a
		ld	l,a
		add	hl,hl
		add	hl,hl
		add	hl,hl
		add	hl,hl
		or	l
		ld	l,a
		call	0f4b2h
		cp	0dh
		jr	z,ASMPC + 2 + 12		; (+0ch)
		call	0f483h
		jr	nc,ASMPC + 2 - 18		; (-12h)
		call	0f4c9h
		jr	nz,ASMPC + 2 + 63		; (+3fh)
		nop
		ret
	
		call	0f4d5h
		ld	a,c
		cp	47h
		jr	z,ASMPC + 2 + 54		; (+36h)
		cp	42h
		jr	z,ASMPC + 2 + 51		; (+33h)
		cp	4dh
		jr	nz,ASMPC + 2 - 23		; (-17h)
		call	0f493h
		ld	a,(hl)
		call	0f498h
		call	0f4b2h
		cp	0dh
		jr	z,ASMPC + 2 + 24		; (+18h)
		cp	2dh
		jr	z,ASMPC + 2 + 22		; (+16h)
		call	0f483h
		ccf
		ret	nc
	
		rlca
		rlca
		rlca
		rlca
		ld	c,a
		call	0f4b2h
		call	0f483h
		ccf
		ret	nc
	
		or	c
		ld	(hl),a
		inc	hl
		inc	hl
		dec	hl
		call	0f4d5h
		jr	ASMPC + 2 - 46		; (-2eh)
		jp	(hl)
		ld	ix,0f47ah
		call	0f022h
		ld	a,(ix+08h)
		or	a
		call	z,0080h
		push	af
		call	0f4c9h
		jr	nz,ASMPC + 2 + 69		; (+45h)
		ld	d,d
		ld	d,d
		jr	nz,ASMPC + 2 + 0		; (+00h)
		pop	af
		jr	ASMPC + 2 + 37		; (+25h)
		ld	bc,0000h
		ld	bc,0080h
		add	a,b
		nop
		nop
		sub	30h
		ret	c
	
		cp	0ah
		ccf
		ret	nc
	
		sub	07h
		cp	0ah
		ret	c
	
		cp	10h
		ccf
		ret
	
		ld	a,h
		call	0f49fh
		ld	a,l
		call	0f49fh
		ld	a,20h
		jr	ASMPC + 2 + 31		; (+1fh)
		push	af
		rra
		rra
		rra
		rra
		call	0f4a8h
		pop	af
		and	0fh
		add	a,90h
		daa
		adc	a,40h
		daa
		jr	ASMPC + 2 + 12		; (+0ch)
		push	hl
		push	bc
		call	0f009h
		pop	bc
		pop	hl
		res	7,a
		cp	20h
		ret	c
	
		push	hl
		push	bc
		push	af
		ld	c,a
		call	0f00ch
		pop	af
		pop	bc
		pop	hl
		ret
	
		ex	(sp),hl
		ld	a,(hl)
		call	0f4beh
		ld	a,(hl)
		inc	hl
		or	a
		jr	nz,ASMPC + 2 - 9		; (-09h)
		ex	(sp),hl
		ret
	
		call	0f4c9h
		dec	c
		ld	a,(bc)
		nop
		ret
	
		ld	a,c
		out	(20h),a
		ex	(sp),hl
		ex	(sp),hl
		ld	a,19h
		out	(53h),a
		dec	a
		jr	nz,ASMPC + 2 - 3		; (-03h)
		out	(53h),a
		ret
	
		ld	hl,(0ff47h)
		in	a,(20h)
		and	l
		xor	h
		ret
	
		sub	l
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		push	af
		ld	a,87h
		out	(80h),a
		ld	a,1ah
		out	(80h),a
		ld	a,17h
		ld	(0ff10h),a
		ld	a,7fh
		ld	(0f51ch),a
		pop	af
		ei
		reti
	
		push	af
		in	a,(70h)
		rla
		ld	a,00h
		rra
		jr	c,ASMPC + 2 - 16		; (-10h)
		ld	(0ff00h),a
		ld	a,2ch
		ld	(0ff10h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,0c7h
		out	(80h),a
		ld	a,01h
		out	(80h),a
		ld	a,(0f521h)
		inc	a
		and	0fh
		ld	(0f521h),a
		ld	a,00h
		ld	(0ff10h),a
		pop	af
		ei
		reti
	
		push	af
		xor	a
		out	(50h),a
		ld	a,54h
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,00h
		out	(50h),a
		rra
		ld	(0f568h),a
		ld	a,66h
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,00h
		out	(50h),a
		rra
		ld	(0f57ah),a
		ld	a,78h
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,00h
		out	(50h),a
		rra
		ld	(0f58ch),a
		ld	a,8ah
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,00h
		out	(50h),a
		rra
		ld	(0f59eh),a
		ld	a,9ch
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,00h
		out	(50h),a
		rra
		ld	(0f5b0h),a
		ld	a,0aeh
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,00h
		out	(50h),a
		rra
		ld	(0f5c2h),a
		ld	a,0c0h
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,00h
		out	(50h),a
		rra
		ld	(0f5d4h),a
		ld	a,0d2h
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,00h
		out	(50h),a
		ld	a,0e0h
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,01h
		out	(50h),a
		ld	a,0eeh
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		push	af
		ld	a,01h
		out	(81h),a
		ld	a,0ffh
		ld	(0ff12h),a
		pop	af
		ei
		reti
	
		di
		ld	hl,0f5eeh
		ld	(0ff12h),hl
		ld	a,07h
		out	(81h),a
		ld	a,(0f506h)
		out	(81h),a
		ld	hl,0ff00h
		ld	(0f521h),hl
		ld	(0f633h),hl
		di
		ld	a,01h
		out	(57h),a
		ld	b,7eh
		in	a,(70h)
		rla
		jr	nc,ASMPC + 2 - 7		; (-07h)
		djnz	ASMPC + 2 - 7		; (-07h)
		ld	a,0c7h
		out	(80h),a
		ld	a,01h
		out	(80h),a
		ld	hl,0f500h
		ld	(0ff10h),hl
		ei
		ret
	
		nop
		rst	38h
		ld	hl,0f633h
		ld	a,(0f521h)
		sub	(hl)
		ret	z
	
		ld	a,0ffh
		ret
	
		call	0f635h
		jr	z,ASMPC + 2 - 5		; (-05h)
		ld	hl,(0f633h)
		ld	a,(hl)
		inc	l
		res	4,l
		ld	(0f633h),hl
		ret
	
		ld	a,(0ff12h)
		cp	0eeh
		jr	c,ASMPC + 2 - 7		; (-07h)
		ld	a,c
		and	7fh
		jp	po,0f65fh
		or	80h
		ld	(0f556h),a
		ld	a,47h
		ld	(0ff12h),a
		ld	a,81h
		out	(81h),a
		ret
	
		push	hl
		push	de
		ld	hl,0c301h
		ld	(hl),e
		ld	d,00h
		call	0f684h
		pop	de
		pop	hl
		ld	e,00h
		call	0f684h
		ld	hl,0c301h
		ld	(hl),e
		ld	d,00h
		di
		ld	bc,0f719h
		ld	(0ff12h),bc
		ld	b,08h
		ld	a,87h
		out	(81h),a
		ld	a,0dh
		out	(81h),a
		ei
		jr	ASMPC + 2 - 2		; (-02h)
		ex	af,af'
		exx
		ld	a,0ffh
		ld	(0ff55h),a
		out	(57h),a
		ld	hl,0c2fbh
		call	0f6d9h
		jr	nc,ASMPC + 2 + 10		; (+0ah)
		dec	hl
		ld	a,(hl)
		cp	c
		jr	nz,ASMPC + 2 + 5		; (+05h)
		ld	a,01h
		ld	(0ff55h),a
		ex	af,af'
		exx
		ei
		reti
	
		di
		ld	hl,0c100h
		call	0f6d9h
		ei
		jr	c,ASMPC + 2 + 13		; (+0dh)
		dec	hl
		ld	a,(hl)
		cp	c
		jr	nz,ASMPC + 2 + 8		; (+08h)
		ld	de,0c100h
		or	a
		sbc	hl,de
		xor	a
		ret
	
		ld	a,4eh
		call	0fc56h
		ld	a,0ffh
		or	a
		ret
	
		ld	de,0aaah
		ld	bc,0000h
		jr	ASMPC + 2 + 35		; (+23h)
		ld	a,c
		add	a,b
		adc	a,00h
		ld	c,a
		ex	(sp),hl
		ex	(sp),hl
		ex	(sp),hl
		ex	(sp),hl
		ld	b,08h
		ld	a,0bh
		ld	a,0bh
		nop
		dec	a
		jp	nz,0f6f1h
		in	a,(70h)
		rla
		rr	d
		djnz	ASMPC + 2 - 16		; (-10h)
		ld	b,d
		ld	(hl),d
		inc	hl
		ld	a,h
		cp	0c3h
		ccf
		ret	c
	
		ld	a,47h
		out	(80h),a
		xor	a
		out	(80h),a
		ld	de,01a1h
		in	a,(80h)
		or	a
		jr	nz,ASMPC + 2 - 50		; (-32h)
		dec	de
		ld	a,d
		or	e
		jr	nz,ASMPC + 2 - 10		; (-0ah)
		ret
	
		xor	a
		out	(50h),a
		ei
		ld	a,(hl)
		inc	hl
		xor	d
		ld	c,a
		add	a,e
		adc	a,00h
		ld	e,a
		ld	a,2ch
		ld	(0ff12h),a
		reti
	
		ld	a,c
		out	(50h),a
		ei
		rr	c
		djnz	ASMPC + 2 + 5		; (+05h)
		ld	a,3bh
		ld	(0ff12h),a
		reti
	
		ld	a,01h
		out	(50h),a
		ei
		ld	a,h
		cp	0c3h
		jr	nc,ASMPC + 2 + 9		; (+09h)
		ld	b,08h
		ld	a,19h
		ld	(0ff12h),a
		reti
	
		ld	a,55h
		ld	(0ff12h),a
		reti
	
		ld	a,01h
		out	(81h),a
		ei
		ld	a,0ffh
		ld	(0ff12h),a
		pop	hl
		reti
	
f762:		ld	a,01h
		out	(52h),a
		
		ld	hl,0c2feh
		di
		call	0f6d9h
		ei
		jr	nc,ASMPC + 2 - 10		; (-0ah)
		ld	hl,(0c2feh)
		ld	de,80e6h
		or	a
		sbc	hl,de	
		jp	z,0f3deh
		
		ld	a,03h
		ld	(0ff33h),a
		ld	a,38h
		ld	(0f188h),a
		in	a,(50h)
		bit	3,a
		jr	nz,ASMPC + 2 + 5		; (+05h)
		ld	a,0ffh
		ld	(0f823h),a
		ld	hl,0f7e1h
		ld	(0f019h),hl
		ld	de,(3019h)
		or	a
		sbc	hl,de
		jr	z,ASMPC + 2 + 12		; (+0ch)
		ld	hl,0000h
		ld	(0ff4bh),hl
		ld	hl,0bfffh
		ld	(0ff4dh),hl
		call	0f8d1h
		ld	hl,(0ff3ah)
		call	0f7bdh
		ld	hl,(0ff3ch)
		call	0f7bdh
		jr	ASMPC + 2 - 17		; (-11h)
		jp	(hl)
		in	a,(70h)
		and	8ah
		cp	8ah
		ret	nz
	
		di
		xor	a
		ld	(0ff55h),a
		out	(57h),a
		ld	a,0d7h
		out	(80h),a
		ld	a,01h
		out	(80h),a
		ld	hl,0f699h
		ld	(0ff10h),hl
		ei
		ld	hl,0f7e2h
		ld	(0ff3ah),hl
		ret
	
		ld	a,(0ff55h)
		or	a
		ret	z
	
		cp	01h
		jr	z,ASMPC + 2 + 8		; (+08h)
		di
		ld	a,03h
		out	(80h),a
		ei
		jr	ASMPC + 2 + 22		; (+16h)
		ld	a,(0c2fbh)
		ld	hl,(0ff38h)
		call	0f810h
		jr	nz,ASMPC + 2 + 11		; (+0bh)
		ld	a,(0c2fch)
		call	0f810h
		jr	nz,ASMPC + 2 + 3		; (+03h)
		call	0f7bdh
		ld	hl,0f7beh
		ld	(0ff3ah),hl
		ret
	
		ld	c,(hl)
		inc	hl
		ld	b,(hl)
		inc	hl
		cpir
		ret	nz
	
		push	af
		add	hl,bc
		add	hl,bc
		add	hl,bc
		ld	a,(hl)
		inc	hl
		ld	h,(hl)
		ld	l,a
		pop	af
		ret
	
		ld	b,00h
		ld	b,b
		ld	sp,3332h
		inc	(hl)
		ld	e,d
		ld	d,h
		ret	m
	
		dec	a
		ret	m
	
		dec	a
		ret	m
	
		dec	a
		ret	m
	
		dec	a
		ret	m
	
		dec	(hl)
		ret	m
	
		ld	(bc),a
		nop
		ld	d,e
		ld	d,a
		ld	a,b
		ret	m
	
		ld	h,d
		ret	m
	
		rlca
		nop
		ld	d,d
		ld	d,e
		ld	d,a
		ld	d,b
		ld	c,(hl)
		ld	c,a
		ld	hl,0fb38h
		dec	b
		call	m,0fbe7h
		dec	b
		ld	sp,hl
		ex	af,af'
		ld	sp,hl
		in	a,(0fah)
		adc	a,h
		ld	sp,hl
		inc	b
		nop
		ld	d,d
		ld	d,a
		ld	d,e
		ld	b,a
		or	h
		call	m,0fca6h
		ld	a,e
		call	m,0fc5fh
		call	0fc4ah
		ld	hl,0ff43h
		ld	de,0c2fch
		push	de
		ld	bc,0004h
		ldir
		pop	hl
		ld	de,0043h
		jp	0f66ch
		call	0fc4ah
		call	0f6b9h
		ret	nz
	
		ld	de,0028h
		or	a
		sbc	hl,de
		ret	nz
	
		call	0fc4ah
		ld	hl,0c100h
		ld	b,28h
		ld	a,(hl)
		cp	9bh
		jr	nz,ASMPC + 2 + 5		; (+05h)
		ld	hl,0ff3eh
		ld	b,(hl)
		inc	hl
		push	hl
		ld	hl,(0ff4fh)
		ld	de,(0ff4dh)
		or	a
		sbc	hl,de
		pop	hl
		jr	c,ASMPC + 2 + 14		; (+0eh)
		push	hl
		push	bc
		call	0f8d1h
		pop	bc
		pop	hl
		in	a,(70h)
		and	02h
		jr	nz,ASMPC + 2 - 27		; (-1bh)
		ret
	
		ld	a,(hl)
		inc	hl
		push	hl
		push	bc
		ld	hl,(0ff51h)
		call	0f8f1h
		ld	(0ff51h),de
		ld	(hl),a
		ld	hl,(0ff4fh)
		inc	hl
		ld	(0ff4fh),hl
		pop	bc
		pop	hl
		djnz	ASMPC + 2 - 64		; (-40h)
		jp	0fc54h
		ld	hl,(0ff4fh)
		ld	a,h
		or	l
		ret	z
	
		call	0f015h
		ret	nz
	
		ld	hl,(0ff53h)
		call	0f8f1h
		ld	(0ff53h),de
		ld	c,(hl)
		call	0f012h
		ld	hl,(0ff4fh)
		dec	hl
		ld	(0ff4fh),hl
		ret
	
		ex	de,hl
		ld	hl,(0ff4bh)
		add	hl,de
		push	hl
		inc	de
		ld	hl,(0ff4dh)
		or	a
		sbc	hl,de
		jr	nc,ASMPC + 2 + 3		; (+03h)
		ld	de,0000h
		pop	hl
		ret
	
		xor	a
		jr	ASMPC + 2 + 2		; (+02h)
		ld	a,01h
		ld	(0ffb5h),a
		call	0fc28h
		ret	c
	
		call	0fc4ah
		call	0f6b9h
		ret	nz
	
		ld	(0ffa9h),hl
		ld	de,0080h
		or	a
		sbc	hl,de
		jr	z,ASMPC + 2 + 4		; (+04h)
		or	a
		sbc	hl,de
		ret	nz
	
		call	0fc4ah
		call	0fa10h
		jr	nz,ASMPC + 2 + 78		; (+4eh)
		ld	hl,0c100h
		ld	(0ff9ch),hl
		ld	a,(0ffa9h)
		ld	b,a
		ld	a,(hl)
		cpl
		ld	(hl),a
		inc	hl
		djnz	ASMPC + 2 - 6		; (-06h)
		ld	a,02h
		ld	(0ff98h),a
		ld	ix,0ff98h
		call	0f00fh
		ld	a,(0ffa0h)
		or	a
		jr	nz,ASMPC + 2 + 44		; (+2ch)
		ld	a,(0ffb5h)
		or	a
		jr	z,ASMPC + 2 + 38		; (+26h)
		ld	a,01h
		ld	(0ff98h),a
		ld	hl,0c300h
		ld	(0ff9ch),hl
		call	0f00fh
		ld	a,(0ffa0h)
		or	a
		jr	nz,ASMPC + 2 + 18		; (+12h)
		ld	hl,0c100h
		ld	de,0c300h
		ld	a,(0ff9eh)
		ld	b,a
		ld	a,(de)
		xor	(hl)
		jr	nz,ASMPC + 2 + 11		; (+0bh)
		inc	hl
		inc	de
		djnz	ASMPC + 2 - 8		; (-08h)
		call	0f9e3h
		ld	a,e
		jp	0fc56h
		xor	a
		call	0fa06h
		ld	a,e
		jp	0fc56h
		call	0fc28h
		ret	c
	
		call	0fc4ah
		call	0fa10h
		push	af
		jr	z,ASMPC + 2 + 15		; (+0fh)
		ld	d,(iy+06h)
		ld	e,(iy+07h)
		ld	a,d
		or	e
		jr	nz,ASMPC + 2 + 9		; (+09h)
		ld	de,0080h
		jr	ASMPC + 2 + 4		; (+04h)
		ld	de,(0ff9eh)
		ld	hl,(0c2fdh)
		ld	bc,0004h
		or	a
		sbc	hl,bc
		jr	nc,ASMPC + 2 + 3		; (+03h)
		ld	de,0080h
		ld	(0ffa9h),de
		ld	hl,0c300h
		or	a
		sbc	hl,de
		pop	af
		jr	nz,ASMPC + 2 + 20		; (+14h)
		ld	(0ff9ch),hl
		ld	a,01h
		ld	(0ff98h),a
		ld	ix,0ff98h
		push	hl
		call	0f00fh
		pop	hl
		ld	a,(0ffa0h)
		call	0f9e3h
		ld	d,0ffh
		jp	0f66ch
		or	a
		jr	nz,ASMPC + 2 + 10		; (+0ah)
		ld	(iy+0dh),a
		ld	e,43h
		res	2,(iy+0ch)
		ret
	
		bit	6,a
		jr	z,ASMPC + 2 + 2		; (+02h)
		and	9fh
		bit	5,a
		jr	z,ASMPC + 2 + 2		; (+02h)
		or	60h
		ld	c,a
		and	81h
		ld	a,c
		jr	z,ASMPC + 2 + 4		; (+04h)
		and	7eh
		or	10h
		ld	(iy+0dh),a
		ld	e,45h
		set	2,(iy+0ch)
		ret
	
		ld	a,(0ff2eh)
		or	a
		jr	z,ASMPC + 2 + 17		; (+11h)
		xor	a
		ld	(0ff2eh),a
		ld	hl,0ff64h
		ld	de,0010h
		ld	b,04h
		res	0,(hl)
		add	hl,de
		djnz	ASMPC + 2 - 5		; (-05h)
		bit	0,(iy+0eh)
		jr	nz,ASMPC + 2 + 109		; (+6dh)
		ld	a,03h
		ld	(0ff98h),a
		ld	a,(0ff99h)
		ld	hl,0ff20h
		add	a,l
		ld	l,a
		ld	a,(hl)
		cp	50h
		jr	c,ASMPC + 2 + 1		; (+01h)
		xor	a
		ld	(0ff9ah),a
		ld	hl,0ffabh
		ld	(0ff9ch),hl
		ld	ix,0ff98h
		call	0f00fh
		ld	a,(0ffa0h)
		or	a
		ret	nz
	
		ld	a,(0ffaeh)
		call	0facdh
		ld	(iy+06h),b
		ld	(iy+07h),c
		ld	a,(0ff9eh)
		rlca
		rlca
		rlca
		cpl
		and	06h
		ld	(iy+05h),a
		bit	1,a
		jr	z,ASMPC + 2 + 7		; (+07h)
		ld	a,4dh
		ld	hl,001ah
		jr	ASMPC + 2 + 5		; (+05h)
		ld	a,28h
		ld	hl,0012h
		cp	(iy+00h)
		jr	c,ASMPC + 2 + 3		; (+03h)
		ld	(iy+00h),a
		ld	(iy+02h),h
		ld	(iy+03h),l
		set	0,(iy+0eh)
		ld	hl,(0ff96h)
		ld	a,h
		or	l
		jr	nz,ASMPC + 2 + 4		; (+04h)
		ld	(0ff96h),iy
		ld	hl,(0c2fdh)
		dec	hl
		ld	d,00h
		ld	e,(iy+03h)
		ld	a,0ffh
		inc	a
		or	a
		sbc	hl,de
		jr	nc,ASMPC + 2 - 6		; (-06h)
		add	hl,de
		inc	hl
		ld	c,l
		ld	hl,0ff9bh
		ld	(hl),c
		cp	(iy+00h)
		jr	c,ASMPC + 2 + 8		; (+08h)
		sub	(iy+00h)
		ld	hl,0ff99h
		set	7,(hl)
		ld	(0ff9ah),a
		ld	h,(iy+06h)
		ld	l,(iy+07h)
		ld	(0ff9eh),hl
		xor	a
		ret
	
		ld	bc,0080h
		and	03h
		ret	z
	
		sla	c
		rl	b
		dec	a
		jr	nz,ASMPC + 2 - 7		; (-07h)
		ret
	
		call	0fc28h
		ret	c
	
		call	0fc4ah
		call	0fbd3h
		ld	a,(0ffc9h)
		push	af
		ld	a,00h
		ld	(0ff98h),a
		ld	ix,0ff98h
		call	0f00fh
		ld	c,(iy+0ch)
		ld	(iy+0ch),00h
		pop	af
		or	a
		jr	z,ASMPC + 2 + 4		; (+04h)
		set	4,c
		jr	ASMPC + 2 + 2		; (+02h)
		res	4,c
		bit	2,(iy+05h)
		jr	z,ASMPC + 2 + 4		; (+04h)
		set	5,c
		jr	ASMPC + 2 + 2		; (+02h)
		res	5,c
		bit	6,(ix+08h)
		jr	z,ASMPC + 2 + 4		; (+04h)
		set	3,c
		jr	ASMPC + 2 + 2		; (+02h)
		res	3,c
		ld	hl,0c2fch
		push	hl
		ld	(hl),c
		inc	hl
		ld	a,(iy+0dh)
		cpl
		ld	(hl),a
		inc	hl
		ld	(hl),0e0h
		inc	hl
		ld	a,(0ff2dh)
		ld	(hl),a
		pop	hl
		ld	de,0043h
		jp	0f66ch
		call	0fc28h
		ret	c
	
		ld	hl,(0ff4fh)
		ld	a,h
		or	l
		ret	nz
	
		call	0fbd3h
		ret	z
	
		call	0fc4ah
		ld	a,00h
		ld	(0ff98h),a
		ld	ix,0ff98h
		call	0f00fh
		call	0f3cbh
		ld	a,(0ff2fh)
		bit	2,(iy+05h)
		jr	z,ASMPC + 2 + 7		; (+07h)
		res	7,a
		ld	hl,0c200h
		jr	ASMPC + 2 + 5		; (+05h)
		set	7,a
		ld	hl,0c280h
		ld	(0ff2fh),a
		out	(30h),a
		push	hl
		ld	(0ffc1h),hl
		ld	hl,0001h
		ld	(0ffbfh),hl
		ld	hl,(0ff49h)
		ld	de,0ffb6h
		ld	bc,0007h
		rlca
		rlca
		and	03h
		jr	z,ASMPC + 2 + 4		; (+04h)
		add	hl,bc
		dec	a
		jr	nz,ASMPC + 2 - 4		; (-04h)
		ldir
		ld	a,(0ffa0h)
		and	0c0h
		jr	nz,ASMPC + 2 + 19		; (+13h)
		ld	a,(iy+04h)
		ld	(0ffbdh),a
		ld	a,(iy+00h)
		ld	(0ffbeh),a
		push	iy
		call	0fcbeh
		pop	iy
		pop	hl
		call	0f9e3h
		ld	d,00h
		call	0f66ch
		jp	0f03ch
		sbc	a,a
		cp	0e2h
		cp	1ah
		or	b
		jr	z,ASMPC + 2 + 53		; (+35h)
		cp	68h
		cp	12h
		ld	l,d
		jr	ASMPC + 2 + 122		; (+7ah)
		cp	0c8h
		cp	1ah
		ld	e,b
		inc	d
		ld	d,0feh
		ld	d,(hl)
		cp	12h
		dec	(hl)
		inc	c
		ld	a,(iy+00h)
		or	a
		ret	nz
	
		ld	hl,(0ff96h)
		ld	a,h
		or	l
		ret	z
	
		push	iy
		pop	de
		ld	bc,000ch
		ldir
		ret
	
		call	0fc28h
		ret	c
	
		call	0fbd3h
		ret	z
	
		call	0fc4ah
		push	iy
		pop	hl
		ld	de,0c2f4h
		push	de
		ld	bc,000ch
		ldir
		pop	hl
		ld	de,0043h
		jp	0f66ch
		call	0fc28h
		ret	c
	
		call	0fc4ah
		call	0f6b9h
		ret	nz
	
		ld	de,000ch
		or	a
		sbc	hl,de
		ret	nz
	
		call	0fc4ah
		ld	hl,0c100h
		push	iy
		pop	de
		ld	bc,000ch
		ldir
		jp	0fc54h
		ld	a,(0c2fbh)
		sub	31h
		cp	04h
		ccf
		ret	c
	
		ld	h,00h
		ld	l,a
		add	hl,hl
		add	hl,hl
		add	hl,hl
		add	hl,hl
		ld	bc,0ff56h
		add	hl,bc
		push	hl
		pop	iy
		bit	6,(iy+08h)
		scf
		ret	z
	
		ld	(0ff99h),a
		xor	a
		ret
	
		in	a,(70h)
		bit	1,a
		jr	z,ASMPC + 2 - 6		; (-06h)
		ld	a,41h
		jr	ASMPC + 2 + 2		; (+02h)
		ld	a,43h
		ld	hl,0c301h
		ld	(hl),a
		ld	d,00h
		jp	0f684h
		call	0fc4ah
		call	0fc9ch
		ld	hl,0c300h
		or	a
		sbc	hl,bc
		push	hl
		ex	de,hl
		ld	hl,(0fcb2h)
		di
		ldir
		ei
		pop	hl
		ld	de,0043h
		jp	0f66ch
		call	0fc4ah
		call	0f6b9h
		ret	nz
	
		call	0fc9ch
		or	a
		sbc	hl,bc
		ret	nz
	
		push	bc
		call	0fc4ah
		pop	bc
		ld	hl,0c100h
		ld	de,(0fcb2h)
		di
		ldir
		ei
		jp	0fc54h
		ld	a,(0c2fdh)
		ld	c,a
		ld	b,00h
		or	a
		ret	nz
	
		inc	b
		ret
	
		call	0fc4ah
		ld	hl,(0c2fdh)
		ld	(0fcb2h),hl
		jp	0fc54h
		nop
		nop
		call	0fc4ah
		call	0fc54h
		ld	hl,(0c2fdh)
		jp	(hl)
		xor	a
		out	(56h),a
		inc	a
		out	(54h),a
		ld	a,0bh
		call	0f36bh
		xor	04h
		and	84h
		jp	nz,0fd9ah
		ld	hl,0c300h
		ld	a,(0ffbch)
		inc	a
		ld	b,a
		ld	(hl),76h
		inc	hl
		ld	(hl),0edh
		inc	hl
		ld	(hl),0a3h
		inc	hl
		ld	(hl),20h
		inc	hl
		ld	(hl),0fbh
		inc	hl
		djnz	ASMPC + 2 - 17		; (-11h)
		ld	a,0c9h
		ld	(hl),a
		ld	(0066h),a
		inc	hl
		ld	(0ffc3h),hl
		xor	a
		ld	(0ff2dh),a
		or	a
		jr	z,ASMPC + 2 + 5		; (+05h)
		ld	a,4bh
		call	0f36bh
		ld	ix,(0ffb6h)
		ld	iy,(0ffb8h)
		ld	a,(0ffbdh)
		rra
		ld	a,(0ff2fh)
		jr	nc,ASMPC + 2 + 7		; (+07h)
		xor	20h
		ld	(0ff2fh),a
		out	(30h),a
		call	0fda4h
		ld	a,(0ff2dh)
		out	(41h),a
		ld	hl,(0ffc3h)
		di
		ld	a,0f4h
		call	0f389h
		ld	a,(0ffbbh)
		ld	b,a
		ld	c,43h
		call	0c300h
		ei
		in	a,(40h)
		bit	0,a
		jr	nz,ASMPC + 2 - 6		; (-06h)
		ld	de,(0ffbfh)
		ld	hl,(0ffc1h)
		ld	a,(0ffbah)
		ld	b,a
		ld	ix,(0ffb8h)
		ld	a,(ix+00h)
		inc	ix
		out	(42h),a
		ld	a,(0ff2fh)
		and	20h
		ld	a,88h
		jr	z,ASMPC + 2 + 2		; (+02h)
		set	1,a
		call	0f362h
		and	98h
		jr	z,ASMPC + 2 + 20		; (+14h)
		and	80h
		jr	nz,ASMPC + 2 + 54		; (+36h)
		push	hl
		push	bc
		ld	bc,0c2fdh
		or	a
		sbc	hl,bc
		pop	bc
		pop	hl
		jr	nc,ASMPC + 2 + 4		; (+04h)
		ld	(hl),e
		inc	hl
		ld	(hl),d
		inc	hl
		inc	de
		djnz	ASMPC + 2 - 48		; (-30h)
		ld	(0ffbfh),de
		ld	(0ffc1h),hl
		ld	a,(0ff2fh)
		and	20h
		jp	nz,0fcffh
		ld	a,(0ff2dh)
		inc	a
		ld	hl,0ffbeh
		cp	(hl)
		jp	c,0fcf4h
		ld	hl,(0ffc1h)
		ld	(hl),0ffh
		inc	hl
		ld	(hl),0ffh
		xor	a
		push	af
		ld	a,0ffh
		ld	(0ff2dh),a
		out	(41h),a
		pop	af
		ret
	
		ld	a,(0ffbah)
		ld	c,a
		push	ix
		pop	hl
		ld	b,(hl)
		inc	hl
		ld	de,(0ffc3h)
		call	0fe0bh
		djnz	ASMPC + 2 - 5		; (-05h)
		ld	b,(hl)
		inc	hl
		push	hl
		pop	ix
		ld	a,(0ff2dh)
		ld	(ix+07h),a
		ld	a,(0ff2fh)
		and	20h
		ld	a,00h
		jr	z,ASMPC + 2 + 1		; (+01h)
		inc	a
		ld	(ix+09h),a
		ld	a,(iy+00h)
		inc	iy
		ld	(ix+0bh),a
		push	ix
		pop	hl
		push	bc
		call	0fe0bh
		djnz	ASMPC + 2 - 5		; (-05h)
		ld	a,(ix+0dh)
		call	0facdh
		ld	a,0ffh
		ld	(de),a
		inc	de
		dec	bc
		ld	a,b
		or	c
		jr	nz,ASMPC + 2 - 9		; (-09h)
		ld	b,(hl)
		inc	hl
		call	0fe0bh
		djnz	ASMPC + 2 - 5		; (-05h)
		pop	bc
		dec	c
		jr	nz,ASMPC + 2 - 62		; (-3eh)
		ld	hl,(0ffc3h)
		ld	bc,27d8h
		add	hl,bc
		sbc	hl,de
		ld	b,h
		ld	c,l
		ld	h,d
		ld	l,e
		inc	de
		ld	(hl),a
		ldir
		ret
	
		push	bc
		ld	b,(hl)
		inc	hl
		ld	a,(hl)
		inc	hl
		ld	(de),a
		inc	de
		djnz	ASMPC + 2 - 4		; (-04h)
		pop	bc
		ret
	
		ld	bc,0ff10h
		dec	bc
		inc	bc
		nop
		inc	bc
		nop
		ld	bc,01feh
		nop
		ld	bc,0100h
		nop
		ld	bc,0100h
		rst	30h
		dec	bc
		rst	38h
		ld	b,00h
		ld	bc,02fbh
		ld	bc,09f7h
		rst	38h
		ld	bc,4e20h
		inc	c
		inc	c
		nop
		inc	bc
		push	af
		ld	bc,01feh
		nop
		ld	bc,0100h
		nop
		ld	bc,0101h
		rst	30h
		ld	d,4eh
		inc	c
		nop
		inc	bc
		push	af
		ld	bc,02fbh
		ld	bc,10f7h
		ld	c,(hl)
		ld	(de),a
		djnz	ASMPC + 2 + 14		; (+0eh)
		inc	c
		ld	a,(bc)
		ex	af,af'
		ld	b,04h
		ld	(bc),a
		ld	de,0d0fh
		dec	bc
		add	hl,bc
		rlca
		dec	b
		inc	bc
		ld	bc,0701h
		dec	c
		ld	b,0ch
		ld	(de),a
		dec	b
		dec	bc
		ld	de,0a04h
		djnz	ASMPC + 2 + 3		; (+03h)
		add	hl,bc
		rrca
		ld	(bc),a
		ex	af,af'
		ld	c,04h
		jr	z,ASMPC + 2 - 1		; (-01h)
		ld	b,00h
		ld	bc,1afch
		rst	38h
		dec	bc
		inc	bc
		nop
		inc	bc
		nop
		ld	bc,01feh
		nop
		ld	bc,0100h
		nop
		ld	bc,0100h
		rst	30h
		dec	bc
		rst	38h
		ld	b,00h
		ld	bc,02fbh
		ld	bc,1bf7h
		rst	38h
		dec	b
		ld	d,b
		ld	c,(hl)
		inc	c
		nop
		inc	bc
		or	01h
		call	m,4e32h
		inc	c
		inc	c
		nop
		inc	bc
		push	af
		ld	bc,01feh
		nop
		ld	bc,0100h
		nop
		ld	bc,0101h
		rst	30h
		ld	d,4eh
		inc	c
		nop
		inc	bc
		push	af
		ld	bc,02fbh
		ld	bc,35f7h
		ld	c,(hl)
		ld	bc,030eh
		djnz	ASMPC + 2 + 5		; (+05h)
		ld	(de),a
		rlca
		inc	d
		add	hl,bc
		ld	d,0bh
		jr	ASMPC + 2 + 13		; (+0dh)
		ld	a,(de)
		ld	(bc),a
		rrca
		inc	b
		ld	de,1306h
		ex	af,af'
		dec	d
		ld	a,(bc)
		rla
		inc	c
		add	hl,de
		ld	bc,0912h
		ld	a,(de)
		ld	de,1908h
		djnz	ASMPC + 2 + 7		; (+07h)
		jr	ASMPC + 2 + 15		; (+0fh)
		ld	b,17h
		ld	c,05h
		ld	d,0dh
		inc	b
		dec	d
		inc	c
		inc	bc
		inc	d
		dec	bc
		ld	(bc),a
		inc	de
		ld	a,(bc)
		rst	38h
		rst	38h
		rst	38h
		rst	38h
		nop
		nop
		nop
		nop
		djnz	ASMPC + 2 + 16		; (+10h)
		djnz	ASMPC + 2 + 16		; (+10h)
		nop
		rst	38h
		ld	bc,0000h
		nop
		ld	(000ah),a
		nop
		nop
		nop
		ld	hl,0bef8h
		rst	30h
		pop	hl
		rst	30h
		ld	(bc),a
		dec	c
		ld	a,(bc)
		nop
		nop
		nop
		nop
		inc	a
		nop
		add	a,b
		nop
		or	a
		ei
		nop
		push	bc
		rst	38h
		rrca
		ld	(hl),e
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		ld	d,e
		ld	b,c
		ld	c,h
		ld	c,h
		ld	e,c
		jr	nz,ASMPC + 2 + 49		; (+31h)
		jr	nz,ASMPC + 2 + 82		; (+52h)
		ld	h,l
		halt
		jr	nz,ASMPC + 2 + 49		; (+31h)
		ld	l,30h
;		ld	sp,0000h
		db	031h
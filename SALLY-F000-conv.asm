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
     		jr	z,f078		; (+4dh)
     		ld	b,88h
     		dec	a
     		jr	z,f0ab		; (+7bh)
     		ld	b,0a8h
     		dec	a
     		jr	z,f0ab		; (+76h)
     		dec	a
     		jr	z,f097		; (+5fh)
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
     		jr	nz,f064		; (+0ah)
     		call	0f068h
     		ld	a,21h
     		out	(83h),a
     		ld	(0ff2eh),a
f064:		pop	af
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

f078:		call	0f11ah
     		bit	7,a
     		jr	z,f084		; (+05h)
     		ld	hl,0ff30h
     		ld	(hl),00h
f084:		ld	(ix+08h),a
     		ld	a,(0ff2fh)
     		ld	(ix+06h),a
     		ld	a,(0ff30h)
     		ld	(ix+07h),a
     		call	0f03ch
     		ret

f097:		ld	(ix+06h),06h
     		ld	(ix+07h),00h
     		ld	b,0c0h
     		call	0f0b3h
     		ld	a,(0ff2fh)
     		ld	(ix+06h),a
     		ret

f0ab:		bit	7,(ix+01h)
     		jr	z,f0b3		; (+02h)
     		set	1,b
f0b3:		ld	a,b
     		ld	(0ffc5h),a
     		call	0f11ah
     		bit	7,a
     		jr	nz,f110		; (+52h)
     		ld	a,(0ff2dh)
     		cp	0ffh
     		jr	z,f0ca		; (+05h)
     		cp	(ix+02h)
     		jr	z,f0cf		; (+05h)
f0ca:		call	0f1f8h
     		jr	nz,f110		; (+41h)
f0cf:		ld	a,(0ff12h)
     		inc	a
     		jr	nz,f0cf		; (-06h)
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
f0ee:		ld	a,(ix+03h)
     		out	(42h),a
     		ld	a,(ix+02h)
     		out	(41h),a
     		ld	a,(0ffc5h)
     		out	(40h),a
     		call	0f2b5h
     		jr	z,f110		; (+0eh)
     		push	af
     		call	0f30eh
     		pop	bc
     		jr	nz,f10f		; (+06h)
     		ld	hl,0ffc6h
     		dec	(hl)
     		jr	nz,f0ee		; (-21h)
f10f:		ld	a,b
f110:		ld	(ix+08h),a
     		call	0f018h
     		call	0f03ch
     		ret

     		ld	a,(ix+01h)
     		res	7,a
     		cp	04h
     		jr	nc,f18e		; (+6bh)
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
     		jr	nz,f16a		; (+1fh)
     		ld	hl,0f198h
     		add	hl,bc
     		ld	a,(hl)
     		out	(30h),a
     		push	af
     		call	0f19ch
     		pop	bc
     		cp	0deh
     		jr	nc,f18e		; (+33h)
     		set	6,b
     		cp	0b5h
     		jr	nc,f167		; (+06h)
     		res	6,b
     		cp	99h
     		jr	c,f18e		; (+27h)
f167:		ld	a,b
     		ld	d,00h
f16a:		res	5,a
     		bit	7,(ix+01h)
     		jr	z,f174		; (+02h)
     		set	5,a
f174:		out	(30h),a
     		ld	(0ff2fh),a
     		inc	d
     		dec	d
     		call	nz,0f399h
     		call	0f391h
     		bit	5,a
     		ret	nz

     		call	0f19ch
     		or	a
     		jr	z,f18e		; (+04h)
     		call	0f391h
     		ret

f18e:		xor	a
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
f1b9:		ld	de,(0ffc7h)
     		call	0f1e3h
     		jr	c,f1cf		; (+0dh)
     		call	0f1e3h
     		jr	c,f1cf		; (+08h)
     		djnz	f1b9		; (-10h)
     		ld	hl,(0ffc7h)
     		or	a
     		sbc	hl,de
f1cf:		call	0f3cbh
     		xor	a
     		out	(54h),a
     		inc	a
     		out	(56h),a
     		ld	a,l
     		inc	h
     		dec	h
     		jr	z,f1df		; (+02h)
     		ld	a,0ffh
f1df:		ld	(0ff30h),a
     		ret

f1e3:		call	0f391h
     		xor	c
     		and	02h
     		jr	nz,f1f4		; (+09h)
     		ld	a,(0ffc8h)
     		cp	08h
     		jr	c,f1e3		; (-0fh)
     		scf
     		ret

f1f4:		ld	a,c
     		cpl
     		ld	c,a
     		ret

     		ld	a,(0ff2dh)
     		cp	0ffh
     		jr	nz,f204		; (+05h)
     		call	0f237h
     		jr	nz,f22e		; (+2ah)
f204:		ld	b,01h
     		call	0f257h
     		ret	z

     		jr	nc,f211		; (+05h)
     		call	0f237h
     		jr	nz,f22e		; (+1dh)
f211:		ld	b,02h
     		call	0f257h
     		ret	z

     		jr	c,f22e		; (+15h)
     		ld	hl,0064h
     		call	0f39eh
     		ld	hl,0ff28h
     		ld	a,(0ff2ch)
     		add	a,l
     		ld	l,a
     		inc	(hl)
     		ld	a,(hl)
     		and	03h
     		jr	nz,f211		; (-1ch)
     		dec	(hl)
f22e:		ld	a,0ffh
     		ld	(0ff2dh),a
     		ld	a,10h
     		or	a
     		ret

     		ld	a,(0ff2fh)
     		set	4,a
     		out	(30h),a
     		ld	b,0fh
f240:		djnz	f240		; (-02h)
     		res	4,a
     		out	(30h),a
     		ld	b,00h
f248:		djnz	f248		; (-02h)
     		call	0f391h
     		ld	a,0bh
     		call	0f36bh
     		xor	04h
     		and	84h
     		ret

f257:		push	bc
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

     		djnz	f257		; (-1ch)
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
     		jr	z,f2c5		; (+01h)
     		inc	h
f2c5:		ld	(0066h),hl
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
     		jr	z,f2f5		; (+0dh)
     		srl	a
     		jr	z,f2f2		; (+06h)
f2ec:		halt
     		jr	nz,f2ec		; (-03h)
f2ef:		halt
     		jr	nz,f2ef		; (-03h)
f2f2:		halt
     		jr	nz,f2f2		; (-03h)
f2f5:		halt
     		jr	nz,f2f5		; (-03h)
f2f8:		in	a,(40h)
     		bit	0,a
     		jr	nz,f2f8		; (-06h)
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
     		jr	z,f31b		; (+08h)
     		push	af
     		call	0f391h
     		pop	af
     		and	0e1h
     		ret

f31b:		bit	4,b
     		jr	nz,f342		; (+23h)
     		ld	a,(0ff33h)
     		ld	hl,0ffc6h
     		sub	(hl)
     		ret	z

     		ld	a,(0ff2dh)
     		ld	b,a
     		or	a
     		jr	nz,f332		; (+04h)
     		ld	c,01h
     		jr	f334		; (+02h)
f332:		dec	a
     		ld	c,a
f334:		push	bc
     		call	0f275h
     		pop	de
     		ld	b,e
     		ld	c,d
     		call	0f275h
     		call	0f295h
     		ret

f342:		call	0f295h
     		jr	nz,f359		; (+12h)
     		in	a,(42h)
     		cp	(ix+02h)
     		jr	nz,f35b		; (+0dh)
     		ld	a,(0ff33h)
     		ld	hl,0ffc6h
     		sub	(hl)
     		ret	z

     		ld	a,10h
     		ret

f359:		ld	a,0ffh
f35b:		ld	(0ff2dh),a
     		call	0f1f8h
     		ret

     		call	0f389h
     		push	bc
     		ld	bc,186ah
     		jr	f372		; (+07h)
     		call	0f389h
     		push	bc
     		ld	bc,927ch
f372:		in	a,(40h)
     		bit	0,a
     		jr	z,f382		; (+0ah)
     		call	0f38bh
     		dec	bc
     		ld	a,b
     		or	c
     		jr	nz,f372		; (-0eh)
     		ld	a,10h
f382:		ld	b,a
     		call	0f391h
     		ld	a,b
     		pop	bc
     		ret

     		out	(40h),a
     		ld	a,0eh
f38d:		dec	a
     		jr	nz,f38d		; (-03h)
     		ret

     		ld	a,0d0h
     		call	0f389h
     		in	a,(40h)
     		ret

     		ld	hl,(0ff32h)
     		ld	h,00h
f39e:		xor	a
f39f:		dec	a
     		jr	nz,f39f		; (-03h)
     		dec	hl
     		ld	a,h
     		or	l
     		jr	nz,f39e		; (-09h)
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
     		jr	nz,f3fd		; (+00h)
f3fd:		call	0f4b2h
     		cp	20h
     		ret	c

     		ld	c,a
     		xor	a
     		ld	h,a
     		ld	l,a
f407:		add	hl,hl
     		add	hl,hl
     		add	hl,hl
     		add	hl,hl
     		or	l
     		ld	l,a
     		call	0f4b2h
     		cp	0dh
     		jr	z,f420		; (+0ch)
     		call	0f483h
     		jr	nc,f407		; (-12h)
f419:		call	0f4c9h
     		jr	nz,f45d		; (+3fh)
     		nop
     		ret

f420:		call	0f4d5h
     		ld	a,c
     		cp	47h
     		jr	z,f45e		; (+36h)
     		cp	42h
     		jr	z,f45f		; (+33h)
     		cp	4dh
     		jr	nz,f419		; (-17h)
f430:		call	0f493h
     		ld	a,(hl)
     		call	0f498h
     		call	0f4b2h
     		cp	0dh
     		jr	z,f456		; (+18h)
     		cp	2dh
     		jr	z,f458		; (+16h)
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
f456:		inc	hl
     		inc	hl
f458:		dec	hl
     		call	0f4d5h
     		jr	f430		; (-2eh)
f45e:		jp	(hl)
f45f:		ld	ix,0f47ah
     		call	0f022h
     		ld	a,(ix+08h)
     		or	a
     		call	z,0080h
     		push	af
     		call	0f4c9h
     		jr	nz,f4b8		; (+45h)
     		ld	d,d
     		ld	d,d
     		jr	nz,f477		; (+00h)
f477:		pop	af
     		jr	f49f		; (+25h)
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
     		jr	f4be		; (+1fh)
f49f:		push	af
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
     		jr	f4be		; (+0ch)
     		push	hl
     		push	bc
     		call	0f009h
     		pop	bc
f4b8:		pop	hl
     		res	7,a
     		cp	20h
     		ret	c

f4be:		push	hl
     		push	bc
     		push	af
     		ld	c,a
     		call	0f00ch
     		pop	af
     		pop	bc
     		pop	hl
     		ret

     		ex	(sp),hl
f4ca:		ld	a,(hl)
     		call	0f4beh
     		ld	a,(hl)
     		inc	hl
     		or	a
     		jr	nz,f4ca		; (-09h)
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
f4e5:		dec	a
     		jr	nz,f4e5		; (-03h)
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
f510:		ld	(0f51ch),a
     		pop	af
     		ei
     		reti

     		push	af
     		in	a,(70h)
     		rla
     		ld	a,00h
     		rra
     		jr	c,f510		; (-10h)
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
f61a:		ld	b,7eh
f61c:		in	a,(70h)
     		rla
     		jr	nc,f61a		; (-07h)
     		djnz	f61c		; (-07h)
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

f640:		call	0f635h
     		jr	z,f640		; (-05h)
     		ld	hl,(0f633h)
     		ld	a,(hl)
     		inc	l
     		res	4,l
     		ld	(0f633h),hl
     		ret

f650:		ld	a,(0ff12h)
     		cp	0eeh
     		jr	c,f650		; (-07h)
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
f697:		jr	f697		; (-02h)
     		ex	af,af'
     		exx
     		ld	a,0ffh
     		ld	(0ff55h),a
     		out	(57h),a
     		ld	hl,0c2fbh
     		call	0f6d9h
     		jr	nc,f6b4		; (+0ah)
     		dec	hl
     		ld	a,(hl)
     		cp	c
     		jr	nz,f6b4		; (+05h)
     		ld	a,01h
     		ld	(0ff55h),a
f6b4:		ex	af,af'
     		exx
     		ei
     		reti

     		di
     		ld	hl,0c100h
     		call	0f6d9h
     		ei
     		jr	c,f6d0		; (+0dh)
     		dec	hl
     		ld	a,(hl)
     		cp	c
     		jr	nz,f6d0		; (+08h)
     		ld	de,0c100h
     		or	a
     		sbc	hl,de
     		xor	a
     		ret

f6d0:		ld	a,4eh
     		call	0fc56h
     		ld	a,0ffh
     		or	a
     		ret

     		ld	de,0aaah
     		ld	bc,0000h
     		jr	f704		; (+23h)
f6e1:		ld	a,c
     		add	a,b
     		adc	a,00h
     		ld	c,a
     		ex	(sp),hl
     		ex	(sp),hl
     		ex	(sp),hl
     		ex	(sp),hl
     		ld	b,08h
f6ec:		ld	a,0bh
     		ld	a,0bh
     		nop
     		dec	a
     		jp	nz,0f6f1h
     		in	a,(70h)
     		rla
     		rr	d
     		djnz	f6ec		; (-10h)
     		ld	b,d
     		ld	(hl),d
     		inc	hl
     		ld	a,h
     		cp	0c3h
     		ccf
     		ret	c

f704:		ld	a,47h
     		out	(80h),a
     		xor	a
     		out	(80h),a
     		ld	de,01a1h
f70e:		in	a,(80h)
     		or	a
     		jr	nz,f6e1		; (-32h)
     		dec	de
     		ld	a,d
     		or	e
     		jr	nz,f70e		; (-0ah)
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
     		djnz	f739		; (+05h)
     		ld	a,3bh
     		ld	(0ff12h),a
f739:		reti

     		ld	a,01h
     		out	(50h),a
     		ei
     		ld	a,h
     		cp	0c3h
     		jr	nc,f74e		; (+09h)
     		ld	b,08h
     		ld	a,19h
     		ld	(0ff12h),a
     		reti

f74e:		ld	a,55h
     		ld	(0ff12h),a
     		reti

     		ld	a,01h
     		out	(81h),a
     		ei
     		ld	a,0ffh
     		ld	(0ff12h),a
     		pop	hl
     		reti

     		ld	a,01h
     		out	(52h),a
f766:		ld	hl,0c2feh
     		di
     		call	0f6d9h
     		ei
     		jr	nc,f766		; (-0ah)
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
     		jr	nz,f791		; (+05h)
     		ld	a,0ffh
     		ld	(0f823h),a
f791:		ld	hl,0f7e1h
     		ld	(0f019h),hl
     		ld	de,(3019h)
     		or	a
     		sbc	hl,de
     		jr	z,f7ac		; (+0ch)
     		ld	hl,0000h
     		ld	(0ff4bh),hl
     		ld	hl,0bfffh
     		ld	(0ff4dh),hl
f7ac:		call	0f8d1h
     		ld	hl,(0ff3ah)
     		call	0f7bdh
     		ld	hl,(0ff3ch)
     		call	0f7bdh
     		jr	f7ac		; (-11h)
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
     		jr	z,f7f3		; (+08h)
     		di
     		ld	a,03h
     		out	(80h),a
     		ei
     		jr	f809		; (+16h)
f7f3:		ld	a,(0c2fbh)
     		ld	hl,(0ff38h)
     		call	0f810h
     		jr	nz,f809		; (+0bh)
     		ld	a,(0c2fch)
     		call	0f810h
     		jr	nz,f809		; (+03h)
     		call	0f7bdh
f809:		ld	hl,0f7beh
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
f88e:		ld	a,(hl)
     		cp	9bh
     		jr	nz,f898		; (+05h)
     		ld	hl,0ff3eh
     		ld	b,(hl)
     		inc	hl
f898:		push	hl
     		ld	hl,(0ff4fh)
     		ld	de,(0ff4dh)
     		or	a
     		sbc	hl,de
     		pop	hl
     		jr	c,f8b4		; (+0eh)
     		push	hl
     		push	bc
     		call	0f8d1h
     		pop	bc
     		pop	hl
     		in	a,(70h)
     		and	02h
     		jr	nz,f898		; (-1bh)
     		ret

f8b4:		ld	a,(hl)
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
     		djnz	f88e		; (-40h)
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
     		jr	nc,f903		; (+03h)
     		ld	de,0000h
f903:		pop	hl
     		ret

     		xor	a
     		jr	f90a		; (+02h)
     		ld	a,01h
f90a:		ld	(0ffb5h),a
     		call	0fc28h
     		ret	c

     		call	0fc4ah
     		call	0f6b9h
     		ret	nz

     		ld	(0ffa9h),hl
     		ld	de,0080h
     		or	a
     		sbc	hl,de
     		jr	z,f927		; (+04h)
     		or	a
     		sbc	hl,de
     		ret	nz

f927:		call	0fc4ah
     		call	0fa10h
     		jr	nz,f97d		; (+4eh)
     		ld	hl,0c100h
     		ld	(0ff9ch),hl
     		ld	a,(0ffa9h)
     		ld	b,a
f939:		ld	a,(hl)
     		cpl
     		ld	(hl),a
     		inc	hl
     		djnz	f939		; (-06h)
     		ld	a,02h
     		ld	(0ff98h),a
     		ld	ix,0ff98h
     		call	0f00fh
     		ld	a,(0ffa0h)
     		or	a
     		jr	nz,f97d		; (+2ch)
     		ld	a,(0ffb5h)
     		or	a
     		jr	z,f97d		; (+26h)
     		ld	a,01h
     		ld	(0ff98h),a
     		ld	hl,0c300h
     		ld	(0ff9ch),hl
     		call	0f00fh
     		ld	a,(0ffa0h)
     		or	a
     		jr	nz,f97d		; (+12h)
     		ld	hl,0c100h
     		ld	de,0c300h
     		ld	a,(0ff9eh)
     		ld	b,a
f975:		ld	a,(de)
     		xor	(hl)
     		jr	nz,f984		; (+0bh)
     		inc	hl
     		inc	de
     		djnz	f975		; (-08h)
f97d:		call	0f9e3h
     		ld	a,e
     		jp	0fc56h
f984:		xor	a
     		call	0fa06h
     		ld	a,e
     		jp	0fc56h
     		call	0fc28h
     		ret	c

     		call	0fc4ah
     		call	0fa10h
     		push	af
     		jr	z,f9a8		; (+0fh)
     		ld	d,(iy+06h)
     		ld	e,(iy+07h)
     		ld	a,d
     		or	e
     		jr	nz,f9ac		; (+09h)
     		ld	de,0080h
     		jr	f9ac		; (+04h)
f9a8:		ld	de,(0ff9eh)
f9ac:		ld	hl,(0c2fdh)
     		ld	bc,0004h
     		or	a
     		sbc	hl,bc
     		jr	nc,f9ba		; (+03h)
     		ld	de,0080h
f9ba:		ld	(0ffa9h),de
     		ld	hl,0c300h
     		or	a
     		sbc	hl,de
     		pop	af
     		jr	nz,f9db		; (+14h)
     		ld	(0ff9ch),hl
     		ld	a,01h
     		ld	(0ff98h),a
     		ld	ix,0ff98h
     		push	hl
     		call	0f00fh
     		pop	hl
     		ld	a,(0ffa0h)
f9db:		call	0f9e3h
     		ld	d,0ffh
     		jp	0f66ch
     		or	a
     		jr	nz,f9f0		; (+0ah)
     		ld	(iy+0dh),a
     		ld	e,43h
     		res	2,(iy+0ch)
     		ret

f9f0:		bit	6,a
     		jr	z,f9f6		; (+02h)
     		and	9fh
f9f6:		bit	5,a
     		jr	z,f9fc		; (+02h)
     		or	60h
f9fc:		ld	c,a
     		and	81h
     		ld	a,c
     		jr	z,fa06		; (+04h)
     		and	7eh
     		or	10h
fa06:		ld	(iy+0dh),a
     		ld	e,45h
     		set	2,(iy+0ch)
     		ret

     		ld	a,(0ff2eh)
     		or	a
     		jr	z,fa27		; (+11h)
     		xor	a
     		ld	(0ff2eh),a
     		ld	hl,0ff64h
     		ld	de,0010h
     		ld	b,04h
fa22:		res	0,(hl)
     		add	hl,de
     		djnz	fa22		; (-05h)
fa27:		bit	0,(iy+0eh)
     		jr	nz,fa9a		; (+6dh)
     		ld	a,03h
     		ld	(0ff98h),a
     		ld	a,(0ff99h)
     		ld	hl,0ff20h
     		add	a,l
     		ld	l,a
     		ld	a,(hl)
     		cp	50h
     		jr	c,fa40		; (+01h)
     		xor	a
fa40:		ld	(0ff9ah),a
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
     		jr	z,fa78		; (+07h)
     		ld	a,4dh
     		ld	hl,001ah
     		jr	fa7d		; (+05h)
fa78:		ld	a,28h
     		ld	hl,0012h
fa7d:		cp	(iy+00h)
     		jr	c,fa85		; (+03h)
     		ld	(iy+00h),a
fa85:		ld	(iy+02h),h
     		ld	(iy+03h),l
     		set	0,(iy+0eh)
     		ld	hl,(0ff96h)
     		ld	a,h
     		or	l
     		jr	nz,fa9a		; (+04h)
     		ld	(0ff96h),iy
fa9a:		ld	hl,(0c2fdh)
     		dec	hl
     		ld	d,00h
     		ld	e,(iy+03h)
     		ld	a,0ffh
faa5:		inc	a
     		or	a
     		sbc	hl,de
     		jr	nc,faa5		; (-06h)
     		add	hl,de
     		inc	hl
     		ld	c,l
     		ld	hl,0ff9bh
     		ld	(hl),c
     		cp	(iy+00h)
     		jr	c,fabf		; (+08h)
     		sub	(iy+00h)
     		ld	hl,0ff99h
     		set	7,(hl)
fabf:		ld	(0ff9ah),a
     		ld	h,(iy+06h)
     		ld	l,(iy+07h)
     		ld	(0ff9eh),hl
     		xor	a
     		ret

     		ld	bc,0080h
     		and	03h
     		ret	z

fad3:		sla	c
     		rl	b
     		dec	a
     		jr	nz,fad3		; (-07h)
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
     		jr	z,fb04		; (+04h)
     		set	4,c
     		jr	fb06		; (+02h)
fb04:		res	4,c
fb06:		bit	2,(iy+05h)
     		jr	z,fb10		; (+04h)
     		set	5,c
     		jr	fb12		; (+02h)
fb10:		res	5,c
fb12:		bit	6,(ix+08h)
     		jr	z,fb1c		; (+04h)
     		set	3,c
     		jr	fb1e		; (+02h)
fb1c:		res	3,c
fb1e:		ld	hl,0c2fch
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
     		jr	z,fb68		; (+07h)
     		res	7,a
     		ld	hl,0c200h
     		jr	fb6d		; (+05h)
fb68:		set	7,a
     		ld	hl,0c280h
fb6d:		ld	(0ff2fh),a
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
     		jr	z,fb8f		; (+04h)
fb8b:		add	hl,bc
     		dec	a
     		jr	nz,fb8b		; (-04h)
fb8f:		ldir
     		ld	a,(0ffa0h)
     		and	0c0h
     		jr	nz,fbab		; (+13h)
     		ld	a,(iy+04h)
     		ld	(0ffbdh),a
     		ld	a,(iy+00h)
     		ld	(0ffbeh),a
     		push	iy
     		call	0fcbeh
     		pop	iy
fbab:		pop	hl
     		call	0f9e3h
     		ld	d,00h
     		call	0f66ch
     		jp	0f03ch
     		sbc	a,a
     		cp	0e2h
     		cp	1ah
     		or	b
     		jr	z,fbf4		; (+35h)
     		cp	68h
     		cp	12h
     		ld	l,d
     		jr	fc40		; (+7ah)
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
fbf4:		pop	hl
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

fc4a:		in	a,(70h)
     		bit	1,a
     		jr	z,fc4a		; (-06h)
     		ld	a,41h
     		jr	fc56		; (+02h)
     		ld	a,43h
fc56:		ld	hl,0c301h
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
fcd8:		ld	(hl),76h
     		inc	hl
     		ld	(hl),0edh
     		inc	hl
     		ld	(hl),0a3h
     		inc	hl
     		ld	(hl),20h
     		inc	hl
     		ld	(hl),0fbh
     		inc	hl
     		djnz	fcd8		; (-11h)
     		ld	a,0c9h
     		ld	(hl),a
     		ld	(0066h),a
     		inc	hl
     		ld	(0ffc3h),hl
     		xor	a
     		ld	(0ff2dh),a
     		or	a
     		jr	z,fcff		; (+05h)
     		ld	a,4bh
     		call	0f36bh
fcff:		ld	ix,(0ffb6h)
     		ld	iy,(0ffb8h)
     		ld	a,(0ffbdh)
     		rra
     		ld	a,(0ff2fh)
     		jr	nc,fd17		; (+07h)
     		xor	20h
     		ld	(0ff2fh),a
     		out	(30h),a
fd17:		call	0fda4h
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
fd32:		in	a,(40h)
     		bit	0,a
     		jr	nz,fd32		; (-06h)
     		ld	de,(0ffbfh)
     		ld	hl,(0ffc1h)
     		ld	a,(0ffbah)
     		ld	b,a
     		ld	ix,(0ffb8h)
fd47:		ld	a,(ix+00h)
     		inc	ix
     		out	(42h),a
     		ld	a,(0ff2fh)
     		and	20h
     		ld	a,88h
     		jr	z,fd59		; (+02h)
     		set	1,a
fd59:		call	0f362h
     		and	98h
     		jr	z,fd74		; (+14h)
     		and	80h
     		jr	nz,fd9a		; (+36h)
     		push	hl
     		push	bc
     		ld	bc,0c2fdh
     		or	a
     		sbc	hl,bc
     		pop	bc
     		pop	hl
     		jr	nc,fd74		; (+04h)
     		ld	(hl),e
     		inc	hl
     		ld	(hl),d
     		inc	hl
fd74:		inc	de
     		djnz	fd47		; (-30h)
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
fd9a:		push	af
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
fdb1:		call	0fe0bh
     		djnz	fdb1		; (-05h)
     		ld	b,(hl)
     		inc	hl
     		push	hl
     		pop	ix
fdbb:		ld	a,(0ff2dh)
     		ld	(ix+07h),a
     		ld	a,(0ff2fh)
     		and	20h
     		ld	a,00h
     		jr	z,fdcb		; (+01h)
     		inc	a
fdcb:		ld	(ix+09h),a
     		ld	a,(iy+00h)
     		inc	iy
     		ld	(ix+0bh),a
     		push	ix
     		pop	hl
     		push	bc
fdda:		call	0fe0bh
     		djnz	fdda		; (-05h)
     		ld	a,(ix+0dh)
     		call	0facdh
fde5:		ld	a,0ffh
     		ld	(de),a
     		inc	de
     		dec	bc
     		ld	a,b
     		or	c
     		jr	nz,fde5		; (-09h)
     		ld	b,(hl)
     		inc	hl
fdf0:		call	0fe0bh
     		djnz	fdf0		; (-05h)
     		pop	bc
     		dec	c
     		jr	nz,fdbb		; (-3eh)
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
fe10:		ld	(de),a
     		inc	de
     		djnz	fe10		; (-04h)
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
     		djnz	fe67		; (+0eh)
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
fe67:		ld	bc,0701h
     		dec	c
     		ld	b,0ch
     		ld	(de),a
     		dec	b
     		dec	bc
     		ld	de,0a04h
     		djnz	fe78		; (+03h)
     		add	hl,bc
     		rrca
     		ld	(bc),a
fe78:		ex	af,af'
     		ld	c,04h
     		jr	z,fe7c		; (-01h)
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
     		djnz	fed2		; (+05h)
     		ld	(de),a
     		rlca
     		inc	d
     		add	hl,bc
     		ld	d,0bh
     		jr	fee2		; (+0dh)
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
fee2:		ld	bc,0912h
     		ld	a,(de)
     		ld	de,1908h
     		djnz	fef2		; (+07h)
     		jr	fefc		; (+0fh)
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
fefc:		rst	38h
     		rst	38h
     		rst	38h
     		rst	38h
     		nop
     		nop
     		nop
     		nop
     		djnz	ff16		; (+10h)
     		djnz	ff18		; (+10h)
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
ff18:		pop	hl
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
     		jr	nz,ff6f		; (+31h)
     		jr	nz,ff92		; (+52h)
     		ld	h,l
     		halt
     		jr	nz,ff75		; (+31h)
     		ld	l,30h
     		ld	sp,0000h

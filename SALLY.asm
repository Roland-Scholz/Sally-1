; Disassembly of the file "C:\github\Sally-1\SALLY.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Tuesday, 30 of January 2024 at 09:58 PM
; 

;--------------------------------------------------
; Init Sequence
;--------------------------------------------------
; 50	01	Bit0	set ATARI DATA
; 51	01 	Bit1	set RS232 TX
; 80	03	CTC	Channel 0 reset
; 80	10	CTC	Channel 0 interrupt vector
; 81	07     	CTC	Channel 1 reset + set time constant
; 81	01	CTC	Channel 1 time contant 1
; 82	03 	CTC	Channel 2 reset
; 83	03     	CTC	Channel 3 reset
; 57	01	Bit7	ATARI RXD
; 30	00 	DSE	Floppy Control (74LS273)
; 40	d0      DWR/DRW	FDC read-write	d0 = force int (with no interrupt)
;--------------------------------------------------
; out\ ports
;--------------------------------------------------
; $2x 	Printer DATA
; $3x	Port Floppy Control
; $4x	FDC 1797
; $5x	U52 74LS259
; $50	ATARI Out data
; $51	RS232 TX
; $52	ROM switch
; $53	printer strobe
; $54	reset index-pulse
; $55	RS232 DTR
; $56	set index pulse
; $57	0=CMD, 1=SIO
;--------------------------------------------------
; in\ ports
;--------------------------------------------------
; $2x	Printer Control
; $4x	FDC 1797
; $5x	RS232	D7=RX, D3=1, D2=?, D1=FlowControl
; $70	SIO	D7=RX, D1=CMD, D3=RDY/+5V
;--------------------------------------------------


;--------------------------------------------------
; Code executed after Reset
;--------------------------------------------------
0000 f3        di      			; disable interrupt
0001 af        xor     a		; set a to zero
0002 3d        dec     a		; do 256 times nothing
0003 20fd      jr      nz,0002h		; loop 
                                          
0005 21a300    ld      hl,00a3h		; init 11 ports with values at 0a3h
0008 060b      ld      b,0bh              
000a 4e        ld      c,(hl)             
000b 23        inc     hl                 
000c eda3      outi   			 	 
000e 20fa      jr      nz,000ah		; loop
                                          
0010 2100f0    ld      hl,0f000h          
0013 3e01      ld      a,01h              
0015 0610      ld      b,10h		; test ram @F000-FFFF
0017 77        ld      (hl),a
0018 07        rlca    
0019 2c        inc     l
001a 20fb      jr      nz,0017h
001c 24        inc     h
001d 10f8      djnz    0017h
001f 0e10      ld      c,10h
0021 2b        dec     hl
0022 0f        rrca    
0023 be        cp      (hl)
0024 20fe      jr      nz,0024h		; if error, loop forever
0026 10f9      djnz    0021h              
0028 0d        dec     c                  
0029 20f6      jr      nz,0021h           
002b 87        add     a,a                
002c 20e7      jr      nz,0015h           
                                          
002e 21b900    ld      hl,00b9h		; copy BIOS from $00b9 to $f000
0031 1100f0    ld      de,0f000h	; length efc
0034 01fc0e    ld      bc,0efch           
0037 edb0      ldir                       
0039 21b50f    ld      hl,0fb5h		; copy from fb5 to $ff20
003c 1120ff    ld      de,0ff20h	; length $2F
003f 012f00    ld      bc,002fh           
0042 edb0      ldir                       
                                          
0044 af        xor     a		; fill up to $FFFF with zeros
0045 12        ld      (de),a             
0046 1c        inc     e                  
0047 20fc      jr      nz,0045h           
                                          
0049 3110ff    ld      sp,0ff10h	; stack-pointer to 0ff10h
                                          
004c 3eff      ld      a,0ffh		; load interrupt-vector register
004e ed47      ld      i,a		; with 0ffh
0050 ed5e      im      2		; enable interrupt mode 2 (vectored)
                                          
0052 3e4f      ld      a,4fh		; select drive 1-4, Motor off, side 0, B/S=1, DD
0054 d330      out     (30h),a            
                                          
0056 57        ld      d,a		; d = 4fh
0057 0605      ld      b,05h		; step 5 times
0059 3e4b      ld      a,4bh		; 4b = 0100 1011 = step-in 
005b cd6bf3    call    0f36bh		; write A to FDC command and wait
005e 10f9      djnz    0059h              
                                          
0060 0664      ld      b,64h		; seek track 00 for all 4 drives
0062 7a        ld      a,d		; select all drives
0063 d330      out     (30h),a            
0065 e3        ex      (sp),hl		; ??? waste some time
0066 e3        ex      (sp),hl		; 19 T-states 4,75uS
0067 3e6b      ld      a,6bh		; step out
0069 cd6bf3    call    0f36bh		; write A to FDC command and wait
                                          
006c 1e01      ld      e,01h              
006e 7b        ld      a,e                
006f f640      or      40h                
0071 d330      out     (30h),a		; selct one drive
0073 e3        ex      (sp),hl  
0074 e3        ex      (sp),hl            
0075 cd91f3    call    0f391h		; stop command, get status
0078 cb57      bit     2,a                
007a 2804      jr      z,0080h		; bit not set, not at track 00
007c 7b        ld      a,e		; drive at track 00
007d 2f        cpl     			; exclude drive from seeking
007e a2        and     d                  
007f 57        ld      d,a                
0080 cb23      sla     e                  
0082 cb63      bit     4,e		  
0084 28e8      jr      z,006eh		; status checked for all 4 drives?
0086 10da      djnz    0062h		; step out again
                                          
0088 cd68f0    call    0f068h		; deselect floppies and seek current track?
                                          
008b 215eff    ld      hl,0ff5eh	; set bit for each connected floppy?
008e 011000    ld      bc,0010h           
0091 3e04      ld      a,04h              
0093 cb1a      rr      d                  
0095 3802      jr      c,0099h            
0097 cbf6      set     6,(hl)             
0099 09        add     hl,bc              
009a 3d        dec     a                  
009b 20f6      jr      nz,0093h           
                                          
009d 3100c1    ld      sp,0c100h	; set stack to 0c100h
00a0 c362f7    jp      0f762h		; jump to code in DRAM

;--------------------------------------------------
; 11 times port:value
;--------------------------------------------------
00a3 50        ld      d,b		; no code
00a4 015101    ld      bc,0151h		; io port and init values
00a7 80        add     a,b		; see above
00a8 03        inc     bc
00a9 80        add     a,b
00aa 1081      djnz    002dh
00ac 07        rlca    
00ad 81        add     a,c
00ae 018203    ld      bc,0382h
00b1 83        add     a,e
00b2 03        inc     bc
00b3 57        ld      d,a
00b4 013000    ld      bc,0030h
00b7 40        ld      b,b
00b8 d0        ret     nc

;--------------------------------------------------
; following code starts at $F000
; (has been copied from $00b9 to $F000 (ROM to RAM)
;---------------------------------------------------

; Disassembly of the file "C:\github\Sally-1\SALLY-F000.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Tuesday, 30 of January 2024 at 11:36 PM
; 
0000 c31bf0    jp      0f01bh		; wboot?
0003 c3def3    jp      0f3deh		; boot
0006 c335f6    jp      0f635h		; const
0009 c340f6    jp      0f640h		; conin
000c c350f6    jp      0f650h		; conout
000f c322f0    jp      0f022h           ; list
0012 c3dcf4    jp      0f4dch		; punch
0015 c3ebf4    jp      0f4ebh		; reader
0018 c315f6    jp      0f615h		; home?
001b f3        di      
001c af        xor     a
001d d352      out     (52h),a
001f c30000    jp      0000h
0022 cdcbf3    call    0f3cbh
0025 dd7e00    ld      a,(ix+00h)
0028 b7        or      a
0029 284d      jr      z,0078h          ; (+4dh)
002b 0688      ld      b,88h
002d 3d        dec     a
002e 287b      jr      z,00abh          ; (+7bh)
0030 06a8      ld      b,0a8h
0032 3d        dec     a
0033 2876      jr      z,00abh          ; (+76h)
0035 3d        dec     a
0036 285f      jr      z,0097h          ; (+5fh)
0038 dd3608ff  ld      (ix+08h),0ffh
003c f3        di      
003d 3ea7      ld      a,0a7h
003f d383      out     (83h),a
0041 af        xor     a
0042 d383      out     (83h),a
0044 3d        dec     a
0045 32c9ff    ld      (0ffc9h),a
0048 2150f0    ld      hl,0f050h
004b 2216ff    ld      (0ff16h),hl
004e fb        ei      
004f c9        ret     

0050 f5        push    af
0051 3ac9ff    ld      a,(0ffc9h)
0054 3d        dec     a
0055 32c9ff    ld      (0ffc9h),a
0058 200a      jr      nz,0064h         ; (+0ah)
005a cd68f0    call    0f068h
005d 3e21      ld      a,21h
005f d383      out     (83h),a
0061 322eff    ld      (0ff2eh),a
0064 f1        pop     af
0065 fb        ei      
0066 ed4d      reti    

0068 db41      in      a,(41h)		; read track-register
006a d343      out     (43h),a		; write data-register
006c 3e10      ld      a,10h		; seek
006e d340      out     (40h),a		; write seek to FDC
0070 3a2fff    ld      a,(0ff2fh)	; current floppy control
0073 e6f0      and     0f0h               
0075 d330      out     (30h),a		; deselect all 
0077 c9        ret     

0078 cd1af1    call    0f11ah
007b cb7f      bit     7,a
007d 2805      jr      z,0084h          ; (+05h)
007f 2130ff    ld      hl,0ff30h
0082 3600      ld      (hl),00h
0084 dd7708    ld      (ix+08h),a
0087 3a2fff    ld      a,(0ff2fh)
008a dd7706    ld      (ix+06h),a
008d 3a30ff    ld      a,(0ff30h)
0090 dd7707    ld      (ix+07h),a
0093 cd3cf0    call    0f03ch
0096 c9        ret     

0097 dd360606  ld      (ix+06h),06h
009b dd360700  ld      (ix+07h),00h
009f 06c0      ld      b,0c0h
00a1 cdb3f0    call    0f0b3h
00a4 3a2fff    ld      a,(0ff2fh)
00a7 dd7706    ld      (ix+06h),a
00aa c9        ret     

00ab ddcb017e  bit     7,(ix+01h)
00af 2802      jr      z,00b3h          ; (+02h)
00b1 cbc8      set     1,b
00b3 78        ld      a,b
00b4 32c5ff    ld      (0ffc5h),a
00b7 cd1af1    call    0f11ah
00ba cb7f      bit     7,a
00bc 2052      jr      nz,0110h         ; (+52h)
00be 3a2dff    ld      a,(0ff2dh)
00c1 feff      cp      0ffh
00c3 2805      jr      z,00cah          ; (+05h)
00c5 ddbe02    cp      (ix+02h)
00c8 2805      jr      z,00cfh          ; (+05h)
00ca cdf8f1    call    0f1f8h
00cd 2041      jr      nz,0110h         ; (+41h)
00cf 3a12ff    ld      a,(0ff12h)
00d2 3c        inc     a
00d3 20fa      jr      nz,00cfh         ; (-06h)
00d5 f3        di      
00d6 3e03      ld      a,03h
00d8 d380      out     (80h),a
00da 3e27      ld      a,27h
00dc d382      out     (82h),a
00de 3e3d      ld      a,3dh
00e0 d382      out     (82h),a
00e2 21a8f3    ld      hl,0f3a8h
00e5 2216ff    ld      (0ff16h),hl
00e8 3a33ff    ld      a,(0ff33h)
00eb 32c6ff    ld      (0ffc6h),a
00ee dd7e03    ld      a,(ix+03h)
00f1 d342      out     (42h),a
00f3 dd7e02    ld      a,(ix+02h)
00f6 d341      out     (41h),a
00f8 3ac5ff    ld      a,(0ffc5h)
00fb d340      out     (40h),a
00fd cdb5f2    call    0f2b5h
0100 280e      jr      z,0110h          ; (+0eh)
0102 f5        push    af
0103 cd0ef3    call    0f30eh
0106 c1        pop     bc
0107 2006      jr      nz,010fh         ; (+06h)
0109 21c6ff    ld      hl,0ffc6h
010c 35        dec     (hl)
010d 20df      jr      nz,00eeh         ; (-21h)
010f 78        ld      a,b
0110 dd7708    ld      (ix+08h),a
0113 cd18f0    call    0f018h
0116 cd3cf0    call    0f03ch
0119 c9        ret     

011a dd7e01    ld      a,(ix+01h)
011d cbbf      res     7,a
011f fe04      cp      04h
0121 306b      jr      nc,018eh         ; (+6bh)
0123 0600      ld      b,00h
0125 4f        ld      c,a
0126 212cff    ld      hl,0ff2ch
0129 96        sub     (hl)
012a f5        push    af
012b 50        ld      d,b
012c 5e        ld      e,(hl)
012d 71        ld      (hl),c
012e 2120ff    ld      hl,0ff20h
0131 19        add     hl,de
0132 3a2dff    ld      a,(0ff2dh)
0135 77        ld      (hl),a
0136 1e04      ld      e,04h
0138 19        add     hl,de
0139 3a2fff    ld      a,(0ff2fh)
013c 77        ld      (hl),a
013d 2120ff    ld      hl,0ff20h
0140 09        add     hl,bc
0141 7e        ld      a,(hl)
0142 322dff    ld      (0ff2dh),a
0145 19        add     hl,de
0146 d1        pop     de
0147 7e        ld      a,(hl)
0148 b7        or      a
0149 201f      jr      nz,016ah         ; (+1fh)
014b 2198f1    ld      hl,0f198h
014e 09        add     hl,bc
014f 7e        ld      a,(hl)
0150 d330      out     (30h),a
0152 f5        push    af
0153 cd9cf1    call    0f19ch
0156 c1        pop     bc
0157 fede      cp      0deh
0159 3033      jr      nc,018eh         ; (+33h)
015b cbf0      set     6,b
015d feb5      cp      0b5h
015f 3006      jr      nc,0167h         ; (+06h)
0161 cbb0      res     6,b
0163 fe99      cp      99h
0165 3827      jr      c,018eh          ; (+27h)
0167 78        ld      a,b
0168 1600      ld      d,00h
016a cbaf      res     5,a
016c ddcb017e  bit     7,(ix+01h)
0170 2802      jr      z,0174h          ; (+02h)
0172 cbef      set     5,a
0174 d330      out     (30h),a
0176 322fff    ld      (0ff2fh),a
0179 14        inc     d
017a 15        dec     d
017b c499f3    call    nz,0f399h
017e cd91f3    call    0f391h
0181 cb6f      bit     5,a
0183 c0        ret     nz

0184 cd9cf1    call    0f19ch
0187 b7        or      a
0188 2804      jr      z,018eh          ; (+04h)
018a cd91f3    call    0f391h
018d c9        ret     

018e af        xor     a
018f d330      out     (30h),a
0191 322fff    ld      (0ff2fh),a
0194 3e80      ld      a,80h
0196 b7        or      a
0197 c9        ret     

0198 010204    ld      bc,0402h
019b 08        ex      af,af'
019c af        xor     a
019d d356      out     (56h),a
019f 3c        inc     a
01a0 d354      out     (54h),a
01a2 db41      in      a,(41h)
01a4 d343      out     (43h),a
01a6 3e18      ld      a,18h
01a8 d340      out     (40h),a
01aa cdbaf3    call    0f3bah
01ad cd91f3    call    0f391h
01b0 4f        ld      c,a
01b1 0606      ld      b,06h
01b3 210000    ld      hl,0000h
01b6 22c7ff    ld      (0ffc7h),hl
01b9 ed5bc7ff  ld      de,(0ffc7h)
01bd cde3f1    call    0f1e3h
01c0 380d      jr      c,01cfh          ; (+0dh)
01c2 cde3f1    call    0f1e3h
01c5 3808      jr      c,01cfh          ; (+08h)
01c7 10f0      djnz    01b9h            ; (-10h)
01c9 2ac7ff    ld      hl,(0ffc7h)
01cc b7        or      a
01cd ed52      sbc     hl,de
01cf cdcbf3    call    0f3cbh
01d2 af        xor     a
01d3 d354      out     (54h),a
01d5 3c        inc     a
01d6 d356      out     (56h),a
01d8 7d        ld      a,l
01d9 24        inc     h
01da 25        dec     h
01db 2802      jr      z,01dfh          ; (+02h)
01dd 3eff      ld      a,0ffh
01df 3230ff    ld      (0ff30h),a
01e2 c9        ret     

01e3 cd91f3    call    0f391h
01e6 a9        xor     c
01e7 e602      and     02h
01e9 2009      jr      nz,01f4h         ; (+09h)
01eb 3ac8ff    ld      a,(0ffc8h)
01ee fe08      cp      08h
01f0 38f1      jr      c,01e3h          ; (-0fh)
01f2 37        scf     
01f3 c9        ret     

01f4 79        ld      a,c
01f5 2f        cpl     
01f6 4f        ld      c,a
01f7 c9        ret     

01f8 3a2dff    ld      a,(0ff2dh)
01fb feff      cp      0ffh
01fd 2005      jr      nz,0204h         ; (+05h)
01ff cd37f2    call    0f237h
0202 202a      jr      nz,022eh         ; (+2ah)
0204 0601      ld      b,01h
0206 cd57f2    call    0f257h
0209 c8        ret     z

020a 3005      jr      nc,0211h         ; (+05h)
020c cd37f2    call    0f237h
020f 201d      jr      nz,022eh         ; (+1dh)
0211 0602      ld      b,02h
0213 cd57f2    call    0f257h
0216 c8        ret     z

0217 3815      jr      c,022eh          ; (+15h)
0219 216400    ld      hl,0064h
021c cd9ef3    call    0f39eh
021f 2128ff    ld      hl,0ff28h
0222 3a2cff    ld      a,(0ff2ch)
0225 85        add     a,l
0226 6f        ld      l,a
0227 34        inc     (hl)
0228 7e        ld      a,(hl)
0229 e603      and     03h
022b 20e4      jr      nz,0211h         ; (-1ch)
022d 35        dec     (hl)
022e 3eff      ld      a,0ffh
0230 322dff    ld      (0ff2dh),a
0233 3e10      ld      a,10h
0235 b7        or      a
0236 c9        ret     

0237 3a2fff    ld      a,(0ff2fh)
023a cbe7      set     4,a
023c d330      out     (30h),a
023e 060f      ld      b,0fh
0240 10fe      djnz    0240h            ; (-02h)
0242 cba7      res     4,a
0244 d330      out     (30h),a
0246 0600      ld      b,00h
0248 10fe      djnz    0248h            ; (-02h)
024a cd91f3    call    0f391h
024d 3e0b      ld      a,0bh
024f cd6bf3    call    0f36bh
0252 ee04      xor     04h
0254 e684      and     84h
0256 c9        ret     

0257 c5        push    bc
0258 3a2dff    ld      a,(0ff2dh)
025b 47        ld      b,a
025c dd4e02    ld      c,(ix+02h)
025f cd75f2    call    0f275h
0262 cd95f2    call    0f295h
0265 c1        pop     bc
0266 37        scf     
0267 c0        ret     nz

0268 db42      in      a,(42h)
026a 322dff    ld      (0ff2dh),a
026d dd9602    sub     (ix+02h)
0270 c8        ret     z

0271 10e4      djnz    0257h            ; (-1ch)
0273 b7        or      a
0274 c9        ret     

0275 78        ld      a,b
0276 d341      out     (41h),a
0278 79        ld      a,c
0279 d343      out     (43h),a
027b 2128ff    ld      hl,0ff28h
027e 3a2cff    ld      a,(0ff2ch)
0281 85        add     a,l
0282 6f        ld      l,a
0283 7e        ld      a,(hl)
0284 e603      and     03h
0286 f618      or      18h
0288 cd6bf3    call    0f36bh
028b 7e        ld      a,(hl)
028c e6fc      and     0fch
028e 2600      ld      h,00h
0290 6f        ld      l,a
0291 cd9ef3    call    0f39eh
0294 c9        ret     

0295 3ec0      ld      a,0c0h
0297 cd62f3    call    0f362h
029a e698      and     98h
029c c8        ret     z

029d 3a2fff    ld      a,(0ff2fh)
02a0 ee80      xor     80h
02a2 322fff    ld      (0ff2fh),a
02a5 d330      out     (30h),a
02a7 213200    ld      hl,0032h
02aa cd9ef3    call    0f39eh
02ad 3ec0      ld      a,0c0h
02af cd62f3    call    0f362h
02b2 e698      and     98h
02b4 c9        ret     

02b5 2a6600    ld      hl,(0066h)
02b8 e5        push    hl
02b9 2a6800    ld      hl,(0068h)
02bc e5        push    hl
02bd 21eda2    ld      hl,0a2edh
02c0 cb6f      bit     5,a
02c2 2801      jr      z,02c5h          ; (+01h)
02c4 24        inc     h
02c5 226600    ld      (0066h),hl
02c8 216800    ld      hl,0068h
02cb 36c9      ld      (hl),0c9h
02cd f3        di      
02ce 3ec7      ld      a,0c7h
02d0 d383      out     (83h),a
02d2 af        xor     a
02d3 d383      out     (83h),a
02d5 fb        ei      
02d6 dd6e04    ld      l,(ix+04h)
02d9 dd6605    ld      h,(ix+05h)
02dc dd4606    ld      b,(ix+06h)
02df 0e43      ld      c,43h
02e1 dd7e07    ld      a,(ix+07h)
02e4 cb3f      srl     a
02e6 280d      jr      z,02f5h          ; (+0dh)
02e8 cb3f      srl     a
02ea 2806      jr      z,02f2h          ; (+06h)
02ec 76        halt    
02ed 20fd      jr      nz,02ech         ; (-03h)
02ef 76        halt    
02f0 20fd      jr      nz,02efh         ; (-03h)
02f2 76        halt    
02f3 20fd      jr      nz,02f2h         ; (-03h)
02f5 76        halt    
02f6 20fd      jr      nz,02f5h         ; (-03h)
02f8 db40      in      a,(40h)
02fa cb47      bit     0,a
02fc 20fa      jr      nz,02f8h         ; (-06h)
02fe 47        ld      b,a
02ff cdcbf3    call    0f3cbh
0302 78        ld      a,b
0303 e1        pop     hl
0304 226800    ld      (0068h),hl
0307 e1        pop     hl
0308 226600    ld      (0066h),hl
030b e6fd      and     0fdh
030d c9        ret     

030e 47        ld      b,a
030f e6e7      and     0e7h
0311 2808      jr      z,031bh          ; (+08h)
0313 f5        push    af
0314 cd91f3    call    0f391h
0317 f1        pop     af
0318 e6e1      and     0e1h
031a c9        ret     

031b cb60      bit     4,b
031d 2023      jr      nz,0342h         ; (+23h)
031f 3a33ff    ld      a,(0ff33h)
0322 21c6ff    ld      hl,0ffc6h
0325 96        sub     (hl)
0326 c8        ret     z

0327 3a2dff    ld      a,(0ff2dh)
032a 47        ld      b,a
032b b7        or      a
032c 2004      jr      nz,0332h         ; (+04h)
032e 0e01      ld      c,01h
0330 1802      jr      0334h            ; (+02h)
0332 3d        dec     a
0333 4f        ld      c,a
0334 c5        push    bc
0335 cd75f2    call    0f275h
0338 d1        pop     de
0339 43        ld      b,e
033a 4a        ld      c,d
033b cd75f2    call    0f275h
033e cd95f2    call    0f295h
0341 c9        ret     

0342 cd95f2    call    0f295h
0345 2012      jr      nz,0359h         ; (+12h)
0347 db42      in      a,(42h)
0349 ddbe02    cp      (ix+02h)
034c 200d      jr      nz,035bh         ; (+0dh)
034e 3a33ff    ld      a,(0ff33h)
0351 21c6ff    ld      hl,0ffc6h
0354 96        sub     (hl)
0355 c8        ret     z

0356 3e10      ld      a,10h
0358 c9        ret     

0359 3eff      ld      a,0ffh
035b 322dff    ld      (0ff2dh),a
035e cdf8f1    call    0f1f8h
0361 c9        ret     

0362 cd89f3    call    0f389h
0365 c5        push    bc
0366 016a18    ld      bc,186ah
0369 1807      jr      0372h            ; (+07h)

036b cd89f3    call    0f389h		;write A to FDC and wait some time
036e c5        push    bc
036f 017c92    ld      bc,927ch		;load BC with 37500
0372 db40      in      a,(40h)		;read FDC status register
0374 cb47      bit     0,a
0376 280a      jr      z,0382h          ; (+0ah) zero, operation finished
0378 cd8bf3    call    0f38bh		;wait some time
037b 0b        dec     bc
037c 78        ld      a,b
037d b1        or      c
037e 20f2      jr      nz,0372h         ; (-0eh) decrement bc, if not 0 check status again
0380 3e10      ld      a,10h		; code 10h in A
0382 47        ld      b,a
0383 cd91f3    call    0f391h
0386 78        ld      a,b
0387 c1        pop     bc
0388 c9        ret     

0389 d340      out     (40h),a		;write to FDC
038b 3e0e      ld      a,0eh		;wait some time (14 * 16 clocks)
038d 3d        dec     a
038e 20fd      jr      nz,038dh         ; (-03h)
0390 c9        ret     			

0391 3ed0      ld      a,0d0h		;stop command, no INT
0393 cd89f3    call    0f389h		;write FDC-command and wait
0396 db40      in      a,(40h)		;get FDC status
0398 c9        ret     

0399 2a32ff    ld      hl,(0ff32h)
039c 2600      ld      h,00h
039e af        xor     a
039f 3d        dec     a
03a0 20fd      jr      nz,039fh         ; (-03h)
03a2 2b        dec     hl
03a3 7c        ld      a,h
03a4 b5        or      l
03a5 20f7      jr      nz,039eh         ; (-09h)
03a7 c9        ret     

03a8 3ed0      ld      a,0d0h
03aa d340      out     (40h),a
03ac 3e01      ld      a,01h
03ae d383      out     (83h),a
03b0 2103f3    ld      hl,0f303h
03b3 e3        ex      (sp),hl
03b4 3e10      ld      a,10h
03b6 b7        or      a
03b7 fb        ei      
03b8 ed4d      reti    

03ba f3        di      
03bb 3e87      ld      a,87h
03bd d383      out     (83h),a
03bf 3efa      ld      a,0fah
03c1 d383      out     (83h),a
03c3 21d2f3    ld      hl,0f3d2h
03c6 2216ff    ld      (0ff16h),hl
03c9 fb        ei      
03ca c9        ret     

03cb f3        di      
03cc 3e01      ld      a,01h
03ce d383      out     (83h),a
03d0 fb        ei      
03d1 c9        ret     

03d2 e5        push    hl
03d3 fb        ei      
03d4 2ac7ff    ld      hl,(0ffc7h)
03d7 23        inc     hl
03d8 22c7ff    ld      (0ffc7h),hl
03db e1        pop     hl
03dc ed4d      reti    

03de 3e01      ld      a,01h
03e0 d352      out     (52h),a
03e2 cdfcf5    call    0f5fch
03e5 cdc9f4    call    0f4c9h
03e8 0d        dec     c
03e9 0a        ld      a,(bc)
03ea 53        ld      d,e
03eb 41        ld      b,c
03ec 4c        ld      c,h
03ed 4c        ld      c,h
03ee 59        ld      e,c
03ef 310021    ld      sp,2100h
03f2 f1        pop     af
03f3 f3        di      
03f4 e5        push    hl
03f5 cdc9f4    call    0f4c9h
03f8 0d        dec     c
03f9 0a        ld      a,(bc)
03fa 23        inc     hl
03fb 2000      jr      nz,03fdh         ; (+00h)
03fd cdb2f4    call    0f4b2h
0400 fe20      cp      20h
0402 d8        ret     c

0403 4f        ld      c,a
0404 af        xor     a
0405 67        ld      h,a
0406 6f        ld      l,a
0407 29        add     hl,hl
0408 29        add     hl,hl
0409 29        add     hl,hl
040a 29        add     hl,hl
040b b5        or      l
040c 6f        ld      l,a
040d cdb2f4    call    0f4b2h
0410 fe0d      cp      0dh
0412 280c      jr      z,0420h          ; (+0ch)
0414 cd83f4    call    0f483h
0417 30ee      jr      nc,0407h         ; (-12h)
0419 cdc9f4    call    0f4c9h
041c 203f      jr      nz,045dh         ; (+3fh)
041e 00        nop     
041f c9        ret     

0420 cdd5f4    call    0f4d5h
0423 79        ld      a,c
0424 fe47      cp      47h
0426 2836      jr      z,045eh          ; (+36h)
0428 fe42      cp      42h
042a 2833      jr      z,045fh          ; (+33h)
042c fe4d      cp      4dh
042e 20e9      jr      nz,0419h         ; (-17h)
0430 cd93f4    call    0f493h
0433 7e        ld      a,(hl)
0434 cd98f4    call    0f498h
0437 cdb2f4    call    0f4b2h
043a fe0d      cp      0dh
043c 2818      jr      z,0456h          ; (+18h)
043e fe2d      cp      2dh
0440 2816      jr      z,0458h          ; (+16h)
0442 cd83f4    call    0f483h
0445 3f        ccf     
0446 d0        ret     nc

0447 07        rlca    
0448 07        rlca    
0449 07        rlca    
044a 07        rlca    
044b 4f        ld      c,a
044c cdb2f4    call    0f4b2h
044f cd83f4    call    0f483h
0452 3f        ccf     
0453 d0        ret     nc

0454 b1        or      c
0455 77        ld      (hl),a
0456 23        inc     hl
0457 23        inc     hl
0458 2b        dec     hl
0459 cdd5f4    call    0f4d5h
045c 18d2      jr      0430h            ; (-2eh)
045e e9        jp      (hl)
045f dd217af4  ld      ix,0f47ah
0463 cd22f0    call    0f022h
0466 dd7e08    ld      a,(ix+08h)
0469 b7        or      a
046a cc8000    call    z,0080h
046d f5        push    af
046e cdc9f4    call    0f4c9h
0471 2045      jr      nz,04b8h         ; (+45h)
0473 52        ld      d,d
0474 52        ld      d,d
0475 2000      jr      nz,0477h         ; (+00h)
0477 f1        pop     af
0478 1825      jr      049fh            ; (+25h)
047a 010000    ld      bc,0000h
047d 018000    ld      bc,0080h
0480 80        add     a,b
0481 00        nop     
0482 00        nop     
0483 d630      sub     30h
0485 d8        ret     c

0486 fe0a      cp      0ah
0488 3f        ccf     
0489 d0        ret     nc

048a d607      sub     07h
048c fe0a      cp      0ah
048e d8        ret     c

048f fe10      cp      10h
0491 3f        ccf     
0492 c9        ret     

0493 7c        ld      a,h
0494 cd9ff4    call    0f49fh
0497 7d        ld      a,l
0498 cd9ff4    call    0f49fh
049b 3e20      ld      a,20h
049d 181f      jr      04beh            ; (+1fh)
049f f5        push    af
04a0 1f        rra     
04a1 1f        rra     
04a2 1f        rra     
04a3 1f        rra     
04a4 cda8f4    call    0f4a8h
04a7 f1        pop     af
04a8 e60f      and     0fh
04aa c690      add     a,90h
04ac 27        daa     
04ad ce40      adc     a,40h
04af 27        daa     
04b0 180c      jr      04beh            ; (+0ch)
04b2 e5        push    hl
04b3 c5        push    bc
04b4 cd09f0    call    0f009h
04b7 c1        pop     bc
04b8 e1        pop     hl
04b9 cbbf      res     7,a
04bb fe20      cp      20h
04bd d8        ret     c

04be e5        push    hl
04bf c5        push    bc
04c0 f5        push    af
04c1 4f        ld      c,a
04c2 cd0cf0    call    0f00ch
04c5 f1        pop     af
04c6 c1        pop     bc
04c7 e1        pop     hl
04c8 c9        ret     

04c9 e3        ex      (sp),hl
04ca 7e        ld      a,(hl)
04cb cdbef4    call    0f4beh
04ce 7e        ld      a,(hl)
04cf 23        inc     hl
04d0 b7        or      a
04d1 20f7      jr      nz,04cah         ; (-09h)
04d3 e3        ex      (sp),hl
04d4 c9        ret     

04d5 cdc9f4    call    0f4c9h
04d8 0d        dec     c
04d9 0a        ld      a,(bc)
04da 00        nop     
04db c9        ret     

04dc 79        ld      a,c		;send c to printer
04dd d320      out     (20h),a
04df e3        ex      (sp),hl
04e0 e3        ex      (sp),hl
04e1 3e19      ld      a,19h
04e3 d353      out     (53h),a		;printer strobe
04e5 3d        dec     a
04e6 20fd      jr      nz,04e5h         ; (-03h)
04e8 d353      out     (53h),a
04ea c9        ret     

04eb 2a47ff    ld      hl,(0ff47h)
04ee db20      in      a,(20h)		;load printer contol
04f0 a5        and     l
04f1 ac        xor     h
04f2 c9        ret     

04f3 95        sub     l
04f4 00        nop     
04f5 00        nop     
04f6 00        nop     
04f7 00        nop     
04f8 00        nop     
04f9 00        nop     
04fa 00        nop     
04fb 00        nop     
04fc 00        nop     
04fd 00        nop     
04fe 00        nop     
04ff 00        nop     
0500 f5        push    af
0501 3e87      ld      a,87h
0503 d380      out     (80h),a
0505 3e1a      ld      a,1ah
0507 d380      out     (80h),a
0509 3e17      ld      a,17h
050b 3210ff    ld      (0ff10h),a
050e 3e7f      ld      a,7fh
0510 321cf5    ld      (0f51ch),a
0513 f1        pop     af
0514 fb        ei      
0515 ed4d      reti    

0517 f5        push    af
0518 db70      in      a,(70h)
051a 17        rla     
051b 3e00      ld      a,00h
051d 1f        rra     
051e 38f0      jr      c,0510h          ; (-10h)
0520 3200ff    ld      (0ff00h),a
0523 3e2c      ld      a,2ch
0525 3210ff    ld      (0ff10h),a
0528 f1        pop     af
0529 fb        ei      
052a ed4d      reti    

052c f5        push    af
052d 3ec7      ld      a,0c7h
052f d380      out     (80h),a
0531 3e01      ld      a,01h
0533 d380      out     (80h),a
0535 3a21f5    ld      a,(0f521h)
0538 3c        inc     a
0539 e60f      and     0fh
053b 3221f5    ld      (0f521h),a
053e 3e00      ld      a,00h
0540 3210ff    ld      (0ff10h),a
0543 f1        pop     af
0544 fb        ei      
0545 ed4d      reti    

0547 f5        push    af
0548 af        xor     a
0549 d350      out     (50h),a
054b 3e54      ld      a,54h
054d 3212ff    ld      (0ff12h),a
0550 f1        pop     af
0551 fb        ei      
0552 ed4d      reti    

0554 f5        push    af
0555 3e00      ld      a,00h
0557 d350      out     (50h),a
0559 1f        rra     
055a 3268f5    ld      (0f568h),a
055d 3e66      ld      a,66h
055f 3212ff    ld      (0ff12h),a
0562 f1        pop     af
0563 fb        ei      
0564 ed4d      reti    

0566 f5        push    af
0567 3e00      ld      a,00h
0569 d350      out     (50h),a
056b 1f        rra     
056c 327af5    ld      (0f57ah),a
056f 3e78      ld      a,78h
0571 3212ff    ld      (0ff12h),a
0574 f1        pop     af
0575 fb        ei      
0576 ed4d      reti    

0578 f5        push    af
0579 3e00      ld      a,00h
057b d350      out     (50h),a
057d 1f        rra     
057e 328cf5    ld      (0f58ch),a
0581 3e8a      ld      a,8ah
0583 3212ff    ld      (0ff12h),a
0586 f1        pop     af
0587 fb        ei      
0588 ed4d      reti    

058a f5        push    af
058b 3e00      ld      a,00h
058d d350      out     (50h),a
058f 1f        rra     
0590 329ef5    ld      (0f59eh),a
0593 3e9c      ld      a,9ch
0595 3212ff    ld      (0ff12h),a
0598 f1        pop     af
0599 fb        ei      
059a ed4d      reti    

059c f5        push    af
059d 3e00      ld      a,00h
059f d350      out     (50h),a
05a1 1f        rra     
05a2 32b0f5    ld      (0f5b0h),a
05a5 3eae      ld      a,0aeh
05a7 3212ff    ld      (0ff12h),a
05aa f1        pop     af
05ab fb        ei      
05ac ed4d      reti    

05ae f5        push    af
05af 3e00      ld      a,00h
05b1 d350      out     (50h),a
05b3 1f        rra     
05b4 32c2f5    ld      (0f5c2h),a
05b7 3ec0      ld      a,0c0h
05b9 3212ff    ld      (0ff12h),a
05bc f1        pop     af
05bd fb        ei      
05be ed4d      reti    

05c0 f5        push    af
05c1 3e00      ld      a,00h
05c3 d350      out     (50h),a
05c5 1f        rra     
05c6 32d4f5    ld      (0f5d4h),a
05c9 3ed2      ld      a,0d2h
05cb 3212ff    ld      (0ff12h),a
05ce f1        pop     af
05cf fb        ei      
05d0 ed4d      reti    

05d2 f5        push    af
05d3 3e00      ld      a,00h
05d5 d350      out     (50h),a
05d7 3ee0      ld      a,0e0h
05d9 3212ff    ld      (0ff12h),a
05dc f1        pop     af
05dd fb        ei      
05de ed4d      reti    

05e0 f5        push    af
05e1 3e01      ld      a,01h
05e3 d350      out     (50h),a
05e5 3eee      ld      a,0eeh
05e7 3212ff    ld      (0ff12h),a
05ea f1        pop     af
05eb fb        ei      
05ec ed4d      reti    

05ee f5        push    af
05ef 3e01      ld      a,01h
05f1 d381      out     (81h),a
05f3 3eff      ld      a,0ffh
05f5 3212ff    ld      (0ff12h),a
05f8 f1        pop     af
05f9 fb        ei      
05fa ed4d      reti    

05fc f3        di      
05fd 21eef5    ld      hl,0f5eeh
0600 2212ff    ld      (0ff12h),hl
0603 3e07      ld      a,07h
0605 d381      out     (81h),a
0607 3a06f5    ld      a,(0f506h)
060a d381      out     (81h),a
060c 2100ff    ld      hl,0ff00h
060f 2221f5    ld      (0f521h),hl
0612 2233f6    ld      (0f633h),hl
0615 f3        di      
0616 3e01      ld      a,01h
0618 d357      out     (57h),a
061a 067e      ld      b,7eh
061c db70      in      a,(70h)
061e 17        rla     
061f 30f9      jr      nc,061ah         ; (-07h)
0621 10f9      djnz    061ch            ; (-07h)
0623 3ec7      ld      a,0c7h
0625 d380      out     (80h),a
0627 3e01      ld      a,01h
0629 d380      out     (80h),a
062b 2100f5    ld      hl,0f500h
062e 2210ff    ld      (0ff10h),hl
0631 fb        ei      
0632 c9        ret     

0633 00        nop     			; 2-byte pointer
0634 ff        rst     38h		; charbuf start

0635 2133f6    ld      hl,0f633h	; CONST?	
0638 3a21f5    ld      a,(0f521h) 
063b 96        sub     (hl)
063c c8        ret     z

063d 3eff      ld      a,0ffh		; character ready
063f c9        ret     

0640 cd35f6    call    0f635h		; CONIN?
0643 28fb      jr      z,0640h          ; (-05h)
0645 2a33f6    ld      hl,(0f633h)	; load pointer in f633h
0648 7e        ld      a,(hl)		; load byte at pointer
0649 2c        inc     l		; increment
064a cba5      res     4,l		; 16-byte wrap around
064c 2233f6    ld      (0f633h),hl	
064f c9        ret     

0650 3a12ff    ld      a,(0ff12h)	; CONOUT?
0653 feee      cp      0eeh
0655 38f9      jr      c,0650h          ;
0657 79        ld      a,c
0658 e67f      and     7fh
065a e25ff6    jp      po,0f65fh
065d f680      or      80h
065f 3256f5    ld      (0f556h),a	; store byte in f556h 
0662 3e47      ld      a,47h		; set ff12h to 47h
0664 3212ff    ld      (0ff12h),a
0667 3e81      ld      a,81h		; program CTC channel 1
0669 d381      out     (81h),a
066b c9        ret     

066c e5        push    hl
066d d5        push    de
066e 2101c3    ld      hl,0c301h
0671 73        ld      (hl),e
0672 1600      ld      d,00h
0674 cd84f6    call    0f684h
0677 d1        pop     de
0678 e1        pop     hl
0679 1e00      ld      e,00h
067b cd84f6    call    0f684h
067e 2101c3    ld      hl,0c301h
0681 73        ld      (hl),e
0682 1600      ld      d,00h
0684 f3        di      
0685 0119f7    ld      bc,0f719h
0688 ed4312ff  ld      (0ff12h),bc
068c 0608      ld      b,08h
068e 3e87      ld      a,87h
0690 d381      out     (81h),a
0692 3e0d      ld      a,0dh
0694 d381      out     (81h),a
0696 fb        ei      
0697 18fe      jr      0697h            ; (-02h)

;--------------------------------------------------
; CTC interrupt routine CMD
;--------------------------------------------------
0699 08        ex      af,af'
069a d9        exx     
069b 3eff      ld      a,0ffh
069d 3255ff    ld      (0ff55h),a
06a0 d357      out     (57h),a		; switch to sio
06a2 21fbc2    ld      hl,0c2fbh
06a5 cdd9f6    call    0f6d9h		; read 5 bytes (command frame)
06a8 300a      jr      nc,06b4h         ; not read correctly, leave
06aa 2b        dec     hl		; load checksum 
06ab 7e        ld      a,(hl)
06ac b9        cp      c
06ad 2005      jr      nz,06b4h         ; not correct, leave
06af 3e01      ld      a,01h
06b1 3255ff    ld      (0ff55h),a	; 1 = command frame successfully read
06b4 08        ex      af,af'
06b5 d9        exx     
06b6 fb        ei      
06b7 ed4d      reti    

06b9 f3        di      
06ba 2100c1    ld      hl,0c100h
06bd cdd9f6    call    0f6d9h
06c0 fb        ei      
06c1 380d      jr      c,06d0h          ; (+0dh)
06c3 2b        dec     hl
06c4 7e        ld      a,(hl)
06c5 b9        cp      c
06c6 2008      jr      nz,06d0h         ; (+08h)
06c8 1100c1    ld      de,0c100h
06cb b7        or      a
06cc ed52      sbc     hl,de
06ce af        xor     a
06cf c9        ret     

06d0 3e4e      ld      a,4eh
06d2 cd56fc    call    0fc56h
06d5 3eff      ld      a,0ffh
06d7 b7        or      a
06d8 c9        ret     

06d9 11aa0a    ld      de,0aaah		; read atari ser 19200 Baud
06dc 010000    ld      bc,0000h
06df 1823      jr      0704h            ; (+23h)
06e1 79        ld      a,c		;4
06e2 80        add     a,b		;4
06e3 ce00      adc     a,00h		;7
06e5 4f        ld      c,a		;4
06e6 e3        ex      (sp),hl		;19
06e7 e3        ex      (sp),hl		;19
06e8 e3        ex      (sp),hl		;19
06e9 e3        ex      (sp),hl		;19
06ea 0608      ld      b,08h		;7	102

06ec 3e0b      ld      a,0bh		; 7
06ee 3e0b      ld      a,0bh		; 7
06f0 00        nop     			; 4
06f1 3d        dec     a		; 4	11*14
06f2 c2f1f6    jp      nz,0f6f1h	; 10
06f5 db70      in      a,(70h)		; 11
06f7 17        rla     			; 4
06f8 cb1a      rr      d		; 8
06fa 10f0      djnz    06ech            ; 13	208

06fc 42        ld      b,d
06fd 72        ld      (hl),d
06fe 23        inc     hl
06ff 7c        ld      a,h
0700 fec3      cp      0c3h
0702 3f        ccf     
0703 d8        ret     c		; 2bytes read and carry set
                                          
0704 3e47      ld      a,47h		; CH0 noint+counter+pre16+falling autocnt+timeconst+reset+ctrl
0706 d380      out     (80h),a		;        	 4              	7
0708 af        xor     a                  
0709 d380      out     (80h),a		; counter init value 0
070b 11a101    ld      de,01a1h           
070e db80      in      a,(80h)		; counter zero?
0710 b7        or      a                  
0711 20ce      jr      nz,06e1h         ; start-bit
0713 1b        dec     de                 
0714 7a        ld      a,d                
0715 b3        or      e                ; carry clear  
0716 20f6      jr      nz,070eh         ; de not zero, try again
0718 c9        ret     			; return carry clear, zero

0719 af        xor     a
071a d350      out     (50h),a
071c fb        ei      
071d 7e        ld      a,(hl)
071e 23        inc     hl
071f aa        xor     d
0720 4f        ld      c,a
0721 83        add     a,e
0722 ce00      adc     a,00h
0724 5f        ld      e,a
0725 3e2c      ld      a,2ch
0727 3212ff    ld      (0ff12h),a
072a ed4d      reti    

072c 79        ld      a,c
072d d350      out     (50h),a
072f fb        ei      
0730 cb19      rr      c
0732 1005      djnz    0739h            ; (+05h)
0734 3e3b      ld      a,3bh
0736 3212ff    ld      (0ff12h),a
0739 ed4d      reti    

073b 3e01      ld      a,01h
073d d350      out     (50h),a
073f fb        ei      
0740 7c        ld      a,h
0741 fec3      cp      0c3h
0743 3009      jr      nc,074eh         ; (+09h)
0745 0608      ld      b,08h
0747 3e19      ld      a,19h
0749 3212ff    ld      (0ff12h),a
074c ed4d      reti    

074e 3e55      ld      a,55h
0750 3212ff    ld      (0ff12h),a
0753 ed4d      reti    

0755 3e01      ld      a,01h
0757 d381      out     (81h),a
0759 fb        ei      
075a 3eff      ld      a,0ffh
075c 3212ff    ld      (0ff12h),a
075f e1        pop     hl
0760 ed4d      reti    

;--------------------------------------------------
; Main entry after startup from ROM
;--------------------------------------------------
0762 3e01      ld      a,01h		; executed after startup
0764 d352      out     (52h),a		; turn off ROM
                                          
0766 21fec2    ld      hl,0c2feh          
0769 f3        di                         
076a cdd9f6    call    0f6d9h		; read 2 atari bytes
076d fb        ei                         
076e 30f6      jr      nc,0766h         ; nothing read, read again
0770 2afec2    ld      hl,(0c2feh)	; load hl with bytes read
0773 11e680    ld      de,80e6h           
0776 b7        or      a		; clear carry
0777 ed52      sbc     hl,de              
0779 cadef3    jp      z,0f3deh		; 080e6h read?
                                          
077c 3e03      ld      a,03h		; no
077e 3233ff    ld      (0ff33h),a	; store 03h ff30h (03h = inc bc)
0781 3e38      ld      a,38h		; store 38h to f188 (038h = jr c, d) 
0783 3288f1    ld      (0f188h),a         
0786 db50      in      a,(50h)		; test bit 3 of RS232 (jumper, should be 1) 
0788 cb5f      bit     3,a                
078a 2005      jr      nz,0791h         ; 
078c 3eff      ld      a,0ffh		; if zero, store ffh (= rst 38h)
078e 3223f8    ld      (0f823h),a	; to f823h
0791 21e1f7    ld      hl,0f7e1h          
0794 2219f0    ld      (0f019h),hl	; f7e1h points to RET
0797 ed5b1930  ld      de,(3019h)
079b b7        or      a
079c ed52      sbc     hl,de
079e 280c      jr      z,07ach          ; (+0ch)
07a0 210000    ld      hl,0000h
07a3 224bff    ld      (0ff4bh),hl
07a6 21ffbf    ld      hl,0bfffh
07a9 224dff    ld      (0ff4dh),hl

;--------------------------------------------------
; Looks like the main Atari SIO handler loop
;--------------------------------------------------
07ac cdd1f8    call    0f8d1h		;output to printer?
07af 2a3aff    ld      hl,(0ff3ah)
07b2 cdbdf7    call    0f7bdh		;call (ff3a)
07b5 2a3cff    ld      hl,(0ff3ch)	
07b8 cdbdf7    call    0f7bdh		;call (ff3c)
07bb 18ef      jr      07ach            ; (-11h)

07bd e9        jp      (hl)

07be db70      in      a,(70h)		;in SIO
07c0 e68a      and     8ah
07c2 fe8a      cp      8ah
07c4 c0        ret     nz

;--------------------------------------------------
; program CTC to detect CMD
;--------------------------------------------------
07c5 f3        di      
07c6 af        xor     a
07c7 3255ff    ld      (0ff55h),a	;select 0=CMD or 1=SIO
07ca d357      out     (57h),a
07cc 3ed7      ld      a,0d7h		;
07ce d380      out     (80h),a		;program CTC
07d0 3e01      ld      a,01h
07d2 d380      out     (80h),a		;counter
07d4 2199f6    ld      hl,0f699h
07d7 2210ff    ld      (0ff10h),hl
07da fb        ei      
07db 21e2f7    ld      hl,0f7e2h
07de 223aff    ld      (0ff3ah),hl
07e1 c9        ret     

;--------------------------------------------------
; handle command frame
;--------------------------------------------------
07e2 3a55ff    ld      a,(0ff55h)
07e5 b7        or      a
07e6 c8        ret     z		;no frame received yet
07e7 fe01      cp      01h		;frame received
07e9 2808      jr      z,07f3h          ;handle it 
07eb f3        di      
07ec 3e03      ld      a,03h
07ee d380      out     (80h),a
07f0 fb        ei      
07f1 1816      jr      0809h            ; (+16h)

07f3 3afbc2    ld      a,(0c2fbh)
07f6 2a38ff    ld      hl,(0ff38h)	;f821h
07f9 cd10f8    call    0f810h
07fc 200b      jr      nz,0809h         ; (+0bh)
07fe 3afcc2    ld      a,(0c2fch)
0801 cd10f8    call    0f810h
0804 2003      jr      nz,0809h         ; (+03h)
0806 cdbdf7    call    0f7bdh

0809 21bef7    ld      hl,0f7beh
080c 223aff    ld      (0ff3ah),hl
080f c9        ret     

0810 4e        ld      c,(hl)
0811 23        inc     hl
0812 46        ld      b,(hl)
0813 23        inc     hl
0814 edb1      cpir    
0816 c0        ret     nz

0817 f5        push    af
0818 09        add     hl,bc
0819 09        add     hl,bc
081a 09        add     hl,bc
081b 7e        ld      a,(hl)
081c 23        inc     hl
081d 66        ld      h,(hl)
081e 6f        ld      l,a
081f f1        pop     af
0820 c9        ret     

0821 0600      ld      b,00h
0823 40        ld      b,b
0824 313233    ld      sp,3332h
0827 34        inc     (hl)
0828 5a        ld      e,d
0829 54        ld      d,h
082a f8        ret     m

082b 3d        dec     a
082c f8        ret     m

082d 3d        dec     a
082e f8        ret     m

082f 3d        dec     a
0830 f8        ret     m

0831 3d        dec     a
0832 f8        ret     m

0833 35        dec     (hl)
0834 f8        ret     m

0835 02        ld      (bc),a
0836 00        nop     
0837 53        ld      d,e
0838 57        ld      d,a
0839 78        ld      a,b
083a f8        ret     m

083b 62        ld      h,d
083c f8        ret     m

083d 07        rlca    
083e 00        nop     
083f 52        ld      d,d
0840 53        ld      d,e
0841 57        ld      d,a
0842 50        ld      d,b
0843 4e        ld      c,(hl)
0844 4f        ld      c,a
0845 2138fb    ld      hl,0fb38h
0848 05        dec     b
0849 fce7fb    call    m,0fbe7h
084c 05        dec     b
084d f9        ld      sp,hl
084e 08        ex      af,af'
084f f9        ld      sp,hl
0850 dbfa      in      a,(0fah)
0852 8c        adc     a,h
0853 f9        ld      sp,hl
0854 04        inc     b
0855 00        nop     
0856 52        ld      d,d
0857 57        ld      d,a
0858 53        ld      d,e
0859 47        ld      b,a
085a b4        or      h
085b fca6fc    call    m,0fca6h
085e 7b        ld      a,e
085f fc5ffc    call    m,0fc5fh
0862 cd4afc    call    0fc4ah
0865 2143ff    ld      hl,0ff43h
0868 11fcc2    ld      de,0c2fch
086b d5        push    de
086c 010400    ld      bc,0004h
086f edb0      ldir    
0871 e1        pop     hl
0872 114300    ld      de,0043h
0875 c36cf6    jp      0f66ch
0878 cd4afc    call    0fc4ah
087b cdb9f6    call    0f6b9h
087e c0        ret     nz

087f 112800    ld      de,0028h
0882 b7        or      a
0883 ed52      sbc     hl,de
0885 c0        ret     nz

0886 cd4afc    call    0fc4ah
0889 2100c1    ld      hl,0c100h
088c 0628      ld      b,28h
088e 7e        ld      a,(hl)
088f fe9b      cp      9bh
0891 2005      jr      nz,0898h         ; (+05h)
0893 213eff    ld      hl,0ff3eh
0896 46        ld      b,(hl)
0897 23        inc     hl
0898 e5        push    hl
0899 2a4fff    ld      hl,(0ff4fh)
089c ed5b4dff  ld      de,(0ff4dh)
08a0 b7        or      a
08a1 ed52      sbc     hl,de
08a3 e1        pop     hl
08a4 380e      jr      c,08b4h          ; (+0eh)
08a6 e5        push    hl
08a7 c5        push    bc
08a8 cdd1f8    call    0f8d1h
08ab c1        pop     bc
08ac e1        pop     hl
08ad db70      in      a,(70h)
08af e602      and     02h
08b1 20e5      jr      nz,0898h         ; (-1bh)
08b3 c9        ret     

08b4 7e        ld      a,(hl)
08b5 23        inc     hl
08b6 e5        push    hl
08b7 c5        push    bc
08b8 2a51ff    ld      hl,(0ff51h)
08bb cdf1f8    call    0f8f1h
08be ed5351ff  ld      (0ff51h),de
08c2 77        ld      (hl),a
08c3 2a4fff    ld      hl,(0ff4fh)
08c6 23        inc     hl
08c7 224fff    ld      (0ff4fh),hl
08ca c1        pop     bc
08cb e1        pop     hl
08cc 10c0      djnz    088eh            ; (-40h)
08ce c354fc    jp      0fc54h

08d1 2a4fff    ld      hl,(0ff4fh)	;test ff4f if zero
08d4 7c        ld      a,h
08d5 b5        or      l
08d6 c8        ret     z		;yes, return

08d7 cd15f0    call    0f015h		;call reader (IN printer)
08da c0        ret     nz

08db 2a53ff    ld      hl,(0ff53h)
08de cdf1f8    call    0f8f1h		;compute new value (0 or hl+1)
08e1 ed5353ff  ld      (0ff53h),de
08e5 4e        ld      c,(hl)		;output (hl) to printer
08e6 cd12f0    call    0f012h		;call PUNCH
08e9 2a4fff    ld      hl,(0ff4fh)	;decrement value in ff4f/50
08ec 2b        dec     hl
08ed 224fff    ld      (0ff4fh),hl
08f0 c9        ret     

08f1 eb        ex      de,hl		;save hl to de
08f2 2a4bff    ld      hl,(0ff4bh)	;add (ff4b) to (ff53)
08f5 19        add     hl,de
08f6 e5        push    hl		;save result
08f7 13        inc     de
08f8 2a4dff    ld      hl,(0ff4dh)
08fb b7        or      a
08fc ed52      sbc     hl,de
08fe 3003      jr      nc,0903h         ; (+03h)
0900 110000    ld      de,0000h
0903 e1        pop     hl
0904 c9        ret     

0905 af        xor     a
0906 1802      jr      090ah            ; (+02h)
0908 3e01      ld      a,01h
090a 32b5ff    ld      (0ffb5h),a
090d cd28fc    call    0fc28h
0910 d8        ret     c

0911 cd4afc    call    0fc4ah
0914 cdb9f6    call    0f6b9h
0917 c0        ret     nz

0918 22a9ff    ld      (0ffa9h),hl
091b 118000    ld      de,0080h
091e b7        or      a
091f ed52      sbc     hl,de
0921 2804      jr      z,0927h          ; (+04h)
0923 b7        or      a
0924 ed52      sbc     hl,de
0926 c0        ret     nz

0927 cd4afc    call    0fc4ah
092a cd10fa    call    0fa10h
092d 204e      jr      nz,097dh         ; (+4eh)
092f 2100c1    ld      hl,0c100h
0932 229cff    ld      (0ff9ch),hl
0935 3aa9ff    ld      a,(0ffa9h)
0938 47        ld      b,a
0939 7e        ld      a,(hl)
093a 2f        cpl     
093b 77        ld      (hl),a
093c 23        inc     hl
093d 10fa      djnz    0939h            ; (-06h)
093f 3e02      ld      a,02h
0941 3298ff    ld      (0ff98h),a
0944 dd2198ff  ld      ix,0ff98h
0948 cd0ff0    call    0f00fh
094b 3aa0ff    ld      a,(0ffa0h)
094e b7        or      a
094f 202c      jr      nz,097dh         ; (+2ch)
0951 3ab5ff    ld      a,(0ffb5h)
0954 b7        or      a
0955 2826      jr      z,097dh          ; (+26h)
0957 3e01      ld      a,01h
0959 3298ff    ld      (0ff98h),a
095c 2100c3    ld      hl,0c300h
095f 229cff    ld      (0ff9ch),hl
0962 cd0ff0    call    0f00fh
0965 3aa0ff    ld      a,(0ffa0h)
0968 b7        or      a
0969 2012      jr      nz,097dh         ; (+12h)
096b 2100c1    ld      hl,0c100h
096e 1100c3    ld      de,0c300h
0971 3a9eff    ld      a,(0ff9eh)
0974 47        ld      b,a
0975 1a        ld      a,(de)
0976 ae        xor     (hl)
0977 200b      jr      nz,0984h         ; (+0bh)
0979 23        inc     hl
097a 13        inc     de
097b 10f8      djnz    0975h            ; (-08h)
097d cde3f9    call    0f9e3h
0980 7b        ld      a,e
0981 c356fc    jp      0fc56h
0984 af        xor     a
0985 cd06fa    call    0fa06h
0988 7b        ld      a,e
0989 c356fc    jp      0fc56h
098c cd28fc    call    0fc28h
098f d8        ret     c

0990 cd4afc    call    0fc4ah
0993 cd10fa    call    0fa10h
0996 f5        push    af
0997 280f      jr      z,09a8h          ; (+0fh)
0999 fd5606    ld      d,(iy+06h)
099c fd5e07    ld      e,(iy+07h)
099f 7a        ld      a,d
09a0 b3        or      e
09a1 2009      jr      nz,09ach         ; (+09h)
09a3 118000    ld      de,0080h
09a6 1804      jr      09ach            ; (+04h)
09a8 ed5b9eff  ld      de,(0ff9eh)
09ac 2afdc2    ld      hl,(0c2fdh)
09af 010400    ld      bc,0004h
09b2 b7        or      a
09b3 ed42      sbc     hl,bc
09b5 3003      jr      nc,09bah         ; (+03h)
09b7 118000    ld      de,0080h
09ba ed53a9ff  ld      (0ffa9h),de
09be 2100c3    ld      hl,0c300h
09c1 b7        or      a
09c2 ed52      sbc     hl,de
09c4 f1        pop     af
09c5 2014      jr      nz,09dbh         ; (+14h)
09c7 229cff    ld      (0ff9ch),hl
09ca 3e01      ld      a,01h
09cc 3298ff    ld      (0ff98h),a
09cf dd2198ff  ld      ix,0ff98h
09d3 e5        push    hl
09d4 cd0ff0    call    0f00fh
09d7 e1        pop     hl
09d8 3aa0ff    ld      a,(0ffa0h)
09db cde3f9    call    0f9e3h
09de 16ff      ld      d,0ffh
09e0 c36cf6    jp      0f66ch
09e3 b7        or      a
09e4 200a      jr      nz,09f0h         ; (+0ah)
09e6 fd770d    ld      (iy+0dh),a
09e9 1e43      ld      e,43h
09eb fdcb0c96  res     2,(iy+0ch)
09ef c9        ret     

09f0 cb77      bit     6,a
09f2 2802      jr      z,09f6h          ; (+02h)
09f4 e69f      and     9fh
09f6 cb6f      bit     5,a
09f8 2802      jr      z,09fch          ; (+02h)
09fa f660      or      60h
09fc 4f        ld      c,a
09fd e681      and     81h
09ff 79        ld      a,c
0a00 2804      jr      z,0a06h          ; (+04h)
0a02 e67e      and     7eh
0a04 f610      or      10h
0a06 fd770d    ld      (iy+0dh),a
0a09 1e45      ld      e,45h
0a0b fdcb0cd6  set     2,(iy+0ch)
0a0f c9        ret     

0a10 3a2eff    ld      a,(0ff2eh)
0a13 b7        or      a
0a14 2811      jr      z,0a27h          ; (+11h)
0a16 af        xor     a
0a17 322eff    ld      (0ff2eh),a
0a1a 2164ff    ld      hl,0ff64h
0a1d 111000    ld      de,0010h
0a20 0604      ld      b,04h
0a22 cb86      res     0,(hl)
0a24 19        add     hl,de
0a25 10fb      djnz    0a22h            ; (-05h)
0a27 fdcb0e46  bit     0,(iy+0eh)
0a2b 206d      jr      nz,0a9ah         ; (+6dh)
0a2d 3e03      ld      a,03h
0a2f 3298ff    ld      (0ff98h),a
0a32 3a99ff    ld      a,(0ff99h)
0a35 2120ff    ld      hl,0ff20h
0a38 85        add     a,l
0a39 6f        ld      l,a
0a3a 7e        ld      a,(hl)
0a3b fe50      cp      50h
0a3d 3801      jr      c,0a40h          ; (+01h)
0a3f af        xor     a
0a40 329aff    ld      (0ff9ah),a
0a43 21abff    ld      hl,0ffabh
0a46 229cff    ld      (0ff9ch),hl
0a49 dd2198ff  ld      ix,0ff98h
0a4d cd0ff0    call    0f00fh
0a50 3aa0ff    ld      a,(0ffa0h)
0a53 b7        or      a
0a54 c0        ret     nz

0a55 3aaeff    ld      a,(0ffaeh)
0a58 cdcdfa    call    0facdh
0a5b fd7006    ld      (iy+06h),b
0a5e fd7107    ld      (iy+07h),c
0a61 3a9eff    ld      a,(0ff9eh)
0a64 07        rlca    
0a65 07        rlca    
0a66 07        rlca    
0a67 2f        cpl     
0a68 e606      and     06h
0a6a fd7705    ld      (iy+05h),a
0a6d cb4f      bit     1,a
0a6f 2807      jr      z,0a78h          ; (+07h)
0a71 3e4d      ld      a,4dh
0a73 211a00    ld      hl,001ah
0a76 1805      jr      0a7dh            ; (+05h)
0a78 3e28      ld      a,28h
0a7a 211200    ld      hl,0012h
0a7d fdbe00    cp      (iy+00h)
0a80 3803      jr      c,0a85h          ; (+03h)
0a82 fd7700    ld      (iy+00h),a
0a85 fd7402    ld      (iy+02h),h
0a88 fd7503    ld      (iy+03h),l
0a8b fdcb0ec6  set     0,(iy+0eh)
0a8f 2a96ff    ld      hl,(0ff96h)
0a92 7c        ld      a,h
0a93 b5        or      l
0a94 2004      jr      nz,0a9ah         ; (+04h)
0a96 fd2296ff  ld      (0ff96h),iy
0a9a 2afdc2    ld      hl,(0c2fdh)
0a9d 2b        dec     hl
0a9e 1600      ld      d,00h
0aa0 fd5e03    ld      e,(iy+03h)
0aa3 3eff      ld      a,0ffh
0aa5 3c        inc     a
0aa6 b7        or      a
0aa7 ed52      sbc     hl,de
0aa9 30fa      jr      nc,0aa5h         ; (-06h)
0aab 19        add     hl,de
0aac 23        inc     hl
0aad 4d        ld      c,l
0aae 219bff    ld      hl,0ff9bh
0ab1 71        ld      (hl),c
0ab2 fdbe00    cp      (iy+00h)
0ab5 3808      jr      c,0abfh          ; (+08h)
0ab7 fd9600    sub     (iy+00h)
0aba 2199ff    ld      hl,0ff99h
0abd cbfe      set     7,(hl)
0abf 329aff    ld      (0ff9ah),a
0ac2 fd6606    ld      h,(iy+06h)
0ac5 fd6e07    ld      l,(iy+07h)
0ac8 229eff    ld      (0ff9eh),hl
0acb af        xor     a
0acc c9        ret     

0acd 018000    ld      bc,0080h
0ad0 e603      and     03h
0ad2 c8        ret     z

0ad3 cb21      sla     c
0ad5 cb10      rl      b
0ad7 3d        dec     a
0ad8 20f9      jr      nz,0ad3h         ; (-07h)
0ada c9        ret     

0adb cd28fc    call    0fc28h
0ade d8        ret     c

0adf cd4afc    call    0fc4ah
0ae2 cdd3fb    call    0fbd3h
0ae5 3ac9ff    ld      a,(0ffc9h)
0ae8 f5        push    af
0ae9 3e00      ld      a,00h
0aeb 3298ff    ld      (0ff98h),a
0aee dd2198ff  ld      ix,0ff98h
0af2 cd0ff0    call    0f00fh
0af5 fd4e0c    ld      c,(iy+0ch)
0af8 fd360c00  ld      (iy+0ch),00h
0afc f1        pop     af
0afd b7        or      a
0afe 2804      jr      z,0b04h          ; (+04h)
0b00 cbe1      set     4,c
0b02 1802      jr      0b06h            ; (+02h)
0b04 cba1      res     4,c
0b06 fdcb0556  bit     2,(iy+05h)
0b0a 2804      jr      z,0b10h          ; (+04h)
0b0c cbe9      set     5,c
0b0e 1802      jr      0b12h            ; (+02h)
0b10 cba9      res     5,c
0b12 ddcb0876  bit     6,(ix+08h)
0b16 2804      jr      z,0b1ch          ; (+04h)
0b18 cbd9      set     3,c
0b1a 1802      jr      0b1eh            ; (+02h)
0b1c cb99      res     3,c
0b1e 21fcc2    ld      hl,0c2fch
0b21 e5        push    hl
0b22 71        ld      (hl),c
0b23 23        inc     hl
0b24 fd7e0d    ld      a,(iy+0dh)
0b27 2f        cpl     
0b28 77        ld      (hl),a
0b29 23        inc     hl
0b2a 36e0      ld      (hl),0e0h
0b2c 23        inc     hl
0b2d 3a2dff    ld      a,(0ff2dh)
0b30 77        ld      (hl),a
0b31 e1        pop     hl
0b32 114300    ld      de,0043h
0b35 c36cf6    jp      0f66ch
0b38 cd28fc    call    0fc28h
0b3b d8        ret     c

0b3c 2a4fff    ld      hl,(0ff4fh)
0b3f 7c        ld      a,h
0b40 b5        or      l
0b41 c0        ret     nz

0b42 cdd3fb    call    0fbd3h
0b45 c8        ret     z

0b46 cd4afc    call    0fc4ah
0b49 3e00      ld      a,00h
0b4b 3298ff    ld      (0ff98h),a
0b4e dd2198ff  ld      ix,0ff98h
0b52 cd0ff0    call    0f00fh
0b55 cdcbf3    call    0f3cbh
0b58 3a2fff    ld      a,(0ff2fh)
0b5b fdcb0556  bit     2,(iy+05h)
0b5f 2807      jr      z,0b68h          ; (+07h)
0b61 cbbf      res     7,a
0b63 2100c2    ld      hl,0c200h
0b66 1805      jr      0b6dh            ; (+05h)
0b68 cbff      set     7,a
0b6a 2180c2    ld      hl,0c280h
0b6d 322fff    ld      (0ff2fh),a
0b70 d330      out     (30h),a
0b72 e5        push    hl
0b73 22c1ff    ld      (0ffc1h),hl
0b76 210100    ld      hl,0001h
0b79 22bfff    ld      (0ffbfh),hl
0b7c 2a49ff    ld      hl,(0ff49h)
0b7f 11b6ff    ld      de,0ffb6h
0b82 010700    ld      bc,0007h
0b85 07        rlca    
0b86 07        rlca    
0b87 e603      and     03h
0b89 2804      jr      z,0b8fh          ; (+04h)
0b8b 09        add     hl,bc
0b8c 3d        dec     a
0b8d 20fc      jr      nz,0b8bh         ; (-04h)
0b8f edb0      ldir    
0b91 3aa0ff    ld      a,(0ffa0h)
0b94 e6c0      and     0c0h
0b96 2013      jr      nz,0babh         ; (+13h)
0b98 fd7e04    ld      a,(iy+04h)
0b9b 32bdff    ld      (0ffbdh),a
0b9e fd7e00    ld      a,(iy+00h)
0ba1 32beff    ld      (0ffbeh),a
0ba4 fde5      push    iy
0ba6 cdbefc    call    0fcbeh
0ba9 fde1      pop     iy
0bab e1        pop     hl
0bac cde3f9    call    0f9e3h
0baf 1600      ld      d,00h
0bb1 cd6cf6    call    0f66ch
0bb4 c33cf0    jp      0f03ch
0bb7 9f        sbc     a,a
0bb8 fee2      cp      0e2h
0bba fe1a      cp      1ah
0bbc b0        or      b
0bbd 2835      jr      z,0bf4h          ; (+35h)
0bbf fe68      cp      68h
0bc1 fe12      cp      12h
0bc3 6a        ld      l,d
0bc4 187a      jr      0c40h            ; (+7ah)
0bc6 fec8      cp      0c8h
0bc8 fe1a      cp      1ah
0bca 58        ld      e,b
0bcb 14        inc     d
0bcc 16fe      ld      d,0feh
0bce 56        ld      d,(hl)
0bcf fe12      cp      12h
0bd1 35        dec     (hl)
0bd2 0c        inc     c
0bd3 fd7e00    ld      a,(iy+00h)
0bd6 b7        or      a
0bd7 c0        ret     nz

0bd8 2a96ff    ld      hl,(0ff96h)
0bdb 7c        ld      a,h
0bdc b5        or      l
0bdd c8        ret     z

0bde fde5      push    iy
0be0 d1        pop     de
0be1 010c00    ld      bc,000ch
0be4 edb0      ldir    
0be6 c9        ret     

0be7 cd28fc    call    0fc28h
0bea d8        ret     c

0beb cdd3fb    call    0fbd3h
0bee c8        ret     z

0bef cd4afc    call    0fc4ah
0bf2 fde5      push    iy
0bf4 e1        pop     hl
0bf5 11f4c2    ld      de,0c2f4h
0bf8 d5        push    de
0bf9 010c00    ld      bc,000ch
0bfc edb0      ldir    
0bfe e1        pop     hl
0bff 114300    ld      de,0043h
0c02 c36cf6    jp      0f66ch
0c05 cd28fc    call    0fc28h
0c08 d8        ret     c

0c09 cd4afc    call    0fc4ah
0c0c cdb9f6    call    0f6b9h
0c0f c0        ret     nz

0c10 110c00    ld      de,000ch
0c13 b7        or      a
0c14 ed52      sbc     hl,de
0c16 c0        ret     nz

0c17 cd4afc    call    0fc4ah
0c1a 2100c1    ld      hl,0c100h
0c1d fde5      push    iy
0c1f d1        pop     de
0c20 010c00    ld      bc,000ch
0c23 edb0      ldir    
0c25 c354fc    jp      0fc54h
0c28 3afbc2    ld      a,(0c2fbh)
0c2b d631      sub     31h
0c2d fe04      cp      04h
0c2f 3f        ccf     
0c30 d8        ret     c

0c31 2600      ld      h,00h
0c33 6f        ld      l,a
0c34 29        add     hl,hl
0c35 29        add     hl,hl
0c36 29        add     hl,hl
0c37 29        add     hl,hl
0c38 0156ff    ld      bc,0ff56h
0c3b 09        add     hl,bc
0c3c e5        push    hl
0c3d fde1      pop     iy
0c3f fdcb0876  bit     6,(iy+08h)
0c43 37        scf     
0c44 c8        ret     z

0c45 3299ff    ld      (0ff99h),a
0c48 af        xor     a
0c49 c9        ret     

0c4a db70      in      a,(70h)
0c4c cb4f      bit     1,a
0c4e 28fa      jr      z,0c4ah          ; (-06h)
0c50 3e41      ld      a,41h
0c52 1802      jr      0c56h            ; (+02h)
0c54 3e43      ld      a,43h
0c56 2101c3    ld      hl,0c301h
0c59 77        ld      (hl),a
0c5a 1600      ld      d,00h
0c5c c384f6    jp      0f684h
0c5f cd4afc    call    0fc4ah
0c62 cd9cfc    call    0fc9ch
0c65 2100c3    ld      hl,0c300h
0c68 b7        or      a
0c69 ed42      sbc     hl,bc
0c6b e5        push    hl
0c6c eb        ex      de,hl
0c6d 2ab2fc    ld      hl,(0fcb2h)
0c70 f3        di      
0c71 edb0      ldir    
0c73 fb        ei      
0c74 e1        pop     hl
0c75 114300    ld      de,0043h
0c78 c36cf6    jp      0f66ch
0c7b cd4afc    call    0fc4ah
0c7e cdb9f6    call    0f6b9h
0c81 c0        ret     nz

0c82 cd9cfc    call    0fc9ch
0c85 b7        or      a
0c86 ed42      sbc     hl,bc
0c88 c0        ret     nz

0c89 c5        push    bc
0c8a cd4afc    call    0fc4ah
0c8d c1        pop     bc
0c8e 2100c1    ld      hl,0c100h
0c91 ed5bb2fc  ld      de,(0fcb2h)
0c95 f3        di      
0c96 edb0      ldir    
0c98 fb        ei      
0c99 c354fc    jp      0fc54h
0c9c 3afdc2    ld      a,(0c2fdh)
0c9f 4f        ld      c,a
0ca0 0600      ld      b,00h
0ca2 b7        or      a
0ca3 c0        ret     nz

0ca4 04        inc     b
0ca5 c9        ret     

0ca6 cd4afc    call    0fc4ah
0ca9 2afdc2    ld      hl,(0c2fdh)
0cac 22b2fc    ld      (0fcb2h),hl
0caf c354fc    jp      0fc54h
0cb2 00        nop     
0cb3 00        nop     
0cb4 cd4afc    call    0fc4ah
0cb7 cd54fc    call    0fc54h
0cba 2afdc2    ld      hl,(0c2fdh)
0cbd e9        jp      (hl)
0cbe af        xor     a
0cbf d356      out     (56h),a
0cc1 3c        inc     a
0cc2 d354      out     (54h),a
0cc4 3e0b      ld      a,0bh
0cc6 cd6bf3    call    0f36bh
0cc9 ee04      xor     04h
0ccb e684      and     84h
0ccd c29afd    jp      nz,0fd9ah
0cd0 2100c3    ld      hl,0c300h
0cd3 3abcff    ld      a,(0ffbch)
0cd6 3c        inc     a
0cd7 47        ld      b,a
0cd8 3676      ld      (hl),76h
0cda 23        inc     hl
0cdb 36ed      ld      (hl),0edh
0cdd 23        inc     hl
0cde 36a3      ld      (hl),0a3h
0ce0 23        inc     hl
0ce1 3620      ld      (hl),20h
0ce3 23        inc     hl
0ce4 36fb      ld      (hl),0fbh
0ce6 23        inc     hl
0ce7 10ef      djnz    0cd8h            ; (-11h)
0ce9 3ec9      ld      a,0c9h
0ceb 77        ld      (hl),a
0cec 326600    ld      (0066h),a
0cef 23        inc     hl
0cf0 22c3ff    ld      (0ffc3h),hl
0cf3 af        xor     a
0cf4 322dff    ld      (0ff2dh),a
0cf7 b7        or      a
0cf8 2805      jr      z,0cffh          ; (+05h)
0cfa 3e4b      ld      a,4bh
0cfc cd6bf3    call    0f36bh
0cff dd2ab6ff  ld      ix,(0ffb6h)
0d03 fd2ab8ff  ld      iy,(0ffb8h)
0d07 3abdff    ld      a,(0ffbdh)
0d0a 1f        rra     
0d0b 3a2fff    ld      a,(0ff2fh)
0d0e 3007      jr      nc,0d17h         ; (+07h)
0d10 ee20      xor     20h
0d12 322fff    ld      (0ff2fh),a
0d15 d330      out     (30h),a
0d17 cda4fd    call    0fda4h
0d1a 3a2dff    ld      a,(0ff2dh)
0d1d d341      out     (41h),a
0d1f 2ac3ff    ld      hl,(0ffc3h)
0d22 f3        di      
0d23 3ef4      ld      a,0f4h
0d25 cd89f3    call    0f389h
0d28 3abbff    ld      a,(0ffbbh)
0d2b 47        ld      b,a
0d2c 0e43      ld      c,43h
0d2e cd00c3    call    0c300h
0d31 fb        ei      
0d32 db40      in      a,(40h)
0d34 cb47      bit     0,a
0d36 20fa      jr      nz,0d32h         ; (-06h)
0d38 ed5bbfff  ld      de,(0ffbfh)
0d3c 2ac1ff    ld      hl,(0ffc1h)
0d3f 3abaff    ld      a,(0ffbah)
0d42 47        ld      b,a
0d43 dd2ab8ff  ld      ix,(0ffb8h)
0d47 dd7e00    ld      a,(ix+00h)
0d4a dd23      inc     ix
0d4c d342      out     (42h),a
0d4e 3a2fff    ld      a,(0ff2fh)
0d51 e620      and     20h
0d53 3e88      ld      a,88h
0d55 2802      jr      z,0d59h          ; (+02h)
0d57 cbcf      set     1,a
0d59 cd62f3    call    0f362h
0d5c e698      and     98h
0d5e 2814      jr      z,0d74h          ; (+14h)
0d60 e680      and     80h
0d62 2036      jr      nz,0d9ah         ; (+36h)
0d64 e5        push    hl
0d65 c5        push    bc
0d66 01fdc2    ld      bc,0c2fdh
0d69 b7        or      a
0d6a ed42      sbc     hl,bc
0d6c c1        pop     bc
0d6d e1        pop     hl
0d6e 3004      jr      nc,0d74h         ; (+04h)
0d70 73        ld      (hl),e
0d71 23        inc     hl
0d72 72        ld      (hl),d
0d73 23        inc     hl
0d74 13        inc     de
0d75 10d0      djnz    0d47h            ; (-30h)
0d77 ed53bfff  ld      (0ffbfh),de
0d7b 22c1ff    ld      (0ffc1h),hl
0d7e 3a2fff    ld      a,(0ff2fh)
0d81 e620      and     20h
0d83 c2fffc    jp      nz,0fcffh
0d86 3a2dff    ld      a,(0ff2dh)
0d89 3c        inc     a
0d8a 21beff    ld      hl,0ffbeh
0d8d be        cp      (hl)
0d8e daf4fc    jp      c,0fcf4h
0d91 2ac1ff    ld      hl,(0ffc1h)
0d94 36ff      ld      (hl),0ffh
0d96 23        inc     hl
0d97 36ff      ld      (hl),0ffh
0d99 af        xor     a
0d9a f5        push    af
0d9b 3eff      ld      a,0ffh
0d9d 322dff    ld      (0ff2dh),a
0da0 d341      out     (41h),a
0da2 f1        pop     af
0da3 c9        ret     

0da4 3abaff    ld      a,(0ffbah)
0da7 4f        ld      c,a
0da8 dde5      push    ix
0daa e1        pop     hl
0dab 46        ld      b,(hl)
0dac 23        inc     hl
0dad ed5bc3ff  ld      de,(0ffc3h)
0db1 cd0bfe    call    0fe0bh
0db4 10fb      djnz    0db1h            ; (-05h)
0db6 46        ld      b,(hl)
0db7 23        inc     hl
0db8 e5        push    hl
0db9 dde1      pop     ix
0dbb 3a2dff    ld      a,(0ff2dh)
0dbe dd7707    ld      (ix+07h),a
0dc1 3a2fff    ld      a,(0ff2fh)
0dc4 e620      and     20h
0dc6 3e00      ld      a,00h
0dc8 2801      jr      z,0dcbh          ; (+01h)
0dca 3c        inc     a
0dcb dd7709    ld      (ix+09h),a
0dce fd7e00    ld      a,(iy+00h)
0dd1 fd23      inc     iy
0dd3 dd770b    ld      (ix+0bh),a
0dd6 dde5      push    ix
0dd8 e1        pop     hl
0dd9 c5        push    bc
0dda cd0bfe    call    0fe0bh
0ddd 10fb      djnz    0ddah            ; (-05h)
0ddf dd7e0d    ld      a,(ix+0dh)
0de2 cdcdfa    call    0facdh
0de5 3eff      ld      a,0ffh
0de7 12        ld      (de),a
0de8 13        inc     de
0de9 0b        dec     bc
0dea 78        ld      a,b
0deb b1        or      c
0dec 20f7      jr      nz,0de5h         ; (-09h)
0dee 46        ld      b,(hl)
0def 23        inc     hl
0df0 cd0bfe    call    0fe0bh
0df3 10fb      djnz    0df0h            ; (-05h)
0df5 c1        pop     bc
0df6 0d        dec     c
0df7 20c2      jr      nz,0dbbh         ; (-3eh)
0df9 2ac3ff    ld      hl,(0ffc3h)
0dfc 01d827    ld      bc,27d8h
0dff 09        add     hl,bc
0e00 ed52      sbc     hl,de
0e02 44        ld      b,h
0e03 4d        ld      c,l
0e04 62        ld      h,d
0e05 6b        ld      l,e
0e06 13        inc     de
0e07 77        ld      (hl),a
0e08 edb0      ldir    
0e0a c9        ret     

0e0b c5        push    bc
0e0c 46        ld      b,(hl)
0e0d 23        inc     hl
0e0e 7e        ld      a,(hl)
0e0f 23        inc     hl
0e10 12        ld      (de),a
0e11 13        inc     de
0e12 10fc      djnz    0e10h            ; (-04h)
0e14 c1        pop     bc
0e15 c9        ret     

0e16 0110ff    ld      bc,0ff10h
0e19 0b        dec     bc
0e1a 03        inc     bc
0e1b 00        nop     
0e1c 03        inc     bc
0e1d 00        nop     
0e1e 01fe01    ld      bc,01feh
0e21 00        nop     
0e22 010001    ld      bc,0100h
0e25 00        nop     
0e26 010001    ld      bc,0100h
0e29 f7        rst     30h
0e2a 0b        dec     bc
0e2b ff        rst     38h
0e2c 0600      ld      b,00h
0e2e 01fb02    ld      bc,02fbh
0e31 01f709    ld      bc,09f7h
0e34 ff        rst     38h
0e35 01204e    ld      bc,4e20h
0e38 0c        inc     c
0e39 0c        inc     c
0e3a 00        nop     
0e3b 03        inc     bc
0e3c f5        push    af
0e3d 01fe01    ld      bc,01feh
0e40 00        nop     
0e41 010001    ld      bc,0100h
0e44 00        nop     
0e45 010101    ld      bc,0101h
0e48 f7        rst     30h
0e49 164e      ld      d,4eh
0e4b 0c        inc     c
0e4c 00        nop     
0e4d 03        inc     bc
0e4e f5        push    af
0e4f 01fb02    ld      bc,02fbh
0e52 01f710    ld      bc,10f7h
0e55 4e        ld      c,(hl)
0e56 12        ld      (de),a
0e57 100e      djnz    0e67h            ; (+0eh)
0e59 0c        inc     c
0e5a 0a        ld      a,(bc)
0e5b 08        ex      af,af'
0e5c 0604      ld      b,04h
0e5e 02        ld      (bc),a
0e5f 110f0d    ld      de,0d0fh
0e62 0b        dec     bc
0e63 09        add     hl,bc
0e64 07        rlca    
0e65 05        dec     b
0e66 03        inc     bc
0e67 010107    ld      bc,0701h
0e6a 0d        dec     c
0e6b 060c      ld      b,0ch
0e6d 12        ld      (de),a
0e6e 05        dec     b
0e6f 0b        dec     bc
0e70 11040a    ld      de,0a04h
0e73 1003      djnz    0e78h            ; (+03h)
0e75 09        add     hl,bc
0e76 0f        rrca    
0e77 02        ld      (bc),a
0e78 08        ex      af,af'
0e79 0e04      ld      c,04h
0e7b 28ff      jr      z,0e7ch          ; (-01h)
0e7d 0600      ld      b,00h
0e7f 01fc1a    ld      bc,1afch
0e82 ff        rst     38h
0e83 0b        dec     bc
0e84 03        inc     bc
0e85 00        nop     
0e86 03        inc     bc
0e87 00        nop     
0e88 01fe01    ld      bc,01feh
0e8b 00        nop     
0e8c 010001    ld      bc,0100h
0e8f 00        nop     
0e90 010001    ld      bc,0100h
0e93 f7        rst     30h
0e94 0b        dec     bc
0e95 ff        rst     38h
0e96 0600      ld      b,00h
0e98 01fb02    ld      bc,02fbh
0e9b 01f71b    ld      bc,1bf7h
0e9e ff        rst     38h
0e9f 05        dec     b
0ea0 50        ld      d,b
0ea1 4e        ld      c,(hl)
0ea2 0c        inc     c
0ea3 00        nop     
0ea4 03        inc     bc
0ea5 f601      or      01h
0ea7 fc324e    call    m,4e32h
0eaa 0c        inc     c
0eab 0c        inc     c
0eac 00        nop     
0ead 03        inc     bc
0eae f5        push    af
0eaf 01fe01    ld      bc,01feh
0eb2 00        nop     
0eb3 010001    ld      bc,0100h
0eb6 00        nop     
0eb7 010101    ld      bc,0101h
0eba f7        rst     30h
0ebb 164e      ld      d,4eh
0ebd 0c        inc     c
0ebe 00        nop     
0ebf 03        inc     bc
0ec0 f5        push    af
0ec1 01fb02    ld      bc,02fbh
0ec4 01f735    ld      bc,35f7h
0ec7 4e        ld      c,(hl)
0ec8 010e03    ld      bc,030eh
0ecb 1005      djnz    0ed2h            ; (+05h)
0ecd 12        ld      (de),a
0ece 07        rlca    
0ecf 14        inc     d
0ed0 09        add     hl,bc
0ed1 160b      ld      d,0bh
0ed3 180d      jr      0ee2h            ; (+0dh)
0ed5 1a        ld      a,(de)
0ed6 02        ld      (bc),a
0ed7 0f        rrca    
0ed8 04        inc     b
0ed9 110613    ld      de,1306h
0edc 08        ex      af,af'
0edd 15        dec     d
0ede 0a        ld      a,(bc)
0edf 17        rla     
0ee0 0c        inc     c
0ee1 19        add     hl,de
0ee2 011209    ld      bc,0912h
0ee5 1a        ld      a,(de)
0ee6 110819    ld      de,1908h
0ee9 1007      djnz    0ef2h            ; (+07h)
0eeb 180f      jr      0efch            ; (+0fh)
0eed 0617      ld      b,17h
0eef 0e05      ld      c,05h
0ef1 160d      ld      d,0dh
0ef3 04        inc     b
0ef4 15        dec     d
0ef5 0c        inc     c
0ef6 03        inc     bc
0ef7 14        inc     d
0ef8 0b        dec     bc
0ef9 02        ld      (bc),a
0efa 13        inc     de
0efb 0a        ld      a,(bc)

;int values of variables at 0ff20h
ff20	0efc ff        
ff21	0efd ff        
ff22	0efe ff        
ff23	0eff ff        
ff24	0f00 00        
ff25	0f01 00        
ff26	0f02 00        
ff27	0f03 00        
ff28	0f04 1010      
ff2a	0f06 1010      
ff2c	0f08 00        
ff2d	0f09 ff        
ff2e	0f0a 010000    
ff31	0f0d 00        
ff32	0f0e 320a00    
ff35	0f11 00        
ff36	0f12 00        
ff37	0f13 00        
ff38	0f14 21f8be    		;ff3a f7be
ff3b	0f17 f7        
ff3c	0f18 e1        
ff3d	0f19 f7        
ff3e	0f1a 02        
ff3f	0f1b 0d        
ff40	0f1c 0a        
ff41	0f1d 00        
ff42	0f1e 00        
ff43	0f1f 00        
ff44	0f20 00        
ff45	0f21 3c        
ff46	0f22 00        
ff47	0f23 80        
ff48	0f24 00        
ff49	0f25 b7        
ff4a	0f26 fb        
ff4b	0f27 00        
ff4c	0f28 c5        
ff4d	0f29 ff        
ff4e	0f2a 0f        

0f2b 73        ld      (hl),e
0f2c 00        nop     
0f2d 00        nop     
0f2e 00        nop     
0f2f 00        nop     
0f30 00        nop     
0f31 00        nop     
0f32 00        nop     
0f33 00        nop     
0f34 00        nop     
0f35 00        nop     
0f36 00        nop     
0f37 53        ld      d,e
0f38 41        ld      b,c
0f39 4c        ld      c,h
0f3a 4c        ld      c,h
0f3b 59        ld      e,c
0f3c 2031      jr      nz,0f6fh         ; (+31h)
0f3e 2052      jr      nz,0f92h         ; (+52h)
0f40 65        ld      h,l
0f41 76        halt    
0f42 2031      jr      nz,0f75h         ; (+31h)
0f44 2e30      ld      l,30h
0f46 310000    ld      sp,0000h


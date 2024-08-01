; Disassembly of the file "C:\github\Sally-1\ROM sally 1 Rev 85"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Monday, 25 of March 2024 at 05:53 PM
; 
0000 f3        di      
0001 af        xor     a
0002 3d        dec     a
0003 20fd      jr      nz,0002h         ; (-03h)
0005 21a300    ld      hl,00a3h
0008 07        rlca    
0009 0b        dec     bc
000a 4e        ld      c,(hl)
000b 23        inc     hl
000c eda3      outi    
000e 20fa      jr      nz,000ah         ; (-06h)
0010 2100f0    ld      hl,0f000h
0013 3e01      ld      a,01h
0015 0610      ld      b,10h
0017 77        ld      (hl),a
0018 07        rlca    
0019 2c        inc     l
001a 20fb      jr      nz,0017h         ; (-05h)
001c 24        inc     h
001d 10f8      djnz    0017h            ; (-08h)
001f 0e00      ld      c,00h
0021 1100f0    ld      de,0f000h
0024 01fc0e    ld      bc,0efch
0027 edb0      ldir    
0029 21b50f    ld      hl,0fb5h
002c 1120ff    ld      de,0ff20h
002f 010011    ld      bc,1100h
0032 00        nop     
0033 f0        ret     p

0034 01fc0e    ld      bc,0efch
0037 edb0      ldir    
0039 21b50f    ld      hl,0fb5h
003c 1120ff    ld      de,0ff20h
003f 012f00    ld      bc,002fh
0042 edb0      ldir    
0044 af        xor     a
0045 12        ld      (de),a
0046 1c        inc     e
0047 2005      jr      nz,004eh         ; (+05h)
0049 3e4b      ld      a,4bh
004b cd6bf3    call    0f36bh
004e 10f9      djnz    0049h            ; (-07h)
0050 ed5e      im      2
0052 3e4f      ld      a,4fh
0054 d330      out     (30h),a
0056 57        ld      d,a
0057 0605      ld      b,05h
0059 3e4b      ld      a,4bh
005b cd6bf3    call    0f36bh
005e 10f9      djnz    0059h            ; (-07h)
0060 40        ld      b,b
0061 d330      out     (30h),a
0063 e3        ex      (sp),hl
0064 30e3      jr      nc,0049h         ; (-1dh)
0066 e3        ex      (sp),hl
0067 3ecb      ld      a,0cbh
0069 57        ld      d,a
006a 28f3      jr      z,005fh          ; (-0dh)
006c 1e01      ld      e,01h
006e 7b        ld      a,e
006f f640      or      40h
0071 d330      out     (30h),a
0073 e3        ex      (sp),hl
0074 e3        ex      (sp),hl
0075 cd91f3    call    0f391h
0078 cb57      bit     2,a
007a 2804      jr      z,0080h          ; (+04h)
007c 7b        ld      a,e
007d 2f        cpl     
007e a2        and     d
007f 57        ld      d,a
0080 cb23      sla     e
0082 cb63      bit     4,e
0084 28e8      jr      z,006eh          ; (-18h)
0086 10da      djnz    0062h            ; (-26h)
0088 f609      or      09h
008a 3d        dec     a
008b 20f6      jr      nz,0083h         ; (-0ah)
008d 3100c1    ld      sp,0c100h
0090 00        nop     
0091 3e04      ld      a,04h
0093 cb1a      rr      d
0095 3802      jr      c,0099h          ; (+02h)
0097 cbf6      set     6,(hl)
0099 09        add     hl,bc
009a 3d        dec     a
009b 20f6      jr      nz,0093h         ; (-0ah)
009d 3100c1    ld      sp,0c100h
00a0 03        inc     bc
00a1 83        add     a,e
00a2 03        inc     bc
00a3 57        ld      d,a
00a4 013000    ld      bc,0030h
00a7 40        ld      b,b
00a8 03        inc     bc
00a9 80        add     a,b
00aa 1081      djnz    002dh            ; (-7fh)
00ac 07        rlca    
00ad 81        add     a,c
00ae 018203    ld      bc,0382h
00b1 83        add     a,e
00b2 03        inc     bc
00b3 57        ld      d,a
00b4 013000    ld      bc,0030h
00b7 40        ld      b,b
00b8 d0        ret     nc

00b9 c31bf0    jp      0f01bh
00bc c3def3    jp      0f3deh
00bf c335f6    jp      0f635h
00c2 c340f6    jp      0f640h
00c5 c350f6    jp      0f650h
00c8 c322f0    jp      0f022h
00cb c3dcf4    jp      0f4dch
00ce c3ebf4    jp      0f4ebh
00d1 c315f6    jp      0f615h
00d4 f3        di      
00d5 af        xor     a
00d6 d352      out     (52h),a
00d8 c30000    jp      0000h
00db cdcbf3    call    0f3cbh
00de dd7e00    ld      a,(ix+00h)
00e1 b7        or      a
00e2 284d      jr      z,0131h          ; (+4dh)
00e4 0688      ld      b,88h
00e6 3d        dec     a
00e7 287b      jr      z,0164h          ; (+7bh)
00e9 06a8      ld      b,0a8h
00eb 3d        dec     a
00ec 2876      jr      z,0164h          ; (+76h)
00ee 3d        dec     a
00ef 285f      jr      z,0150h          ; (+5fh)
00f1 dd3608ff  ld      (ix+08h),0ffh
00f5 f3        di      
00f6 3ea7      ld      a,0a7h
00f8 d383      out     (83h),a
00fa af        xor     a
00fb d383      out     (83h),a
00fd 3d        dec     a
00fe 32c9ff    ld      (0ffc9h),a
0101 2150f0    ld      hl,0f050h
0104 2216ff    ld      (0ff16h),hl
0107 fb        ei      
0108 c9        ret     

0109 f5        push    af
010a 3ac9ff    ld      a,(0ffc9h)
010d 3d        dec     a
010e 32c9ff    ld      (0ffc9h),a
0111 200a      jr      nz,011dh         ; (+0ah)
0113 cd68f0    call    0f068h
0116 3e21      ld      a,21h
0118 d383      out     (83h),a
011a 322eff    ld      (0ff2eh),a
011d f1        pop     af
011e fb        ei      
011f ed4d      reti    

0121 db41      in      a,(41h)
0123 d343      out     (43h),a
0125 3e10      ld      a,10h
0127 d340      out     (40h),a
0129 3a2fff    ld      a,(0ff2fh)
012c e6f0      and     0f0h
012e d330      out     (30h),a
0130 c9        ret     

0131 cd1af1    call    0f11ah
0134 cb7f      bit     7,a
0136 2805      jr      z,013dh          ; (+05h)
0138 2130ff    ld      hl,0ff30h
013b 3600      ld      (hl),00h
013d dd7708    ld      (ix+08h),a
0140 3a2fff    ld      a,(0ff2fh)
0143 dd7706    ld      (ix+06h),a
0146 3a30ff    ld      a,(0ff30h)
0149 dd7707    ld      (ix+07h),a
014c cd3cf0    call    0f03ch
014f c9        ret     

0150 dd360606  ld      (ix+06h),06h
0154 dd360700  ld      (ix+07h),00h
0158 06c0      ld      b,0c0h
015a cdb3f0    call    0f0b3h
015d 3a2fff    ld      a,(0ff2fh)
0160 dd7706    ld      (ix+06h),a
0163 c9        ret     

0164 ddcb017e  bit     7,(ix+01h)
0168 2802      jr      z,016ch          ; (+02h)
016a cbc8      set     1,b
016c 78        ld      a,b
016d 32c5ff    ld      (0ffc5h),a
0170 cd1af1    call    0f11ah
0173 cb7f      bit     7,a
0175 2052      jr      nz,01c9h         ; (+52h)
0177 3a2dff    ld      a,(0ff2dh)
017a feff      cp      0ffh
017c 2805      jr      z,0183h          ; (+05h)
017e ddbe02    cp      (ix+02h)
0181 2805      jr      z,0188h          ; (+05h)
0183 cdf8f1    call    0f1f8h
0186 2041      jr      nz,01c9h         ; (+41h)
0188 3a12ff    ld      a,(0ff12h)
018b 3c        inc     a
018c 20fa      jr      nz,0188h         ; (-06h)
018e f3        di      
018f 3e03      ld      a,03h
0191 d380      out     (80h),a
0193 3e27      ld      a,27h
0195 d382      out     (82h),a
0197 3e3d      ld      a,3dh
0199 d382      out     (82h),a
019b 21a8f3    ld      hl,0f3a8h
019e 2216ff    ld      (0ff16h),hl
01a1 3a33ff    ld      a,(0ff33h)
01a4 32c6ff    ld      (0ffc6h),a
01a7 dd7e03    ld      a,(ix+03h)
01aa d342      out     (42h),a
01ac dd7e02    ld      a,(ix+02h)
01af d341      out     (41h),a
01b1 3ac5ff    ld      a,(0ffc5h)
01b4 d340      out     (40h),a
01b6 cdb5f2    call    0f2b5h
01b9 280e      jr      z,01c9h          ; (+0eh)
01bb f5        push    af
01bc cd0ef3    call    0f30eh
01bf c1        pop     bc
01c0 2006      jr      nz,01c8h         ; (+06h)
01c2 21c6ff    ld      hl,0ffc6h
01c5 35        dec     (hl)
01c6 20df      jr      nz,01a7h         ; (-21h)
01c8 78        ld      a,b
01c9 dd7708    ld      (ix+08h),a
01cc cd18f0    call    0f018h
01cf cd3cf0    call    0f03ch
01d2 c9        ret     

01d3 dd7e01    ld      a,(ix+01h)
01d6 cbbf      res     7,a
01d8 fe04      cp      04h
01da 306b      jr      nc,0247h         ; (+6bh)
01dc 0600      ld      b,00h
01de 4f        ld      c,a
01df 212cff    ld      hl,0ff2ch
01e2 96        sub     (hl)
01e3 f5        push    af
01e4 50        ld      d,b
01e5 5e        ld      e,(hl)
01e6 71        ld      (hl),c
01e7 2120ff    ld      hl,0ff20h
01ea 19        add     hl,de
01eb 3a2dff    ld      a,(0ff2dh)
01ee 77        ld      (hl),a
01ef 1e04      ld      e,04h
01f1 19        add     hl,de
01f2 3a2fff    ld      a,(0ff2fh)
01f5 77        ld      (hl),a
01f6 2120ff    ld      hl,0ff20h
01f9 09        add     hl,bc
01fa 7e        ld      a,(hl)
01fb 322dff    ld      (0ff2dh),a
01fe 19        add     hl,de
01ff d1        pop     de
0200 7e        ld      a,(hl)
0201 b7        or      a
0202 201f      jr      nz,0223h         ; (+1fh)
0204 2198f1    ld      hl,0f198h
0207 09        add     hl,bc
0208 7e        ld      a,(hl)
0209 d330      out     (30h),a
020b f5        push    af
020c cd9cf1    call    0f19ch
020f c1        pop     bc
0210 fede      cp      0deh
0212 3033      jr      nc,0247h         ; (+33h)
0214 cbf0      set     6,b
0216 feb5      cp      0b5h
0218 3006      jr      nc,0220h         ; (+06h)
021a cbb0      res     6,b
021c fe99      cp      99h
021e 3827      jr      c,0247h          ; (+27h)
0220 78        ld      a,b
0221 1600      ld      d,00h
0223 cbaf      res     5,a
0225 ddcb017e  bit     7,(ix+01h)
0229 2802      jr      z,022dh          ; (+02h)
022b cbef      set     5,a
022d d330      out     (30h),a
022f 322fff    ld      (0ff2fh),a
0232 14        inc     d
0233 15        dec     d
0234 c499f3    call    nz,0f399h
0237 cd91f3    call    0f391h
023a cb6f      bit     5,a
023c c0        ret     nz

023d cd9cf1    call    0f19ch
0240 b7        or      a
0241 2804      jr      z,0247h          ; (+04h)
0243 cd91f3    call    0f391h
0246 c9        ret     

0247 af        xor     a
0248 d330      out     (30h),a
024a 322fff    ld      (0ff2fh),a
024d 3e80      ld      a,80h
024f b7        or      a
0250 c9        ret     

0251 010204    ld      bc,0402h
0254 08        ex      af,af'
0255 af        xor     a
0256 d356      out     (56h),a
0258 3c        inc     a
0259 d354      out     (54h),a
025b db41      in      a,(41h)
025d d343      out     (43h),a
025f 3e18      ld      a,18h
0261 d340      out     (40h),a
0263 cdbaf3    call    0f3bah
0266 cd91f3    call    0f391h
0269 4f        ld      c,a
026a 0606      ld      b,06h
026c 210000    ld      hl,0000h
026f 22c7ff    ld      (0ffc7h),hl
0272 ed5bc7ff  ld      de,(0ffc7h)
0276 cde3f1    call    0f1e3h
0279 380d      jr      c,0288h          ; (+0dh)
027b cde3f1    call    0f1e3h
027e 3808      jr      c,0288h          ; (+08h)
0280 10f0      djnz    0272h            ; (-10h)
0282 2ac7ff    ld      hl,(0ffc7h)
0285 b7        or      a
0286 ed52      sbc     hl,de
0288 cdcbf3    call    0f3cbh
028b af        xor     a
028c d354      out     (54h),a
028e 3c        inc     a
028f d356      out     (56h),a
0291 7d        ld      a,l
0292 24        inc     h
0293 25        dec     h
0294 2802      jr      z,0298h          ; (+02h)
0296 3eff      ld      a,0ffh
0298 3230ff    ld      (0ff30h),a
029b c9        ret     

029c cd91f3    call    0f391h
029f a9        xor     c
02a0 e602      and     02h
02a2 2009      jr      nz,02adh         ; (+09h)
02a4 3ac8ff    ld      a,(0ffc8h)
02a7 fe08      cp      08h
02a9 38f1      jr      c,029ch          ; (-0fh)
02ab 37        scf     
02ac c9        ret     

02ad 79        ld      a,c
02ae 2f        cpl     
02af 4f        ld      c,a
02b0 c9        ret     

02b1 3a2dff    ld      a,(0ff2dh)
02b4 feff      cp      0ffh
02b6 2005      jr      nz,02bdh         ; (+05h)
02b8 cd37f2    call    0f237h
02bb 202a      jr      nz,02e7h         ; (+2ah)
02bd 0601      ld      b,01h
02bf cd57f2    call    0f257h
02c2 c8        ret     z

02c3 3005      jr      nc,02cah         ; (+05h)
02c5 cd37f2    call    0f237h
02c8 201d      jr      nz,02e7h         ; (+1dh)
02ca 0602      ld      b,02h
02cc cd57f2    call    0f257h
02cf c8        ret     z

02d0 3815      jr      c,02e7h          ; (+15h)
02d2 216400    ld      hl,0064h
02d5 cd9ef3    call    0f39eh
02d8 2128ff    ld      hl,0ff28h
02db 3a2cff    ld      a,(0ff2ch)
02de 85        add     a,l
02df 6f        ld      l,a
02e0 34        inc     (hl)
02e1 7e        ld      a,(hl)
02e2 e603      and     03h
02e4 20e4      jr      nz,02cah         ; (-1ch)
02e6 35        dec     (hl)
02e7 3eff      ld      a,0ffh
02e9 322dff    ld      (0ff2dh),a
02ec 3e10      ld      a,10h
02ee b7        or      a
02ef c9        ret     

02f0 3a2fff    ld      a,(0ff2fh)
02f3 cbe7      set     4,a
02f5 d330      out     (30h),a
02f7 060f      ld      b,0fh
02f9 10fe      djnz    02f9h            ; (-02h)
02fb cba7      res     4,a
02fd d330      out     (30h),a
02ff 0600      ld      b,00h
0301 10fe      djnz    0301h            ; (-02h)
0303 cd91f3    call    0f391h
0306 3e0b      ld      a,0bh
0308 cd6bf3    call    0f36bh
030b ee04      xor     04h
030d e684      and     84h
030f c9        ret     

0310 c5        push    bc
0311 3a2dff    ld      a,(0ff2dh)
0314 47        ld      b,a
0315 dd4e02    ld      c,(ix+02h)
0318 cd75f2    call    0f275h
031b cd95f2    call    0f295h
031e c1        pop     bc
031f 37        scf     
0320 c0        ret     nz

0321 db42      in      a,(42h)
0323 322dff    ld      (0ff2dh),a
0326 dd9602    sub     (ix+02h)
0329 c8        ret     z

032a 10e4      djnz    0310h            ; (-1ch)
032c b7        or      a
032d c9        ret     

032e 78        ld      a,b
032f d341      out     (41h),a
0331 79        ld      a,c
0332 d343      out     (43h),a
0334 2128ff    ld      hl,0ff28h
0337 3a2cff    ld      a,(0ff2ch)
033a 85        add     a,l
033b 6f        ld      l,a
033c 7e        ld      a,(hl)
033d e603      and     03h
033f f618      or      18h
0341 cd6bf3    call    0f36bh
0344 7e        ld      a,(hl)
0345 e6fc      and     0fch
0347 2600      ld      h,00h
0349 6f        ld      l,a
034a cd9ef3    call    0f39eh
034d c9        ret     

034e 3ec0      ld      a,0c0h
0350 cd62f3    call    0f362h
0353 e698      and     98h
0355 c8        ret     z

0356 3a2fff    ld      a,(0ff2fh)
0359 ee80      xor     80h
035b 322fff    ld      (0ff2fh),a
035e d330      out     (30h),a
0360 213200    ld      hl,0032h
0363 cd9ef3    call    0f39eh
0366 3ec0      ld      a,0c0h
0368 cd62f3    call    0f362h
036b e698      and     98h
036d c9        ret     

036e 2a6600    ld      hl,(0066h)
0371 e5        push    hl
0372 2a6800    ld      hl,(0068h)
0375 e5        push    hl
0376 21eda2    ld      hl,0a2edh
0379 cb6f      bit     5,a
037b 2801      jr      z,037eh          ; (+01h)
037d 24        inc     h
037e 226600    ld      (0066h),hl
0381 216800    ld      hl,0068h
0384 36c9      ld      (hl),0c9h
0386 f3        di      
0387 3ec7      ld      a,0c7h
0389 d383      out     (83h),a
038b af        xor     a
038c d383      out     (83h),a
038e fb        ei      
038f dd6e04    ld      l,(ix+04h)
0392 dd6605    ld      h,(ix+05h)
0395 dd4606    ld      b,(ix+06h)
0398 0e43      ld      c,43h
039a dd7e07    ld      a,(ix+07h)
039d cb3f      srl     a
039f 280d      jr      z,03aeh          ; (+0dh)
03a1 cb3f      srl     a
03a3 2806      jr      z,03abh          ; (+06h)
03a5 76        halt    
03a6 20fd      jr      nz,03a5h         ; (-03h)
03a8 76        halt    
03a9 20fd      jr      nz,03a8h         ; (-03h)
03ab 76        halt    
03ac 20fd      jr      nz,03abh         ; (-03h)
03ae 76        halt    
03af 20fd      jr      nz,03aeh         ; (-03h)
03b1 db40      in      a,(40h)
03b3 cb47      bit     0,a
03b5 20fa      jr      nz,03b1h         ; (-06h)
03b7 47        ld      b,a
03b8 cdcbf3    call    0f3cbh
03bb 78        ld      a,b
03bc e1        pop     hl
03bd 226800    ld      (0068h),hl
03c0 e1        pop     hl
03c1 226600    ld      (0066h),hl
03c4 e6fd      and     0fdh
03c6 c9        ret     

03c7 47        ld      b,a
03c8 e6e7      and     0e7h
03ca 2808      jr      z,03d4h          ; (+08h)
03cc f5        push    af
03cd cd91f3    call    0f391h
03d0 f1        pop     af
03d1 e6e1      and     0e1h
03d3 c9        ret     

03d4 cb60      bit     4,b
03d6 2023      jr      nz,03fbh         ; (+23h)
03d8 3a33ff    ld      a,(0ff33h)
03db 21c6ff    ld      hl,0ffc6h
03de 96        sub     (hl)
03df c8        ret     z

03e0 3a2dff    ld      a,(0ff2dh)
03e3 47        ld      b,a
03e4 b7        or      a
03e5 2004      jr      nz,03ebh         ; (+04h)
03e7 0e01      ld      c,01h
03e9 1802      jr      03edh            ; (+02h)
03eb 3d        dec     a
03ec 4f        ld      c,a
03ed c5        push    bc
03ee cd75f2    call    0f275h
03f1 d1        pop     de
03f2 43        ld      b,e
03f3 4a        ld      c,d
03f4 cd75f2    call    0f275h
03f7 cd95f2    call    0f295h
03fa c9        ret     

03fb cd95f2    call    0f295h
03fe 2012      jr      nz,0412h         ; (+12h)
0400 db42      in      a,(42h)
0402 ddbe02    cp      (ix+02h)
0405 200d      jr      nz,0414h         ; (+0dh)
0407 3a33ff    ld      a,(0ff33h)
040a 21c6ff    ld      hl,0ffc6h
040d 96        sub     (hl)
040e c8        ret     z

040f 3e10      ld      a,10h
0411 c9        ret     

0412 3eff      ld      a,0ffh
0414 322dff    ld      (0ff2dh),a
0417 cdf8f1    call    0f1f8h
041a c9        ret     

041b cd89f3    call    0f389h
041e c5        push    bc
041f 016a18    ld      bc,186ah
0422 1807      jr      042bh            ; (+07h)
0424 cd89f3    call    0f389h
0427 c5        push    bc
0428 017c92    ld      bc,927ch
042b db40      in      a,(40h)
042d cb47      bit     0,a
042f 280a      jr      z,043bh          ; (+0ah)
0431 cd8bf3    call    0f38bh
0434 0b        dec     bc
0435 78        ld      a,b
0436 b1        or      c
0437 20f2      jr      nz,042bh         ; (-0eh)
0439 3e10      ld      a,10h
043b 47        ld      b,a
043c cd91f3    call    0f391h
043f 78        ld      a,b
0440 c1        pop     bc
0441 c9        ret     

0442 d340      out     (40h),a
0444 3e0e      ld      a,0eh
0446 3d        dec     a
0447 20fd      jr      nz,0446h         ; (-03h)
0449 c9        ret     

044a 3ed0      ld      a,0d0h
044c cd89f3    call    0f389h
044f db40      in      a,(40h)
0451 c9        ret     

0452 2a32ff    ld      hl,(0ff32h)
0455 2600      ld      h,00h
0457 af        xor     a
0458 3d        dec     a
0459 20fd      jr      nz,0458h         ; (-03h)
045b 2b        dec     hl
045c 7c        ld      a,h
045d b5        or      l
045e 20f7      jr      nz,0457h         ; (-09h)
0460 c9        ret     

0461 3ed0      ld      a,0d0h
0463 d340      out     (40h),a
0465 3e01      ld      a,01h
0467 d383      out     (83h),a
0469 2103f3    ld      hl,0f303h
046c e3        ex      (sp),hl
046d 3e10      ld      a,10h
046f b7        or      a
0470 fb        ei      
0471 ed4d      reti    

0473 f3        di      
0474 3e87      ld      a,87h
0476 d383      out     (83h),a
0478 3efa      ld      a,0fah
047a d383      out     (83h),a
047c 21d2f3    ld      hl,0f3d2h
047f 2216ff    ld      (0ff16h),hl
0482 fb        ei      
0483 c9        ret     

0484 f3        di      
0485 3e01      ld      a,01h
0487 d383      out     (83h),a
0489 fb        ei      
048a c9        ret     

048b e5        push    hl
048c fb        ei      
048d 2ac7ff    ld      hl,(0ffc7h)
0490 23        inc     hl
0491 22c7ff    ld      (0ffc7h),hl
0494 e1        pop     hl
0495 ed4d      reti    

0497 3e01      ld      a,01h
0499 d352      out     (52h),a
049b cdfcf5    call    0f5fch
049e cdc9f4    call    0f4c9h
04a1 0d        dec     c
04a2 0a        ld      a,(bc)
04a3 53        ld      d,e
04a4 41        ld      b,c
04a5 4c        ld      c,h
04a6 4c        ld      c,h
04a7 59        ld      e,c
04a8 310021    ld      sp,2100h
04ab f1        pop     af
04ac f3        di      
04ad e5        push    hl
04ae cdc9f4    call    0f4c9h
04b1 0d        dec     c
04b2 0a        ld      a,(bc)
04b3 23        inc     hl
04b4 2000      jr      nz,04b6h         ; (+00h)
04b6 cdb2f4    call    0f4b2h
04b9 fe20      cp      20h
04bb d8        ret     c

04bc 4f        ld      c,a
04bd af        xor     a
04be 67        ld      h,a
04bf 6f        ld      l,a
04c0 29        add     hl,hl
04c1 29        add     hl,hl
04c2 29        add     hl,hl
04c3 29        add     hl,hl
04c4 b5        or      l
04c5 6f        ld      l,a
04c6 cdb2f4    call    0f4b2h
04c9 fe0d      cp      0dh
04cb 280c      jr      z,04d9h          ; (+0ch)
04cd cd83f4    call    0f483h
04d0 30ee      jr      nc,04c0h         ; (-12h)
04d2 cdc9f4    call    0f4c9h
04d5 203f      jr      nz,0516h         ; (+3fh)
04d7 00        nop     
04d8 c9        ret     

04d9 cdd5f4    call    0f4d5h
04dc 79        ld      a,c
04dd fe47      cp      47h
04df 2836      jr      z,0517h          ; (+36h)
04e1 fe42      cp      42h
04e3 2833      jr      z,0518h          ; (+33h)
04e5 fe4d      cp      4dh
04e7 20e9      jr      nz,04d2h         ; (-17h)
04e9 cd93f4    call    0f493h
04ec 7e        ld      a,(hl)
04ed cd98f4    call    0f498h
04f0 cdb2f4    call    0f4b2h
04f3 fe0d      cp      0dh
04f5 2818      jr      z,050fh          ; (+18h)
04f7 fe2d      cp      2dh
04f9 2816      jr      z,0511h          ; (+16h)
04fb cd83f4    call    0f483h
04fe 3f        ccf     
04ff d0        ret     nc

0500 07        rlca    
0501 07        rlca    
0502 07        rlca    
0503 07        rlca    
0504 4f        ld      c,a
0505 cdb2f4    call    0f4b2h
0508 cd83f4    call    0f483h
050b 3f        ccf     
050c d0        ret     nc

050d b1        or      c
050e 77        ld      (hl),a
050f 23        inc     hl
0510 23        inc     hl
0511 2b        dec     hl
0512 cdd5f4    call    0f4d5h
0515 18d2      jr      04e9h            ; (-2eh)
0517 e9        jp      (hl)
0518 dd217af4  ld      ix,0f47ah
051c cd22f0    call    0f022h
051f dd7e08    ld      a,(ix+08h)
0522 b7        or      a
0523 cc8000    call    z,0080h
0526 f5        push    af
0527 cdc9f4    call    0f4c9h
052a 2045      jr      nz,0571h         ; (+45h)
052c 52        ld      d,d
052d 52        ld      d,d
052e 2000      jr      nz,0530h         ; (+00h)
0530 f1        pop     af
0531 1825      jr      0558h            ; (+25h)
0533 010000    ld      bc,0000h
0536 018000    ld      bc,0080h
0539 80        add     a,b
053a 00        nop     
053b 00        nop     
053c d630      sub     30h
053e d8        ret     c

053f fe0a      cp      0ah
0541 3f        ccf     
0542 d0        ret     nc

0543 d607      sub     07h
0545 fe0a      cp      0ah
0547 d8        ret     c

0548 fe10      cp      10h
054a 3f        ccf     
054b c9        ret     

054c 7c        ld      a,h
054d cd9ff4    call    0f49fh
0550 7d        ld      a,l
0551 cd9ff4    call    0f49fh
0554 3e20      ld      a,20h
0556 181f      jr      0577h            ; (+1fh)
0558 f5        push    af
0559 1f        rra     
055a 1f        rra     
055b 1f        rra     
055c 1f        rra     
055d cda8f4    call    0f4a8h
0560 f1        pop     af
0561 e60f      and     0fh
0563 c690      add     a,90h
0565 27        daa     
0566 ce40      adc     a,40h
0568 27        daa     
0569 180c      jr      0577h            ; (+0ch)
056b e5        push    hl
056c c5        push    bc
056d cd09f0    call    0f009h
0570 c1        pop     bc
0571 e1        pop     hl
0572 cbbf      res     7,a
0574 fe20      cp      20h
0576 d8        ret     c

0577 e5        push    hl
0578 c5        push    bc
0579 f5        push    af
057a 4f        ld      c,a
057b cd0cf0    call    0f00ch
057e f1        pop     af
057f c1        pop     bc
0580 e1        pop     hl
0581 c9        ret     

0582 e3        ex      (sp),hl
0583 7e        ld      a,(hl)
0584 cdbef4    call    0f4beh
0587 7e        ld      a,(hl)
0588 23        inc     hl
0589 b7        or      a
058a 20f7      jr      nz,0583h         ; (-09h)
058c e3        ex      (sp),hl
058d c9        ret     

058e cdc9f4    call    0f4c9h
0591 0d        dec     c
0592 0a        ld      a,(bc)
0593 00        nop     
0594 c9        ret     

0595 79        ld      a,c
0596 d320      out     (20h),a
0598 e3        ex      (sp),hl
0599 e3        ex      (sp),hl
059a 3e19      ld      a,19h
059c d353      out     (53h),a
059e 3d        dec     a
059f 20fd      jr      nz,059eh         ; (-03h)
05a1 d353      out     (53h),a
05a3 c9        ret     

05a4 2a47ff    ld      hl,(0ff47h)
05a7 db20      in      a,(20h)
05a9 a5        and     l
05aa ac        xor     h
05ab c9        ret     

05ac 95        sub     l
05ad 00        nop     
05ae 00        nop     
05af 00        nop     
05b0 00        nop     
05b1 00        nop     
05b2 00        nop     
05b3 00        nop     
05b4 00        nop     
05b5 00        nop     
05b6 00        nop     
05b7 00        nop     
05b8 00        nop     
05b9 f5        push    af
05ba 3e87      ld      a,87h
05bc d380      out     (80h),a
05be 3e1a      ld      a,1ah
05c0 d380      out     (80h),a
05c2 3e17      ld      a,17h
05c4 3210ff    ld      (0ff10h),a
05c7 3e7f      ld      a,7fh
05c9 321cf5    ld      (0f51ch),a
05cc f1        pop     af
05cd fb        ei      
05ce ed4d      reti    

05d0 f5        push    af
05d1 db70      in      a,(70h)
05d3 17        rla     
05d4 3e00      ld      a,00h
05d6 1f        rra     
05d7 38f0      jr      c,05c9h          ; (-10h)
05d9 3200ff    ld      (0ff00h),a
05dc 3e2c      ld      a,2ch
05de 3210ff    ld      (0ff10h),a
05e1 f1        pop     af
05e2 fb        ei      
05e3 ed4d      reti    

05e5 f5        push    af
05e6 3ec7      ld      a,0c7h
05e8 d380      out     (80h),a
05ea 3e01      ld      a,01h
05ec d380      out     (80h),a
05ee 3a21f5    ld      a,(0f521h)
05f1 3c        inc     a
05f2 e60f      and     0fh
05f4 3221f5    ld      (0f521h),a
05f7 3e00      ld      a,00h
05f9 3210ff    ld      (0ff10h),a
05fc f1        pop     af
05fd fb        ei      
05fe ed4d      reti    

0600 f5        push    af
0601 af        xor     a
0602 d350      out     (50h),a
0604 3e54      ld      a,54h
0606 3212ff    ld      (0ff12h),a
0609 f1        pop     af
060a fb        ei      
060b ed4d      reti    

060d f5        push    af
060e 3e00      ld      a,00h
0610 d350      out     (50h),a
0612 1f        rra     
0613 3268f5    ld      (0f568h),a
0616 3e66      ld      a,66h
0618 3212ff    ld      (0ff12h),a
061b f1        pop     af
061c fb        ei      
061d ed4d      reti    

061f f5        push    af
0620 3e00      ld      a,00h
0622 d350      out     (50h),a
0624 1f        rra     
0625 327af5    ld      (0f57ah),a
0628 3e78      ld      a,78h
062a 3212ff    ld      (0ff12h),a
062d f1        pop     af
062e fb        ei      
062f ed4d      reti    

0631 f5        push    af
0632 3e00      ld      a,00h
0634 d350      out     (50h),a
0636 1f        rra     
0637 328cf5    ld      (0f58ch),a
063a 3e8a      ld      a,8ah
063c 3212ff    ld      (0ff12h),a
063f f1        pop     af
0640 fb        ei      
0641 ed4d      reti    

0643 f5        push    af
0644 3e00      ld      a,00h
0646 d350      out     (50h),a
0648 1f        rra     
0649 329ef5    ld      (0f59eh),a
064c 3e9c      ld      a,9ch
064e 3212ff    ld      (0ff12h),a
0651 f1        pop     af
0652 fb        ei      
0653 ed4d      reti    

0655 f5        push    af
0656 3e00      ld      a,00h
0658 d350      out     (50h),a
065a 1f        rra     
065b 32b0f5    ld      (0f5b0h),a
065e 3eae      ld      a,0aeh
0660 3212ff    ld      (0ff12h),a
0663 f1        pop     af
0664 fb        ei      
0665 ed4d      reti    

0667 f5        push    af
0668 3e00      ld      a,00h
066a d350      out     (50h),a
066c 1f        rra     
066d 32c2f5    ld      (0f5c2h),a
0670 3ec0      ld      a,0c0h
0672 3212ff    ld      (0ff12h),a
0675 f1        pop     af
0676 fb        ei      
0677 ed4d      reti    

0679 f5        push    af
067a 3e00      ld      a,00h
067c d350      out     (50h),a
067e 1f        rra     
067f 32d4f5    ld      (0f5d4h),a
0682 3ed2      ld      a,0d2h
0684 3212ff    ld      (0ff12h),a
0687 f1        pop     af
0688 fb        ei      
0689 ed4d      reti    

068b f5        push    af
068c 3e00      ld      a,00h
068e d350      out     (50h),a
0690 3ee0      ld      a,0e0h
0692 3212ff    ld      (0ff12h),a
0695 f1        pop     af
0696 fb        ei      
0697 ed4d      reti    

0699 f5        push    af
069a 3e01      ld      a,01h
069c d350      out     (50h),a
069e 3eee      ld      a,0eeh
06a0 3212ff    ld      (0ff12h),a
06a3 f1        pop     af
06a4 fb        ei      
06a5 ed4d      reti    

06a7 f5        push    af
06a8 3e01      ld      a,01h
06aa d381      out     (81h),a
06ac 3eff      ld      a,0ffh
06ae 3212ff    ld      (0ff12h),a
06b1 f1        pop     af
06b2 fb        ei      
06b3 ed4d      reti    

06b5 f3        di      
06b6 21eef5    ld      hl,0f5eeh
06b9 2212ff    ld      (0ff12h),hl
06bc 3e07      ld      a,07h
06be d381      out     (81h),a
06c0 3a06f5    ld      a,(0f506h)
06c3 d381      out     (81h),a
06c5 2100ff    ld      hl,0ff00h
06c8 2221f5    ld      (0f521h),hl
06cb 2233f6    ld      (0f633h),hl
06ce f3        di      
06cf 3e01      ld      a,01h
06d1 d357      out     (57h),a
06d3 067e      ld      b,7eh
06d5 db70      in      a,(70h)
06d7 17        rla     
06d8 30f9      jr      nc,06d3h         ; (-07h)
06da 10f9      djnz    06d5h            ; (-07h)
06dc 3ec7      ld      a,0c7h
06de d380      out     (80h),a
06e0 3e01      ld      a,01h
06e2 d380      out     (80h),a
06e4 2100f5    ld      hl,0f500h
06e7 2210ff    ld      (0ff10h),hl
06ea fb        ei      
06eb c9        ret     

06ec 00        nop     
06ed ff        rst     38h
06ee 2133f6    ld      hl,0f633h
06f1 3a21f5    ld      a,(0f521h)
06f4 96        sub     (hl)
06f5 c8        ret     z

06f6 3eff      ld      a,0ffh
06f8 c9        ret     

06f9 cd35f6    call    0f635h
06fc 28fb      jr      z,06f9h          ; (-05h)
06fe 2a33f6    ld      hl,(0f633h)
0701 7e        ld      a,(hl)
0702 2c        inc     l
0703 cba5      res     4,l
0705 2233f6    ld      (0f633h),hl
0708 c9        ret     

0709 3a12ff    ld      a,(0ff12h)
070c feee      cp      0eeh
070e 38f9      jr      c,0709h          ; (-07h)
0710 79        ld      a,c
0711 e67f      and     7fh
0713 e25ff6    jp      po,0f65fh
0716 f680      or      80h
0718 3256f5    ld      (0f556h),a
071b 3e47      ld      a,47h
071d 3212ff    ld      (0ff12h),a
0720 3e81      ld      a,81h
0722 d381      out     (81h),a
0724 c9        ret     

0725 e5        push    hl
0726 d5        push    de
0727 2101c3    ld      hl,0c301h
072a 73        ld      (hl),e
072b 1600      ld      d,00h
072d cd84f6    call    0f684h
0730 d1        pop     de
0731 e1        pop     hl
0732 1e00      ld      e,00h
0734 cd84f6    call    0f684h
0737 2101c3    ld      hl,0c301h
073a 73        ld      (hl),e
073b 1600      ld      d,00h
073d f3        di      
073e 0119f7    ld      bc,0f719h
0741 ed4312ff  ld      (0ff12h),bc
0745 0608      ld      b,08h
0747 3e87      ld      a,87h
0749 d381      out     (81h),a
074b 3e0d      ld      a,0dh
074d d381      out     (81h),a
074f fb        ei      
0750 18fe      jr      0750h            ; (-02h)
0752 08        ex      af,af'
0753 d9        exx     
0754 3eff      ld      a,0ffh
0756 3255ff    ld      (0ff55h),a
0759 d357      out     (57h),a
075b 21fbc2    ld      hl,0c2fbh
075e cdd9f6    call    0f6d9h
0761 300a      jr      nc,076dh         ; (+0ah)
0763 2b        dec     hl
0764 7e        ld      a,(hl)
0765 b9        cp      c
0766 2005      jr      nz,076dh         ; (+05h)
0768 3e01      ld      a,01h
076a 3255ff    ld      (0ff55h),a
076d 08        ex      af,af'
076e d9        exx     
076f fb        ei      
0770 ed4d      reti    

0772 f3        di      
0773 2100c1    ld      hl,0c100h
0776 cdd9f6    call    0f6d9h
0779 fb        ei      
077a 380d      jr      c,0789h          ; (+0dh)
077c 2b        dec     hl
077d 7e        ld      a,(hl)
077e b9        cp      c
077f 2008      jr      nz,0789h         ; (+08h)
0781 1100c1    ld      de,0c100h
0784 b7        or      a
0785 ed52      sbc     hl,de
0787 af        xor     a
0788 c9        ret     

0789 3e4e      ld      a,4eh
078b cd56fc    call    0fc56h
078e 3eff      ld      a,0ffh
0790 b7        or      a
0791 c9        ret     

0792 11aa0a    ld      de,0aaah
0795 010000    ld      bc,0000h
0798 1823      jr      07bdh            ; (+23h)
079a 79        ld      a,c
079b 80        add     a,b
079c ce00      adc     a,00h
079e 4f        ld      c,a
079f e3        ex      (sp),hl
07a0 e3        ex      (sp),hl
07a1 e3        ex      (sp),hl
07a2 e3        ex      (sp),hl
07a3 0608      ld      b,08h
07a5 3e0b      ld      a,0bh
07a7 3e0b      ld      a,0bh
07a9 00        nop     
07aa 3d        dec     a
07ab c2f1f6    jp      nz,0f6f1h
07ae db70      in      a,(70h)
07b0 17        rla     
07b1 cb1a      rr      d
07b3 10f0      djnz    07a5h            ; (-10h)
07b5 42        ld      b,d
07b6 72        ld      (hl),d
07b7 23        inc     hl
07b8 7c        ld      a,h
07b9 fec3      cp      0c3h
07bb 3f        ccf     
07bc d8        ret     c

07bd 3e47      ld      a,47h
07bf d380      out     (80h),a
07c1 af        xor     a
07c2 d380      out     (80h),a
07c4 11a101    ld      de,01a1h
07c7 db80      in      a,(80h)
07c9 b7        or      a
07ca 20ce      jr      nz,079ah         ; (-32h)
07cc 1b        dec     de
07cd 7a        ld      a,d
07ce b3        or      e
07cf 20f6      jr      nz,07c7h         ; (-0ah)
07d1 c9        ret     

07d2 af        xor     a
07d3 d350      out     (50h),a
07d5 fb        ei      
07d6 7e        ld      a,(hl)
07d7 23        inc     hl
07d8 aa        xor     d
07d9 4f        ld      c,a
07da 83        add     a,e
07db ce00      adc     a,00h
07dd 5f        ld      e,a
07de 3e2c      ld      a,2ch
07e0 3212ff    ld      (0ff12h),a
07e3 ed4d      reti    

07e5 79        ld      a,c
07e6 d350      out     (50h),a
07e8 fb        ei      
07e9 cb19      rr      c
07eb 1005      djnz    07f2h            ; (+05h)
07ed 3e3b      ld      a,3bh
07ef 3212ff    ld      (0ff12h),a
07f2 ed4d      reti    

07f4 3e01      ld      a,01h
07f6 d350      out     (50h),a
07f8 fb        ei      
07f9 7c        ld      a,h
07fa fec3      cp      0c3h
07fc 3009      jr      nc,0807h         ; (+09h)
07fe 0608      ld      b,08h
0800 3e19      ld      a,19h
0802 3212ff    ld      (0ff12h),a
0805 ed4d      reti    

0807 3e55      ld      a,55h
0809 3212ff    ld      (0ff12h),a
080c ed4d      reti    

080e 3e01      ld      a,01h
0810 d381      out     (81h),a
0812 fb        ei      
0813 3eff      ld      a,0ffh
0815 3212ff    ld      (0ff12h),a
0818 e1        pop     hl
0819 ed4d      reti    

081b 3e01      ld      a,01h
081d d352      out     (52h),a
081f 21fec2    ld      hl,0c2feh
0822 f3        di      
0823 cdd9f6    call    0f6d9h
0826 fb        ei      
0827 30f6      jr      nc,081fh         ; (-0ah)
0829 2afec2    ld      hl,(0c2feh)
082c 11e680    ld      de,80e6h
082f b7        or      a
0830 ed52      sbc     hl,de
0832 cadef3    jp      z,0f3deh
0835 3e03      ld      a,03h
0837 3233ff    ld      (0ff33h),a
083a 3e38      ld      a,38h
083c 3288f1    ld      (0f188h),a
083f db50      in      a,(50h)
0841 cb5f      bit     3,a
0843 2005      jr      nz,084ah         ; (+05h)
0845 3eff      ld      a,0ffh
0847 3223f8    ld      (0f823h),a
084a 21e1f7    ld      hl,0f7e1h
084d 2219f0    ld      (0f019h),hl
0850 ed5b1930  ld      de,(3019h)
0854 b7        or      a
0855 ed52      sbc     hl,de
0857 280c      jr      z,0865h          ; (+0ch)
0859 210000    ld      hl,0000h
085c 224bff    ld      (0ff4bh),hl
085f 21ffbf    ld      hl,0bfffh
0862 224dff    ld      (0ff4dh),hl
0865 cdd1f8    call    0f8d1h
0868 2a3aff    ld      hl,(0ff3ah)
086b cdbdf7    call    0f7bdh
086e 2a3cff    ld      hl,(0ff3ch)
0871 cdbdf7    call    0f7bdh
0874 18ef      jr      0865h            ; (-11h)
0876 e9        jp      (hl)
0877 db70      in      a,(70h)
0879 e68a      and     8ah
087b fe8a      cp      8ah
087d c0        ret     nz

087e f3        di      
087f af        xor     a
0880 3255ff    ld      (0ff55h),a
0883 d357      out     (57h),a
0885 3ed7      ld      a,0d7h
0887 d380      out     (80h),a
0889 3e01      ld      a,01h
088b d380      out     (80h),a
088d 2199f6    ld      hl,0f699h
0890 2210ff    ld      (0ff10h),hl
0893 fb        ei      
0894 21e2f7    ld      hl,0f7e2h
0897 223aff    ld      (0ff3ah),hl
089a c9        ret     

089b 3a55ff    ld      a,(0ff55h)
089e b7        or      a
089f c8        ret     z

08a0 fe01      cp      01h
08a2 2808      jr      z,08ach          ; (+08h)
08a4 f3        di      
08a5 3e03      ld      a,03h
08a7 d380      out     (80h),a
08a9 fb        ei      
08aa 1816      jr      08c2h            ; (+16h)
08ac 3afbc2    ld      a,(0c2fbh)
08af 2a38ff    ld      hl,(0ff38h)
08b2 cd10f8    call    0f810h
08b5 200b      jr      nz,08c2h         ; (+0bh)
08b7 3afcc2    ld      a,(0c2fch)
08ba cd10f8    call    0f810h
08bd 2003      jr      nz,08c2h         ; (+03h)
08bf cdbdf7    call    0f7bdh
08c2 21bef7    ld      hl,0f7beh
08c5 223aff    ld      (0ff3ah),hl
08c8 c9        ret     

08c9 4e        ld      c,(hl)
08ca 23        inc     hl
08cb 46        ld      b,(hl)
08cc 23        inc     hl
08cd edb1      cpir    
08cf c0        ret     nz

08d0 f5        push    af
08d1 09        add     hl,bc
08d2 09        add     hl,bc
08d3 09        add     hl,bc
08d4 7e        ld      a,(hl)
08d5 23        inc     hl
08d6 66        ld      h,(hl)
08d7 6f        ld      l,a
08d8 f1        pop     af
08d9 c9        ret     

08da 0600      ld      b,00h
08dc 40        ld      b,b
08dd 313233    ld      sp,3332h
08e0 34        inc     (hl)
08e1 5a        ld      e,d
08e2 54        ld      d,h
08e3 f8        ret     m

08e4 3d        dec     a
08e5 f8        ret     m

08e6 3d        dec     a
08e7 f8        ret     m

08e8 3d        dec     a
08e9 f8        ret     m

08ea 3d        dec     a
08eb f8        ret     m

08ec 35        dec     (hl)
08ed f8        ret     m

08ee 02        ld      (bc),a
08ef 00        nop     
08f0 53        ld      d,e
08f1 57        ld      d,a
08f2 78        ld      a,b
08f3 f8        ret     m

08f4 62        ld      h,d
08f5 f8        ret     m

08f6 07        rlca    
08f7 00        nop     
08f8 52        ld      d,d
08f9 53        ld      d,e
08fa 57        ld      d,a
08fb 50        ld      d,b
08fc 4e        ld      c,(hl)
08fd 4f        ld      c,a
08fe 2138fb    ld      hl,0fb38h
0901 05        dec     b
0902 fce7fb    call    m,0fbe7h
0905 05        dec     b
0906 f9        ld      sp,hl
0907 08        ex      af,af'
0908 f9        ld      sp,hl
0909 dbfa      in      a,(0fah)
090b 8c        adc     a,h
090c f9        ld      sp,hl
090d 04        inc     b
090e 00        nop     
090f 52        ld      d,d
0910 57        ld      d,a
0911 53        ld      d,e
0912 47        ld      b,a
0913 b4        or      h
0914 fca6fc    call    m,0fca6h
0917 7b        ld      a,e
0918 fc5ffc    call    m,0fc5fh
091b cd4afc    call    0fc4ah
091e 2143ff    ld      hl,0ff43h
0921 11fcc2    ld      de,0c2fch
0924 d5        push    de
0925 010400    ld      bc,0004h
0928 edb0      ldir    
092a e1        pop     hl
092b 114300    ld      de,0043h
092e c36cf6    jp      0f66ch
0931 cd4afc    call    0fc4ah
0934 cdb9f6    call    0f6b9h
0937 c0        ret     nz

0938 112800    ld      de,0028h
093b b7        or      a
093c ed52      sbc     hl,de
093e c0        ret     nz

093f cd4afc    call    0fc4ah
0942 2100c1    ld      hl,0c100h
0945 0628      ld      b,28h
0947 7e        ld      a,(hl)
0948 fe9b      cp      9bh
094a 2005      jr      nz,0951h         ; (+05h)
094c 213eff    ld      hl,0ff3eh
094f 46        ld      b,(hl)
0950 23        inc     hl
0951 e5        push    hl
0952 2a4fff    ld      hl,(0ff4fh)
0955 ed5b4dff  ld      de,(0ff4dh)
0959 b7        or      a
095a ed52      sbc     hl,de
095c e1        pop     hl
095d 380e      jr      c,096dh          ; (+0eh)
095f e5        push    hl
0960 c5        push    bc
0961 cdd1f8    call    0f8d1h
0964 c1        pop     bc
0965 e1        pop     hl
0966 db70      in      a,(70h)
0968 e602      and     02h
096a 20e5      jr      nz,0951h         ; (-1bh)
096c c9        ret     

096d 7e        ld      a,(hl)
096e 23        inc     hl
096f e5        push    hl
0970 c5        push    bc
0971 2a51ff    ld      hl,(0ff51h)
0974 cdf1f8    call    0f8f1h
0977 ed5351ff  ld      (0ff51h),de
097b 77        ld      (hl),a
097c 2a4fff    ld      hl,(0ff4fh)
097f 23        inc     hl
0980 224fff    ld      (0ff4fh),hl
0983 c1        pop     bc
0984 e1        pop     hl
0985 10c0      djnz    0947h            ; (-40h)
0987 c354fc    jp      0fc54h
098a 2a4fff    ld      hl,(0ff4fh)
098d 7c        ld      a,h
098e b5        or      l
098f c8        ret     z

0990 cd15f0    call    0f015h
0993 c0        ret     nz

0994 2a53ff    ld      hl,(0ff53h)
0997 cdf1f8    call    0f8f1h
099a ed5353ff  ld      (0ff53h),de
099e 4e        ld      c,(hl)
099f cd12f0    call    0f012h
09a2 2a4fff    ld      hl,(0ff4fh)
09a5 2b        dec     hl
09a6 224fff    ld      (0ff4fh),hl
09a9 c9        ret     

09aa eb        ex      de,hl
09ab 2a4bff    ld      hl,(0ff4bh)
09ae 19        add     hl,de
09af e5        push    hl
09b0 13        inc     de
09b1 2a4dff    ld      hl,(0ff4dh)
09b4 b7        or      a
09b5 ed52      sbc     hl,de
09b7 3003      jr      nc,09bch         ; (+03h)
09b9 110000    ld      de,0000h
09bc e1        pop     hl
09bd c9        ret     

09be af        xor     a
09bf 1802      jr      09c3h            ; (+02h)
09c1 3e01      ld      a,01h
09c3 32b5ff    ld      (0ffb5h),a
09c6 cd28fc    call    0fc28h
09c9 d8        ret     c

09ca cd4afc    call    0fc4ah
09cd cdb9f6    call    0f6b9h
09d0 c0        ret     nz

09d1 22a9ff    ld      (0ffa9h),hl
09d4 118000    ld      de,0080h
09d7 b7        or      a
09d8 ed52      sbc     hl,de
09da 2804      jr      z,09e0h          ; (+04h)
09dc b7        or      a
09dd ed52      sbc     hl,de
09df c0        ret     nz

09e0 cd4afc    call    0fc4ah
09e3 cd10fa    call    0fa10h
09e6 204e      jr      nz,0a36h         ; (+4eh)
09e8 2100c1    ld      hl,0c100h
09eb 229cff    ld      (0ff9ch),hl
09ee 3aa9ff    ld      a,(0ffa9h)
09f1 47        ld      b,a
09f2 7e        ld      a,(hl)
09f3 2f        cpl     
09f4 77        ld      (hl),a
09f5 23        inc     hl
09f6 10fa      djnz    09f2h            ; (-06h)
09f8 3e02      ld      a,02h
09fa 3298ff    ld      (0ff98h),a
09fd dd2198ff  ld      ix,0ff98h
0a01 cd0ff0    call    0f00fh
0a04 3aa0ff    ld      a,(0ffa0h)
0a07 b7        or      a
0a08 202c      jr      nz,0a36h         ; (+2ch)
0a0a 3ab5ff    ld      a,(0ffb5h)
0a0d b7        or      a
0a0e 2826      jr      z,0a36h          ; (+26h)
0a10 3e01      ld      a,01h
0a12 3298ff    ld      (0ff98h),a
0a15 2100c3    ld      hl,0c300h
0a18 229cff    ld      (0ff9ch),hl
0a1b cd0ff0    call    0f00fh
0a1e 3aa0ff    ld      a,(0ffa0h)
0a21 b7        or      a
0a22 2012      jr      nz,0a36h         ; (+12h)
0a24 2100c1    ld      hl,0c100h
0a27 1100c3    ld      de,0c300h
0a2a 3a9eff    ld      a,(0ff9eh)
0a2d 47        ld      b,a
0a2e 1a        ld      a,(de)
0a2f ae        xor     (hl)
0a30 200b      jr      nz,0a3dh         ; (+0bh)
0a32 23        inc     hl
0a33 13        inc     de
0a34 10f8      djnz    0a2eh            ; (-08h)
0a36 cde3f9    call    0f9e3h
0a39 7b        ld      a,e
0a3a c356fc    jp      0fc56h
0a3d af        xor     a
0a3e cd06fa    call    0fa06h
0a41 7b        ld      a,e
0a42 c356fc    jp      0fc56h
0a45 cd28fc    call    0fc28h
0a48 d8        ret     c

0a49 cd4afc    call    0fc4ah
0a4c cd10fa    call    0fa10h
0a4f f5        push    af
0a50 280f      jr      z,0a61h          ; (+0fh)
0a52 fd5606    ld      d,(iy+06h)
0a55 fd5e07    ld      e,(iy+07h)
0a58 7a        ld      a,d
0a59 b3        or      e
0a5a 2009      jr      nz,0a65h         ; (+09h)
0a5c 118000    ld      de,0080h
0a5f 1804      jr      0a65h            ; (+04h)
0a61 ed5b9eff  ld      de,(0ff9eh)
0a65 2afdc2    ld      hl,(0c2fdh)
0a68 010400    ld      bc,0004h
0a6b b7        or      a
0a6c ed42      sbc     hl,bc
0a6e 3003      jr      nc,0a73h         ; (+03h)
0a70 118000    ld      de,0080h
0a73 ed53a9ff  ld      (0ffa9h),de
0a77 2100c3    ld      hl,0c300h
0a7a b7        or      a
0a7b ed52      sbc     hl,de
0a7d f1        pop     af
0a7e 2014      jr      nz,0a94h         ; (+14h)
0a80 229cff    ld      (0ff9ch),hl
0a83 3e01      ld      a,01h
0a85 3298ff    ld      (0ff98h),a
0a88 dd2198ff  ld      ix,0ff98h
0a8c e5        push    hl
0a8d cd0ff0    call    0f00fh
0a90 e1        pop     hl
0a91 3aa0ff    ld      a,(0ffa0h)
0a94 cde3f9    call    0f9e3h
0a97 16ff      ld      d,0ffh
0a99 c36cf6    jp      0f66ch
0a9c b7        or      a
0a9d 200a      jr      nz,0aa9h         ; (+0ah)
0a9f fd770d    ld      (iy+0dh),a
0aa2 1e43      ld      e,43h
0aa4 fdcb0c96  res     2,(iy+0ch)
0aa8 c9        ret     

0aa9 cb77      bit     6,a
0aab 2802      jr      z,0aafh          ; (+02h)
0aad e69f      and     9fh
0aaf cb6f      bit     5,a
0ab1 2802      jr      z,0ab5h          ; (+02h)
0ab3 f660      or      60h
0ab5 4f        ld      c,a
0ab6 e681      and     81h
0ab8 79        ld      a,c
0ab9 2804      jr      z,0abfh          ; (+04h)
0abb e67e      and     7eh
0abd f610      or      10h
0abf fd770d    ld      (iy+0dh),a
0ac2 1e45      ld      e,45h
0ac4 fdcb0cd6  set     2,(iy+0ch)
0ac8 c9        ret     

0ac9 3a2eff    ld      a,(0ff2eh)
0acc b7        or      a
0acd 2811      jr      z,0ae0h          ; (+11h)
0acf af        xor     a
0ad0 322eff    ld      (0ff2eh),a
0ad3 2164ff    ld      hl,0ff64h
0ad6 111000    ld      de,0010h
0ad9 0604      ld      b,04h
0adb cb86      res     0,(hl)
0add 19        add     hl,de
0ade 10fb      djnz    0adbh            ; (-05h)
0ae0 fdcb0e46  bit     0,(iy+0eh)
0ae4 206d      jr      nz,0b53h         ; (+6dh)
0ae6 3e03      ld      a,03h
0ae8 3298ff    ld      (0ff98h),a
0aeb 3a99ff    ld      a,(0ff99h)
0aee 2120ff    ld      hl,0ff20h
0af1 85        add     a,l
0af2 6f        ld      l,a
0af3 7e        ld      a,(hl)
0af4 fe50      cp      50h
0af6 3801      jr      c,0af9h          ; (+01h)
0af8 af        xor     a
0af9 329aff    ld      (0ff9ah),a
0afc 21abff    ld      hl,0ffabh
0aff 229cff    ld      (0ff9ch),hl
0b02 dd2198ff  ld      ix,0ff98h
0b06 cd0ff0    call    0f00fh
0b09 3aa0ff    ld      a,(0ffa0h)
0b0c b7        or      a
0b0d c0        ret     nz

0b0e 3aaeff    ld      a,(0ffaeh)
0b11 cdcdfa    call    0facdh
0b14 fd7006    ld      (iy+06h),b
0b17 fd7107    ld      (iy+07h),c
0b1a 3a9eff    ld      a,(0ff9eh)
0b1d 07        rlca    
0b1e 07        rlca    
0b1f 07        rlca    
0b20 2f        cpl     
0b21 e606      and     06h
0b23 fd7705    ld      (iy+05h),a
0b26 cb4f      bit     1,a
0b28 2807      jr      z,0b31h          ; (+07h)
0b2a 3e4d      ld      a,4dh
0b2c 211a00    ld      hl,001ah
0b2f 1805      jr      0b36h            ; (+05h)
0b31 3e28      ld      a,28h
0b33 211200    ld      hl,0012h
0b36 fdbe00    cp      (iy+00h)
0b39 3803      jr      c,0b3eh          ; (+03h)
0b3b fd7700    ld      (iy+00h),a
0b3e fd7402    ld      (iy+02h),h
0b41 fd7503    ld      (iy+03h),l
0b44 fdcb0ec6  set     0,(iy+0eh)
0b48 2a96ff    ld      hl,(0ff96h)
0b4b 7c        ld      a,h
0b4c b5        or      l
0b4d 2004      jr      nz,0b53h         ; (+04h)
0b4f fd2296ff  ld      (0ff96h),iy
0b53 2afdc2    ld      hl,(0c2fdh)
0b56 2b        dec     hl
0b57 1600      ld      d,00h
0b59 fd5e03    ld      e,(iy+03h)
0b5c 3eff      ld      a,0ffh
0b5e 3c        inc     a
0b5f b7        or      a
0b60 ed52      sbc     hl,de
0b62 30fa      jr      nc,0b5eh         ; (-06h)
0b64 19        add     hl,de
0b65 23        inc     hl
0b66 4d        ld      c,l
0b67 219bff    ld      hl,0ff9bh
0b6a 71        ld      (hl),c
0b6b fdbe00    cp      (iy+00h)
0b6e 3808      jr      c,0b78h          ; (+08h)
0b70 fd9600    sub     (iy+00h)
0b73 2199ff    ld      hl,0ff99h
0b76 cbfe      set     7,(hl)
0b78 329aff    ld      (0ff9ah),a
0b7b fd6606    ld      h,(iy+06h)
0b7e fd6e07    ld      l,(iy+07h)
0b81 229eff    ld      (0ff9eh),hl
0b84 af        xor     a
0b85 c9        ret     

0b86 018000    ld      bc,0080h
0b89 e603      and     03h
0b8b c8        ret     z

0b8c cb21      sla     c
0b8e cb10      rl      b
0b90 3d        dec     a
0b91 20f9      jr      nz,0b8ch         ; (-07h)
0b93 c9        ret     

0b94 cd28fc    call    0fc28h
0b97 d8        ret     c

0b98 cd4afc    call    0fc4ah
0b9b cdd3fb    call    0fbd3h
0b9e 3ac9ff    ld      a,(0ffc9h)
0ba1 f5        push    af
0ba2 3e00      ld      a,00h
0ba4 3298ff    ld      (0ff98h),a
0ba7 dd2198ff  ld      ix,0ff98h
0bab cd0ff0    call    0f00fh
0bae fd4e0c    ld      c,(iy+0ch)
0bb1 fd360c00  ld      (iy+0ch),00h
0bb5 f1        pop     af
0bb6 b7        or      a
0bb7 2804      jr      z,0bbdh          ; (+04h)
0bb9 cbe1      set     4,c
0bbb 1802      jr      0bbfh            ; (+02h)
0bbd cba1      res     4,c
0bbf fdcb0556  bit     2,(iy+05h)
0bc3 2804      jr      z,0bc9h          ; (+04h)
0bc5 cbe9      set     5,c
0bc7 1802      jr      0bcbh            ; (+02h)
0bc9 cba9      res     5,c
0bcb ddcb0876  bit     6,(ix+08h)
0bcf 2804      jr      z,0bd5h          ; (+04h)
0bd1 cbd9      set     3,c
0bd3 1802      jr      0bd7h            ; (+02h)
0bd5 cb99      res     3,c
0bd7 21fcc2    ld      hl,0c2fch
0bda e5        push    hl
0bdb 71        ld      (hl),c
0bdc 23        inc     hl
0bdd fd7e0d    ld      a,(iy+0dh)
0be0 2f        cpl     
0be1 77        ld      (hl),a
0be2 23        inc     hl
0be3 36e0      ld      (hl),0e0h
0be5 23        inc     hl
0be6 3a2dff    ld      a,(0ff2dh)
0be9 77        ld      (hl),a
0bea e1        pop     hl
0beb 114300    ld      de,0043h
0bee c36cf6    jp      0f66ch
0bf1 cd28fc    call    0fc28h
0bf4 d8        ret     c

0bf5 2a4fff    ld      hl,(0ff4fh)
0bf8 7c        ld      a,h
0bf9 b5        or      l
0bfa c0        ret     nz

0bfb cdd3fb    call    0fbd3h
0bfe c8        ret     z

0bff cd4afc    call    0fc4ah
0c02 3e00      ld      a,00h
0c04 3298ff    ld      (0ff98h),a
0c07 dd2198ff  ld      ix,0ff98h
0c0b cd0ff0    call    0f00fh
0c0e cdcbf3    call    0f3cbh
0c11 3a2fff    ld      a,(0ff2fh)
0c14 fdcb0556  bit     2,(iy+05h)
0c18 2807      jr      z,0c21h          ; (+07h)
0c1a cbbf      res     7,a
0c1c 2100c2    ld      hl,0c200h
0c1f 1805      jr      0c26h            ; (+05h)
0c21 cbff      set     7,a
0c23 2180c2    ld      hl,0c280h
0c26 322fff    ld      (0ff2fh),a
0c29 d330      out     (30h),a
0c2b e5        push    hl
0c2c 22c1ff    ld      (0ffc1h),hl
0c2f 210100    ld      hl,0001h
0c32 22bfff    ld      (0ffbfh),hl
0c35 2a49ff    ld      hl,(0ff49h)
0c38 11b6ff    ld      de,0ffb6h
0c3b 010700    ld      bc,0007h
0c3e 07        rlca    
0c3f 07        rlca    
0c40 e603      and     03h
0c42 2804      jr      z,0c48h          ; (+04h)
0c44 09        add     hl,bc
0c45 3d        dec     a
0c46 20fc      jr      nz,0c44h         ; (-04h)
0c48 edb0      ldir    
0c4a 3aa0ff    ld      a,(0ffa0h)
0c4d e6c0      and     0c0h
0c4f 2013      jr      nz,0c64h         ; (+13h)
0c51 fd7e04    ld      a,(iy+04h)
0c54 32bdff    ld      (0ffbdh),a
0c57 fd7e00    ld      a,(iy+00h)
0c5a 32beff    ld      (0ffbeh),a
0c5d fde5      push    iy
0c5f cdbefc    call    0fcbeh
0c62 fde1      pop     iy
0c64 e1        pop     hl
0c65 cde3f9    call    0f9e3h
0c68 1600      ld      d,00h
0c6a cd6cf6    call    0f66ch
0c6d c33cf0    jp      0f03ch
0c70 9f        sbc     a,a
0c71 fee2      cp      0e2h
0c73 fe1a      cp      1ah
0c75 b0        or      b
0c76 2835      jr      z,0cadh          ; (+35h)
0c78 fe68      cp      68h
0c7a fe12      cp      12h
0c7c 6a        ld      l,d
0c7d 187a      jr      0cf9h            ; (+7ah)
0c7f fec8      cp      0c8h
0c81 fe1a      cp      1ah
0c83 58        ld      e,b
0c84 14        inc     d
0c85 16fe      ld      d,0feh
0c87 56        ld      d,(hl)
0c88 fe12      cp      12h
0c8a 35        dec     (hl)
0c8b 0c        inc     c
0c8c fd7e00    ld      a,(iy+00h)
0c8f b7        or      a
0c90 c0        ret     nz

0c91 2a96ff    ld      hl,(0ff96h)
0c94 7c        ld      a,h
0c95 b5        or      l
0c96 c8        ret     z

0c97 fde5      push    iy
0c99 d1        pop     de
0c9a 010c00    ld      bc,000ch
0c9d edb0      ldir    
0c9f c9        ret     

0ca0 cd28fc    call    0fc28h
0ca3 d8        ret     c

0ca4 cdd3fb    call    0fbd3h
0ca7 c8        ret     z

0ca8 cd4afc    call    0fc4ah
0cab fde5      push    iy
0cad e1        pop     hl
0cae 11f4c2    ld      de,0c2f4h
0cb1 d5        push    de
0cb2 010c00    ld      bc,000ch
0cb5 edb0      ldir    
0cb7 e1        pop     hl
0cb8 114300    ld      de,0043h
0cbb c36cf6    jp      0f66ch
0cbe cd28fc    call    0fc28h
0cc1 d8        ret     c

0cc2 cd4afc    call    0fc4ah
0cc5 cdb9f6    call    0f6b9h
0cc8 c0        ret     nz

0cc9 110c00    ld      de,000ch
0ccc b7        or      a
0ccd ed52      sbc     hl,de
0ccf c0        ret     nz

0cd0 cd4afc    call    0fc4ah
0cd3 2100c1    ld      hl,0c100h
0cd6 fde5      push    iy
0cd8 d1        pop     de
0cd9 010c00    ld      bc,000ch
0cdc edb0      ldir    
0cde c354fc    jp      0fc54h
0ce1 3afbc2    ld      a,(0c2fbh)
0ce4 d631      sub     31h
0ce6 fe04      cp      04h
0ce8 3f        ccf     
0ce9 d8        ret     c

0cea 2600      ld      h,00h
0cec 6f        ld      l,a
0ced 29        add     hl,hl
0cee 29        add     hl,hl
0cef 29        add     hl,hl
0cf0 29        add     hl,hl
0cf1 0156ff    ld      bc,0ff56h
0cf4 09        add     hl,bc
0cf5 e5        push    hl
0cf6 fde1      pop     iy
0cf8 fdcb0876  bit     6,(iy+08h)
0cfc 37        scf     
0cfd c8        ret     z

0cfe 3299ff    ld      (0ff99h),a
0d01 af        xor     a
0d02 c9        ret     

0d03 db70      in      a,(70h)
0d05 cb4f      bit     1,a
0d07 28fa      jr      z,0d03h          ; (-06h)
0d09 3e41      ld      a,41h
0d0b 1802      jr      0d0fh            ; (+02h)
0d0d 3e43      ld      a,43h
0d0f 2101c3    ld      hl,0c301h
0d12 77        ld      (hl),a
0d13 1600      ld      d,00h
0d15 c384f6    jp      0f684h
0d18 cd4afc    call    0fc4ah
0d1b cd9cfc    call    0fc9ch
0d1e 2100c3    ld      hl,0c300h
0d21 b7        or      a
0d22 ed42      sbc     hl,bc
0d24 e5        push    hl
0d25 eb        ex      de,hl
0d26 2ab2fc    ld      hl,(0fcb2h)
0d29 f3        di      
0d2a edb0      ldir    
0d2c fb        ei      
0d2d e1        pop     hl
0d2e 114300    ld      de,0043h
0d31 c36cf6    jp      0f66ch
0d34 cd4afc    call    0fc4ah
0d37 cdb9f6    call    0f6b9h
0d3a c0        ret     nz

0d3b cd9cfc    call    0fc9ch
0d3e b7        or      a
0d3f ed42      sbc     hl,bc
0d41 c0        ret     nz

0d42 c5        push    bc
0d43 cd4afc    call    0fc4ah
0d46 c1        pop     bc
0d47 2100c1    ld      hl,0c100h
0d4a ed5bb2fc  ld      de,(0fcb2h)
0d4e f3        di      
0d4f edb0      ldir    
0d51 fb        ei      
0d52 c354fc    jp      0fc54h
0d55 3afdc2    ld      a,(0c2fdh)
0d58 4f        ld      c,a
0d59 0600      ld      b,00h
0d5b b7        or      a
0d5c c0        ret     nz

0d5d 04        inc     b
0d5e c9        ret     

0d5f cd4afc    call    0fc4ah
0d62 2afdc2    ld      hl,(0c2fdh)
0d65 22b2fc    ld      (0fcb2h),hl
0d68 c354fc    jp      0fc54h
0d6b 00        nop     
0d6c 00        nop     
0d6d cd4afc    call    0fc4ah
0d70 cd54fc    call    0fc54h
0d73 2afdc2    ld      hl,(0c2fdh)
0d76 e9        jp      (hl)
0d77 af        xor     a
0d78 d356      out     (56h),a
0d7a 3c        inc     a
0d7b d354      out     (54h),a
0d7d 3e0b      ld      a,0bh
0d7f cd6bf3    call    0f36bh
0d82 ee04      xor     04h
0d84 e684      and     84h
0d86 c29afd    jp      nz,0fd9ah
0d89 2100c3    ld      hl,0c300h
0d8c 3abcff    ld      a,(0ffbch)
0d8f 3c        inc     a
0d90 47        ld      b,a
0d91 3676      ld      (hl),76h
0d93 23        inc     hl
0d94 36ed      ld      (hl),0edh
0d96 23        inc     hl
0d97 36a3      ld      (hl),0a3h
0d99 23        inc     hl
0d9a 3620      ld      (hl),20h
0d9c 23        inc     hl
0d9d 36fb      ld      (hl),0fbh
0d9f 23        inc     hl
0da0 10ef      djnz    0d91h            ; (-11h)
0da2 3ec9      ld      a,0c9h
0da4 77        ld      (hl),a
0da5 326600    ld      (0066h),a
0da8 23        inc     hl
0da9 22c3ff    ld      (0ffc3h),hl
0dac af        xor     a
0dad 322dff    ld      (0ff2dh),a
0db0 b7        or      a
0db1 2805      jr      z,0db8h          ; (+05h)
0db3 3e4b      ld      a,4bh
0db5 cd6bf3    call    0f36bh
0db8 dd2ab6ff  ld      ix,(0ffb6h)
0dbc fd2ab8ff  ld      iy,(0ffb8h)
0dc0 3abdff    ld      a,(0ffbdh)
0dc3 1f        rra     
0dc4 3a2fff    ld      a,(0ff2fh)
0dc7 3007      jr      nc,0dd0h         ; (+07h)
0dc9 ee20      xor     20h
0dcb 322fff    ld      (0ff2fh),a
0dce d330      out     (30h),a
0dd0 cda4fd    call    0fda4h
0dd3 3a2dff    ld      a,(0ff2dh)
0dd6 d341      out     (41h),a
0dd8 2ac3ff    ld      hl,(0ffc3h)
0ddb f3        di      
0ddc 3ef4      ld      a,0f4h
0dde cd89f3    call    0f389h
0de1 3abbff    ld      a,(0ffbbh)
0de4 47        ld      b,a
0de5 0e43      ld      c,43h
0de7 cd00c3    call    0c300h
0dea fb        ei      
0deb db40      in      a,(40h)
0ded cb47      bit     0,a
0def 20fa      jr      nz,0debh         ; (-06h)
0df1 ed5bbfff  ld      de,(0ffbfh)
0df5 2ac1ff    ld      hl,(0ffc1h)
0df8 3abaff    ld      a,(0ffbah)
0dfb 47        ld      b,a
0dfc dd2ab8ff  ld      ix,(0ffb8h)
0e00 dd7e00    ld      a,(ix+00h)
0e03 dd23      inc     ix
0e05 d342      out     (42h),a
0e07 3a2fff    ld      a,(0ff2fh)
0e0a e620      and     20h
0e0c 3e88      ld      a,88h
0e0e 2802      jr      z,0e12h          ; (+02h)
0e10 cbcf      set     1,a
0e12 cd62f3    call    0f362h
0e15 e698      and     98h
0e17 2814      jr      z,0e2dh          ; (+14h)
0e19 e680      and     80h
0e1b 2036      jr      nz,0e53h         ; (+36h)
0e1d e5        push    hl
0e1e c5        push    bc
0e1f 01fdc2    ld      bc,0c2fdh
0e22 b7        or      a
0e23 ed42      sbc     hl,bc
0e25 c1        pop     bc
0e26 e1        pop     hl
0e27 3004      jr      nc,0e2dh         ; (+04h)
0e29 73        ld      (hl),e
0e2a 23        inc     hl
0e2b 72        ld      (hl),d
0e2c 23        inc     hl
0e2d 13        inc     de
0e2e 10d0      djnz    0e00h            ; (-30h)
0e30 ed53bfff  ld      (0ffbfh),de
0e34 22c1ff    ld      (0ffc1h),hl
0e37 3a2fff    ld      a,(0ff2fh)
0e3a e620      and     20h
0e3c c2fffc    jp      nz,0fcffh
0e3f 3a2dff    ld      a,(0ff2dh)
0e42 3c        inc     a
0e43 21beff    ld      hl,0ffbeh
0e46 be        cp      (hl)
0e47 daf4fc    jp      c,0fcf4h
0e4a 2ac1ff    ld      hl,(0ffc1h)
0e4d 36ff      ld      (hl),0ffh
0e4f 23        inc     hl
0e50 36ff      ld      (hl),0ffh
0e52 af        xor     a
0e53 f5        push    af
0e54 3eff      ld      a,0ffh
0e56 322dff    ld      (0ff2dh),a
0e59 d341      out     (41h),a
0e5b f1        pop     af
0e5c c9        ret     

0e5d 3abaff    ld      a,(0ffbah)
0e60 4f        ld      c,a
0e61 dde5      push    ix
0e63 e1        pop     hl
0e64 46        ld      b,(hl)
0e65 23        inc     hl
0e66 ed5bc3ff  ld      de,(0ffc3h)
0e6a cd0bfe    call    0fe0bh
0e6d 10fb      djnz    0e6ah            ; (-05h)
0e6f 46        ld      b,(hl)
0e70 23        inc     hl
0e71 e5        push    hl
0e72 dde1      pop     ix
0e74 3a2dff    ld      a,(0ff2dh)
0e77 dd7707    ld      (ix+07h),a
0e7a 3a2fff    ld      a,(0ff2fh)
0e7d e620      and     20h
0e7f 3e00      ld      a,00h
0e81 2801      jr      z,0e84h          ; (+01h)
0e83 3c        inc     a
0e84 dd7709    ld      (ix+09h),a
0e87 fd7e00    ld      a,(iy+00h)
0e8a fd23      inc     iy
0e8c dd770b    ld      (ix+0bh),a
0e8f dde5      push    ix
0e91 e1        pop     hl
0e92 c5        push    bc
0e93 cd0bfe    call    0fe0bh
0e96 10fb      djnz    0e93h            ; (-05h)
0e98 dd7e0d    ld      a,(ix+0dh)
0e9b cdcdfa    call    0facdh
0e9e 3eff      ld      a,0ffh
0ea0 12        ld      (de),a
0ea1 13        inc     de
0ea2 0b        dec     bc
0ea3 78        ld      a,b
0ea4 b1        or      c
0ea5 20f7      jr      nz,0e9eh         ; (-09h)
0ea7 46        ld      b,(hl)
0ea8 23        inc     hl
0ea9 cd0bfe    call    0fe0bh
0eac 10fb      djnz    0ea9h            ; (-05h)
0eae c1        pop     bc
0eaf 0d        dec     c
0eb0 20c2      jr      nz,0e74h         ; (-3eh)
0eb2 2ac3ff    ld      hl,(0ffc3h)
0eb5 01d827    ld      bc,27d8h
0eb8 09        add     hl,bc
0eb9 ed52      sbc     hl,de
0ebb 44        ld      b,h
0ebc 4d        ld      c,l
0ebd 62        ld      h,d
0ebe 6b        ld      l,e
0ebf 13        inc     de
0ec0 77        ld      (hl),a
0ec1 edb0      ldir    
0ec3 c9        ret     

0ec4 c5        push    bc
0ec5 46        ld      b,(hl)
0ec6 23        inc     hl
0ec7 7e        ld      a,(hl)
0ec8 23        inc     hl
0ec9 12        ld      (de),a
0eca 13        inc     de
0ecb 10fc      djnz    0ec9h            ; (-04h)
0ecd c1        pop     bc
0ece c9        ret     

0ecf 0110ff    ld      bc,0ff10h
0ed2 0b        dec     bc
0ed3 03        inc     bc
0ed4 00        nop     
0ed5 03        inc     bc
0ed6 00        nop     
0ed7 01fe01    ld      bc,01feh
0eda 00        nop     
0edb 010001    ld      bc,0100h
0ede 00        nop     
0edf 010001    ld      bc,0100h
0ee2 f7        rst     30h
0ee3 0b        dec     bc
0ee4 ff        rst     38h
0ee5 0600      ld      b,00h
0ee7 01fb02    ld      bc,02fbh
0eea 01f709    ld      bc,09f7h
0eed ff        rst     38h
0eee 01204e    ld      bc,4e20h
0ef1 0c        inc     c
0ef2 0c        inc     c
0ef3 00        nop     
0ef4 03        inc     bc
0ef5 f5        push    af
0ef6 01fe01    ld      bc,01feh
0ef9 00        nop     
0efa 010001    ld      bc,0100h
0efd 00        nop     
0efe 010101    ld      bc,0101h
0f01 f7        rst     30h
0f02 164e      ld      d,4eh
0f04 0c        inc     c
0f05 00        nop     
0f06 03        inc     bc
0f07 f5        push    af
0f08 01fb02    ld      bc,02fbh
0f0b 01f710    ld      bc,10f7h
0f0e 4e        ld      c,(hl)
0f0f 12        ld      (de),a
0f10 100e      djnz    0f20h            ; (+0eh)
0f12 0c        inc     c
0f13 0a        ld      a,(bc)
0f14 08        ex      af,af'
0f15 0604      ld      b,04h
0f17 02        ld      (bc),a
0f18 110f0d    ld      de,0d0fh
0f1b 0b        dec     bc
0f1c 09        add     hl,bc
0f1d 07        rlca    
0f1e 05        dec     b
0f1f 03        inc     bc
0f20 010107    ld      bc,0701h
0f23 0d        dec     c
0f24 060c      ld      b,0ch
0f26 12        ld      (de),a
0f27 05        dec     b
0f28 0b        dec     bc
0f29 11040a    ld      de,0a04h
0f2c 1003      djnz    0f31h            ; (+03h)
0f2e 09        add     hl,bc
0f2f 0f        rrca    
0f30 02        ld      (bc),a
0f31 08        ex      af,af'
0f32 0e04      ld      c,04h
0f34 28ff      jr      z,0f35h          ; (-01h)
0f36 0600      ld      b,00h
0f38 01fc1a    ld      bc,1afch
0f3b ff        rst     38h
0f3c 0b        dec     bc
0f3d 03        inc     bc
0f3e 00        nop     
0f3f 03        inc     bc
0f40 00        nop     
0f41 01fe01    ld      bc,01feh
0f44 00        nop     
0f45 010001    ld      bc,0100h
0f48 00        nop     
0f49 010001    ld      bc,0100h
0f4c f7        rst     30h
0f4d 0b        dec     bc
0f4e ff        rst     38h
0f4f 0600      ld      b,00h
0f51 01fb02    ld      bc,02fbh
0f54 01f71b    ld      bc,1bf7h
0f57 ff        rst     38h
0f58 05        dec     b
0f59 50        ld      d,b
0f5a 4e        ld      c,(hl)
0f5b 0c        inc     c
0f5c 00        nop     
0f5d 03        inc     bc
0f5e f601      or      01h
0f60 fc324e    call    m,4e32h
0f63 0c        inc     c
0f64 0c        inc     c
0f65 00        nop     
0f66 03        inc     bc
0f67 f5        push    af
0f68 01fe01    ld      bc,01feh
0f6b 00        nop     
0f6c 010001    ld      bc,0100h
0f6f 00        nop     
0f70 010101    ld      bc,0101h
0f73 f7        rst     30h
0f74 164e      ld      d,4eh
0f76 0c        inc     c
0f77 00        nop     
0f78 03        inc     bc
0f79 f5        push    af
0f7a 01fb02    ld      bc,02fbh
0f7d 01f735    ld      bc,35f7h
0f80 4e        ld      c,(hl)
0f81 010e03    ld      bc,030eh
0f84 1005      djnz    0f8bh            ; (+05h)
0f86 12        ld      (de),a
0f87 07        rlca    
0f88 14        inc     d
0f89 09        add     hl,bc
0f8a 160b      ld      d,0bh
0f8c 180d      jr      0f9bh            ; (+0dh)
0f8e 1a        ld      a,(de)
0f8f 02        ld      (bc),a
0f90 0f        rrca    
0f91 04        inc     b
0f92 110613    ld      de,1306h
0f95 08        ex      af,af'
0f96 15        dec     d
0f97 0a        ld      a,(bc)
0f98 17        rla     
0f99 0c        inc     c
0f9a 19        add     hl,de
0f9b 011209    ld      bc,0912h
0f9e 1a        ld      a,(de)
0f9f 110819    ld      de,1908h
0fa2 1007      djnz    0fabh            ; (+07h)
0fa4 180f      jr      0fb5h            ; (+0fh)
0fa6 0617      ld      b,17h
0fa8 0e05      ld      c,05h
0faa 160d      ld      d,0dh
0fac 04        inc     b
0fad 15        dec     d
0fae 0c        inc     c
0faf 03        inc     bc
0fb0 14        inc     d
0fb1 0b        dec     bc
0fb2 02        ld      (bc),a
0fb3 13        inc     de
0fb4 0a        ld      a,(bc)
0fb5 ff        rst     38h
0fb6 ff        rst     38h
0fb7 ff        rst     38h
0fb8 ff        rst     38h
0fb9 00        nop     
0fba 00        nop     
0fbb 00        nop     
0fbc 00        nop     
0fbd 1010      djnz    0fcfh            ; (+10h)
0fbf 1010      djnz    0fd1h            ; (+10h)
0fc1 00        nop     
0fc2 ff        rst     38h
0fc3 010000    ld      bc,0000h
0fc6 00        nop     
0fc7 320a00    ld      (000ah),a
0fca 00        nop     
0fcb 00        nop     
0fcc 00        nop     
0fcd 21f8be    ld      hl,0bef8h
0fd0 f7        rst     30h
0fd1 e1        pop     hl
0fd2 f7        rst     30h
0fd3 02        ld      (bc),a
0fd4 0d        dec     c
0fd5 0a        ld      a,(bc)
0fd6 00        nop     
0fd7 00        nop     
0fd8 00        nop     
0fd9 00        nop     
0fda 3c        inc     a
0fdb 00        nop     
0fdc 80        add     a,b
0fdd 00        nop     
0fde b7        or      a
0fdf fb        ei      
0fe0 00        nop     
0fe1 c5        push    bc
0fe2 ff        rst     38h
0fe3 0f        rrca    
0fe4 73        ld      (hl),e
0fe5 00        nop     
0fe6 00        nop     
0fe7 00        nop     
0fe8 00        nop     
0fe9 00        nop     
0fea 00        nop     
0feb 00        nop     
0fec 00        nop     
0fed 00        nop     
0fee 00        nop     
0fef 00        nop     
0ff0 53        ld      d,e
0ff1 41        ld      b,c
0ff2 4c        ld      c,h
0ff3 4c        ld      c,h
0ff4 59        ld      e,c
0ff5 2031      jr      nz,1028h         ; (+31h)
0ff7 2052      jr      nz,104bh         ; (+52h)
0ff9 65        ld      h,l
0ffa 76        halt    
0ffb 2031      jr      nz,102eh         ; (+31h)
0ffd 2e30      ld      l,30h
0fff 310000    ld      sp,0000h

1K* ྷ�B0���  :� �(B=(�=(�*�  -��B �G!  �!� �~ �#�08��
0�)T])) _�:�2+� ��B0� 		� ! 	>$�s"�*��y14ͫ8��02�!  "�! 	�q"�>:�s++:��Aw*��y13ͫ8��1*��w�*��q"���(*��yDSͫ8� ��D 	*����*��q"�*��y13ͫ8�*���1w:�<2�!��ډ!  "��[��>:�s�*��	F�˸͈͜���G͈͜*��	~�G͈͡:�<2�!���*��q�	� NYͫ�Y*�>$�s"�"�*��yACͫ8��A2�*��q"�*��yACͫ8��A2�*��q"�*��y19ͫ8��12�*�>:�s�:��	G͈͡�>:�s�:��G͈͜:��G͈͡*��q�	� NYͫ�Y*�*�>$�s��y�
� �>?�s�	� !� �K ���K*  �@�	 ��! ��	 ���  >?  ���^�� �~#�? ��! 	>)��s��~�.����>,�� �> ���
� �:�� :�����8��?�� �7��a��{�� �           (                                         �2                                               !K�"I��lSYSCOPY 0  !  �!��~ � _�!a��^ �� ~(�#�:2��J��B�8�!�5 �5  ��B8�5 �5 :ͅ!:��(.��lfreptr00 :��ͅ�lfretop00 ���ͅ�lntrksa !  "��2��l *��	~�� !�4��!R�e�怶ͅ:�<2�!��8��lratea !  "��l *��	~�ͅ:�<2�!��8�:��(�lds5in32 :�= �lonedsk01 �liiobyt :��>�(>�ͅ:�= �ltxmask0000 �libaud :��!U�e:��~8��ͅ�l :��!X�eͅ:��(@�l0 :͘:͘�l07 !�F	���l ��~#��ͅ����l �ͅ�lQ !K�"I��M(P���4h4h��L)9L�o0$~���r���[I�~� (����SI�#��͘�͘6#"I���Ɛ'�@'*I�w#"I���	����!���*I�~#"I�˿� ����/��C�y��F��/��F�*  �!@�	 ���           I�~� (����O!b	���q!v��z͒�q�. ?� * �!  9" �8" ͉�Z* " �+* �� '/7?v�����������������"*2:��EI  SPHLDI  XCHGPCHLXTHLRET HLT CMC STC CMA DAA RAR RAL RRC RLC NOP CPI ORI XRI ANI SBI IN  SUI OUT ACI ADI CALLJMP LDA STA LHLDSHLDMOV ADD ADC SUB SBB ANA XRA ORA CMP INR DCR MVI LXI STAXINX DAD LDAXDCX RST PSW POP PUSHNZZ NCC POPEP M B C D E H L M A B   D   H   SP  PSW ??= M !Eâê��ö������-Ð�f���"J��  * "�!�" !  " �2O! " "]"�"�! 1��! �++"���"M>�28 !�"9 :] � ��!  �í	1�--------------------------------
-  SALLY 1 CP/M configuration  -
-   R S D   -   Version 9.84   -
--------------------------------

$

  Disk Parameter aendern
  ----------------------

1. Anzahl der Disk-Laufwerke 

   wieviele Laufwerke     [ 1 bis 4 ]?


2. Art des Disk-Laufwerkes  X:

   1) 8 Zoll 77 Track.
   2) 5 Zoll 40 Track.
   3) 5 Zoll 80 Track.

   waehle Disk Art [ 1 bis 3 ] ?

   S) Single Sided.
   D) Double Sided.

   Floppy Type [ S oder D ] ?

1) schnell Step.
2) normal Step.   
3) langsam Step.
   
   Step Geschwindigkeit [1-3] ?


   Disk geaendert
   --------------   
A: nicht vorhanden                              
B: nicht vorhanden                              
C: nicht vorhanden                              
D: nicht vorhanden                              
   
   Werte richtig   [ Y/N ] ?$




Drucker Parameter aendern 
------------------------- 

1. Drucker Type   

   A) Parallel Centronics.
   B) Serial ohne Handshake.   
   C) Serial mit DTR Handshake. 

   welcher Drucker  [ A bis C ]  ?



RS-232 Schnittstelle aendern 
---------------------------- 

1. Datenlaenge - Parity 

   A) 8 Bits und No Parity. 
   B) 7 Bits und Odd Parity. 
   C) 7 Bits und Even Parity. 

   Datenlaenge und Parity [ A bis C ] ?


2. Baudrate

   1) 9600 Baud.
   2) 4800 Baud.
   3) 2400 Baud.
   4) 1200 Baud.
   5)  600 Baud.
   6)  300 Baud.
   7)  150 Baud.
   8)  110 Baud.
   9)   75 Baud.

   waehle Baudrate [1 bis 9] ?


  Drucker und RS-232 Port geandert
  --------------------------------
Drucker:                                      .
 RS-232:                                      .

   sind die Werte richtig [ Y/N ]?$




AUTORUN Komando (nach dem Booten)
---------------------------------

Befehls - Zeile, die nach dem Booten
automatisch gestartet werden soll
(RETURN = kein Befehl)

?


Die Werte werden SYSCOPY uebergeben.  
$

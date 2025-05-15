;--------------------------------------------------------------------------------------------------------------------------------------
; Nom alumne: Biel Torruella
; Grup pràctiques: Grup 2
;--------------------------------------------------------------------------------------------------------------------------------------
TECLAT EQU 0B000h 
PANTALLA EQU 0A000h 
ORIGEN 100h 
INICIO ini 
.DATOS 
fila1 VALOR 0,0,0 
fila2 VALOR 0,0,0 
fila3 VALOR 0,0,0 
.CODIGO
;--------------------------------------------------------------------------------------------------------------------------------------
ini:
MOVH R0, BYTEALTO DIRECCION clean_screen
MOVL R0, BYTEBAJO DIRECCION clean_screen
CALL R0
CALL neteja_teclat
CALL pintar_tauler
reset:
MOVH R0, BYTEALTO DIRECCION torn_jug1
MOVL R0, BYTEBAJO DIRECCION torn_jug1
CALL R0
MOVH R0, BYTEALTO DIRECCION three_in_row
MOVL R0, BYTEBAJO DIRECCION three_in_row
CALL R0
MOVH R0, BYTEALTO DIRECCION full_board
MOVL R0, BYTEBAJO DIRECCION full_board
CALL R0
MOVH R0, BYTEALTO DIRECCION torn_jug2
MOVL R0, BYTEBAJO DIRECCION torn_jug2
CALL R0
MOVH R0, BYTEALTO DIRECCION three_in_row
MOVL R0, BYTEBAJO DIRECCION three_in_row
CALL R0
MOVH R0, BYTEALTO DIRECCION full_board
MOVL R0, BYTEBAJO DIRECCION full_board
CALL R0
JMP reset
;--------------------------------------------------------------------------------------------------------------------------------------
neteja_teclat: 
    PUSH R1 
    PUSH R2 
    XOR R0,R0,R0 
    MOVH R1,BYTEALTO PANTALLA 
    MOVL R1,BYTEBAJO PANTALLA 
    INC R1 
    MOVH R2,00h 
    MOVL R2,00000100b 
    MOV [R1],R2 
    POP R2 
    POP R1 
RET 
;--------------------------------------------------------------------------------------------------------------------------------------
pintar_tauler:
    MOVH R0, BYTEALTO PANTALLA ;R0 es la posico de origen de la pantalla
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, 'C' ; Caracter C
    MOVH R3, 00h ; R3 --> posicio dintre de la pantalla
    MOVL R3, 31h
    ADD R1, R0, R3 ; a R1 sumem la posicio de origen de la pantalla amb la posicio de dintre de la pantalla
    MOV [R1], R2
    INC R1
    MOVL R2, 'O' ; Caracter O
    MOV [R1], R2
    INC R1
    MOVL R2, 'L' ; Caracter L
    MOV [R1], R2
    INC R1
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVL R2, '1' ; Caracter 1
    MOV [R1], R2
    INC R1
    MOVL R2, '2' ; Caracter 2
    MOV [R1], R2
    INC R1
    MOVL R2, '3' ; Caracter 3
    MOV [R1], R2
    ;declaro R4 com a A que es el salt que busco fer
    MOVH R4, 00h
    MOVL R4, 0Ah
    ADD R1, R1, R4
    MOVL R2, 'F' ; Caracter F
    MOV [R1], R2
    INC R1
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVL R2, '1' ; Caracter 1
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    ADD R1, R1, R4
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, 'I' ; Caracter I
    MOV [R1], R2
    INC R1
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, '2' ; Caracter 2
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    ADD R1, R1, R4
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, 'L' ; Caracter L
    MOV [R1], R2
    INC R1
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, '3' ; Caracter 3
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
    INC R1
    MOVH R2, 110100b ;color de text i fons
    MOVL R2, ' ' ; Caracter buit
    MOV [R1], R2
RET
;--------------------------------------------------------------------------------------------------------------------------------------
torn_jug1:
    MOVH R1, BYTEALTO TECLAT
    MOVL R1, BYTEBAJO TECLAT
    ; R0 --> PANTALLA // R1 --> TECLAT
    ret_ef1:
    CALL paint_t
    INC R0
    INC R0
    MOVL R3, '1'
    MOV [R0], R3
    CALL Escriu_FIL
    MOVH R0, BYTEALTO DIRECCION Scan_F
    MOVL R0, BYTEBAJO DIRECCION Scan_F
    CALL R0
    MOVH R0, BYTEALTO DIRECCION Scan_C
    MOVL R0, BYTEBAJO DIRECCION Scan_C
    CALL R0
    ret_t1:
RET
torn_jug2:
    MOVH R1, BYTEALTO TECLAT
    MOVL R1, BYTEBAJO TECLAT
    ; R0 --> PANTALLA // R1 --> TECLAT
    ret_ef2:
    CALL paint_t
    INC R0
    INC R0
    MOVL R3, '2'
    MOV [R0], R3
    CALL Escriu_FIL
    MOVH R0, BYTEALTO DIRECCION Scan_F
    MOVL R0, BYTEBAJO DIRECCION Scan_F
    CALL R0
    MOVH R0, BYTEALTO DIRECCION Scan_C_2
    MOVL R0, BYTEBAJO DIRECCION Scan_C_2
    CALL R0
    ret_t2:
RET
paint_t:
    MOVH R0, BYTEALTO PANTALLA
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R3, 000111b
    MOVL R3, ' '
    MOV [R0], R3
    INC R0
    MOVL R3, 'T'
    MOV [R0], R3
    INC R0
    MOVL R3, 'O'
    MOV [R0], R3
    INC R0
    MOVL R3, 'R'
    MOV [R0], R3
    INC R0
    MOVL R3, 'N'
    MOV [R0], R3
    INC R0
    INC R0
    MOVL R3, 'J'
    MOV [R0], R3
    INC R0
    MOVL R3, 'U'
    MOV [R0], R3
    INC R0
    MOVL R3, 'G'
    MOV [R0], R3
    INC R0
    MOVL R3, 'A'
    MOV [R0], R3
    INC R0
    MOVL R3, 'D'
    MOV [R0], R3
    INC R0
    MOVL R3, 'O'
    MOV [R0], R3
    INC R0
    MOVL R3, 'R'
    MOV [R0], R3
RET
C1:
    XOR R6, R6, R6
    MOV R3, [R5]
    COMP R3, R6 ; if (R3 != 0) { ret_ef1 } 
    BRNZ ret_ef1
    CALL step_afegirx
JMP ret_t1
C2:
    INC R4
    XOR R6, R6, R6
    INC R5
    MOV R3, [R5]
    COMP R3, R6 ; if (R3 != 0) { ret_ef1 } 
    BRNZ ret_ef1
    CALL step_afegirx
JMP ret_t1
C3:
    INC R4
    INC R4
    XOR R6, R6, R6
    INC R5
    INC R5
    MOV R3, [R5]
    COMP R3, R6
    BRNZ ret_ef1
    CALL step_afegirx
JMP step_ret_t1
step_ret_t1:
    MOVH R0, BYTEALTO DIRECCION ret_t1
    MOVL R0, BYTEBAJO DIRECCION ret_t1
    CALL R0
RET
C1_2:
    XOR R6, R6, R6
    MOV R3, [R5]
    COMP R3, R6
    BRNZ ret_ef2
    CALL step_afegiro
JMP step_ret_t2
C2_2:
    INC R4
    XOR R6, R6, R6
    INC R5
    MOV R3, [R5]
    COMP R3, R6
    BRNZ ret_ef2
    CALL step_afegiro
JMP step_ret_t2
C3_2:
    INC R4
    INC R4
    XOR R6, R6, R6
    INC R5
    INC R5
    MOV R3, [R5]
    COMP R3, R6
    BRNZ ret_ef2
    CALL step_afegiro
JMP step_ret_t2
step_ret_t2:
    MOVH R0, BYTEALTO DIRECCION ret_t2
    MOVL R0, BYTEBAJO DIRECCION ret_t2
    CALL R0
RET
Escriu_FIL:
    MOVH R0, BYTEALTO PANTALLA
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R3, 00h
    MOVL R3, 0Fh
    ADD R0, R0, R3
    MOVH R3, 000111b
    MOVL R3, 'E'
    MOV [R0], R3
    INC R0
    MOVL R3, 's'
    MOV [R0], R3
    INC R0
    MOVL R3, 'c'
    MOV [R0], R3
    INC R0
    MOVL R3, 'r'
    MOV [R0], R3
    INC R0
    MOVL R3, 'i'
    MOV [R0], R3
    INC R0
    MOVL R3, 'u'
    MOV [R0], R3
    INC R0
    INC R0
    MOVL R3, 'F'
    MOV [R0], R3
    INC R0
    MOVL R3, 'I'
    MOV [R0], R3
    INC R0
    MOVL R3, 'L'
    MOV [R0], R3
    INC R0
    MOVL R3, ':'
    MOV [R0], R3
RET
Scan_F:
    MOV R3, [R1]
    MOVH R6, 2Fh
    MOVL R6, 31h
    COMP R3, R6 ; if R3 == 1
    BRZ F1
    MOVH R6, 30h
    MOVL R6, 32h
    COMP R3, R6 ; if R3 == 2
    BRZ F2
    MOVH R6, 31h
    MOVL R6, 33h
    COMP R3, R6 ; if R3 == 3
    BRZ F3
JMP Scan_F
step_afegirx:
    MOVH R0, BYTEALTO DIRECCION Afegir_x
    MOVL R0, BYTEBAJO DIRECCION Afegir_x
    CALL R0
RET
step_afegiro:
    MOVH R0, BYTEALTO DIRECCION Afegir_o
    MOVL R0, BYTEBAJO DIRECCION Afegir_o
    CALL R0
RET
Scan_C:
    MOV R3, [R1]
    MOVH R6, 2Fh
    MOVL R6, 31h
    COMP R3, R6 ; if R3 == 1
    BRZ C1
    MOVH R6, 30h
    MOVL R6, 32h
    COMP R3, R6 ; if R3 == 2
    BRZ C2
    MOVH R6, 31h
    MOVL R6, 33h
    COMP R3, R6 ; if R3 == 3
    BRZ C3
JMP Scan_C
Scan_C_2:
    MOV R3, [R1]
    MOVH R6, 2Fh
    MOVL R6, 31h
    COMP R3, R6 ; if R3 == 1
    BRZ C1_2
    MOVH R6, 30h
    MOVL R6, 32h
    COMP R3, R6 ; if R3 == 2
    BRZ C2_2
    MOVH R6, 31h
    MOVL R6, 33h
    COMP R3, R6 ; if R3 == 3
    BRZ C3_2
JMP Scan_C_2
F1:
    MOVH R5, BYTEALTO DIRECCION fila1
    MOVL R5, BYTEBAJO DIRECCION fila1
    XOR R4, R4, R4 ; R4 = 0
    JMP Escriu_COL
RET
F2:
    MOVH R5, BYTEALTO DIRECCION fila2
    MOVL R5, BYTEBAJO DIRECCION fila2
    XOR R4, R4, R4
    XOR R3, R3, R3
    MOVH R3, 00h
    MOVL R3, 0Fh
    ADD R4, R4, R3 ; MOVEM R4 UNA FILA DEVALL
    JMP Escriu_COL
F3:
    MOVH R5, BYTEALTO DIRECCION fila3
    MOVL R5, BYTEBAJO DIRECCION fila3
    XOR R4, R4, R4
    MOVH R3, 00h
    MOVL R3, 0Fh
    ADD R4, R4, R3
    ADD R4, R4, R3 ; MOVEM R4 DOS FILES DEVALL
    JMP Escriu_COL

Escriu_COL:
    MOVH R0, BYTEALTO PANTALLA
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R3, 00h
    MOVL R3, 0Fh
    ADD R0, R0, R3
    MOVH R3, 000111b
    MOVL R3, 'E'
    MOV [R0], R3
    INC R0
    MOVL R3, 's'
    MOV [R0], R3
    INC R0
    MOVL R3, 'c'
    MOV [R0], R3
    INC R0
    MOVL R3, 'r'
    MOV [R0], R3
    INC R0
    MOVL R3, 'i'
    MOV [R0], R3
    INC R0
    MOVL R3, 'u'
    MOV [R0], R3
    INC R0
    INC R0
    MOVL R3, 'C'
    MOV [R0], R3
    INC R0
    MOVL R3, 'O'
    MOV [R0], R3
    INC R0
    MOVL R3, 'L'
    MOV [R0], R3
    INC R0
    MOVL R3, ':'
    MOV [R0], R3
RET
Afegir_x:
    XOR R6, R6, R6
    INC R6
    MOV [R5], R6 ; [R5] = 1
    MOVH R0, BYTEALTO PANTALLA
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R3, 00h ; R3 = SALT DE PANTALLA
    MOVL R3, 44h
    ADD R0, R0, R3 ; COLOCO R0 A LA POSICIO DEL TAULER
    ADD R0, R0, R4 ; COLOCO R0 DINTRE DEL TAULER
    XOR R4, R4, R4 ; RESETEJEM R4
    MOVH R3, 110100b
    MOVL R3, 'X'
    MOV [R0], R3 ; Afegeix la X a la posicio de la pantalla R4
RET
Afegir_o:
    MOVH R6, 00h
    MOVL R6, 09h
    MOV [R5], R6 ; [R5] = 9
    MOVH R0, BYTEALTO PANTALLA
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R3, 00h ; R3 = SALT DE PANTALLA
    MOVL R3, 44h
    ADD R0, R0, R3 ; COLOCO R0 A LA POSICIO DEL TAULER
    ADD R0, R0, R4 ; COLOCO R0 DINTRE DEL TAULER
    XOR R4, R4, R4 ; RESETEJEM R4
    MOVH R3, 110100b
    MOVL R3, 'O'
    MOV [R0], R3 ; Afegeix la O a la posicio de la pantalla R4
RET
;--------------------------------------------------------------------------------------------------------------------------------------
three_in_row:
    XOR R4, R4, R4
    MOVL R4, 03h
    XOR R5, R5, R5
    MOVL R5, 1Bh
    MOVH R0, BYTEALTO DIRECCION fila1
    MOVL R0, BYTEBAJO DIRECCION fila1
    CALL check_files
    COMP R2, R4
    BRZ Win1
    COMP R2, R5
    BRZ Win2
    MOVH R0, BYTEALTO DIRECCION fila2
    MOVL R0, BYTEBAJO DIRECCION fila2
    CALL check_files
    COMP R2, R4
    BRZ Win1
    COMP R2, R5
    BRZ Win2
    MOVH R0, BYTEALTO DIRECCION fila3
    MOVL R0, BYTEBAJO DIRECCION fila3
    CALL check_files
    COMP R2, R4
    BRZ Win1
    COMP R2, R5
    BRZ Win2
    CALL check_columns
    CALL check_diagonal
RET
check_files:
    XOR R2, R2, R2; R2=0
    MOVH R3, 00h
    MOVL R3, 03h
    bucle_files:
    MOV R1, [R0]
    ADD R2, R2, R1
    INC R0
    DEC R3
    BRNZ bucle_files ;R2 = sum of fila 1
RET
check_columns:
    CALL check_column1
    CALL check_column2
    CALL check_column3
RET
check_column1:
        XOR R2, R2, R2
        MOVH R0, BYTEALTO DIRECCION fila1
        MOVL R0, BYTEBAJO DIRECCION fila1
        MOV R1, [R0]
        ADD R2, R2, R1
        MOVH R0, BYTEALTO DIRECCION fila2
        MOVL R0, BYTEBAJO DIRECCION fila2
        MOV R1, [R0]
        ADD R2, R2, R1
        MOVH R0, BYTEALTO DIRECCION fila3
        MOVL R0, BYTEBAJO DIRECCION fila3
        MOV R1, [R0]
        ADD R2, R2, R1
        XOR R0, R0, R0
        MOVL R0, 03h
        COMP R2, R0
        BRZ Win1
        MOVL R0, 1Bh
        COMP R2, R0
        BRZ Win2
RET
check_column2:
        XOR R2, R2, R2
        MOVH R0, BYTEALTO DIRECCION fila1
        MOVL R0, BYTEBAJO DIRECCION fila1
        INC R0
        MOV R1, [R0]
        ADD R2, R2, R1
        MOVH R0, BYTEALTO DIRECCION fila2
        MOVL R0, BYTEBAJO DIRECCION fila2
        INC R0
        MOV R1, [R0]
        ADD R2, R2, R1
        MOVH R0, BYTEALTO DIRECCION fila3
        MOVL R0, BYTEBAJO DIRECCION fila3
        INC R0
        MOV R1, [R0]
        ADD R2, R2, R1
        XOR R0, R0, R0
        MOVL R0, 03h
        COMP R2, R0
        BRZ Win1
        MOVL R0, 1Bh
        COMP R2, R0
        BRZ Win2
RET
check_column3:
        XOR R2, R2, R2
        MOVH R0, BYTEALTO DIRECCION fila1
        MOVL R0, BYTEBAJO DIRECCION fila1
        INC R0
        INC R0
        MOV R1, [R0]
        ADD R2, R2, R1
        MOVH R0, BYTEALTO DIRECCION fila2
        MOVL R0, BYTEBAJO DIRECCION fila2
        INC R0
        INC R0
        MOV R1, [R0]
        ADD R2, R2, R1
        MOVH R0, BYTEALTO DIRECCION fila3
        MOVL R0, BYTEBAJO DIRECCION fila3
        INC R0
        INC R0
        MOV R1, [R0]
        ADD R2, R2, R1
        XOR R0, R0, R0
        MOVL R0, 03h
        COMP R2, R0
        BRZ Win1
        MOVL R0, 1Bh
        COMP R2, R0
        BRZ Win2
RET
check_diagonal:
    MOVH R0, BYTEALTO DIRECCION fila1
    MOVL R0, BYTEBAJO DIRECCION fila1
    MOV R1, [R0]
    XOR R2, R2, R2
    COMP R1, R2
    BRNZ d1 ; if R1 != 0 {  d1 }
    ret_d1:
    MOVH R0, BYTEALTO DIRECCION fila1
    MOVL R0, BYTEBAJO DIRECCION fila1
    INC R0
    INC R0
    MOV R1, [R0]
    XOR R2, R2, R2
    COMP R1, R2
    BRNZ d2 ; if R1 != 0 {  d2 }
    ret_d2:
RET
Win1:
    CALL print_Win
    INC R0
    MOVH R1, 000111b
    MOVL R1, '1'
    MOV [R0], R1
    MOVH R0, BYTEALTO DIRECCION rep
    MOVL R0, BYTEBAJO DIRECCION rep
CALL R0
Win2:
    CALL print_Win
    INC R0
    MOVH R1, 000111b
    MOVL R1, '2'
    MOV [R0], R1
    MOVH R0, BYTEALTO DIRECCION rep
    MOVL R0, BYTEBAJO DIRECCION rep
CALL R0
d1:
    XOR R3, R3, R3
    ADD R3, R3, R1
    MOVH R0, BYTEALTO DIRECCION fila2
    MOVL R0, BYTEBAJO DIRECCION fila2
    INC R0
    MOV R1, [R0]
    ADD R3, R3, R1
    MOVH R0, BYTEALTO DIRECCION fila3
    MOVL R0, BYTEBAJO DIRECCION fila3
    INC R0
    INC R0
    MOV R1, [R0]
    ADD R3, R3, R1
    XOR R4, R4, R4
    MOVL R4, 03h
    COMP R3, R4
    BRZ Win1
    MOVL R4, 1Bh
    COMP R3, R4
    BRZ Win2
JMP ret_d1
d2:
    XOR R3, R3, R3
    ADD R3, R3, R1
    MOVH R0, BYTEALTO DIRECCION fila2
    MOVL R0, BYTEBAJO DIRECCION fila2
    INC R0
    MOV R1, [R0]
    ADD R3, R3, R1
    MOVH R0, BYTEALTO DIRECCION fila3
    MOVL R0, BYTEBAJO DIRECCION fila3
    MOV R1, [R0]
    ADD R3, R3, R1
    XOR R4, R4, R4
    MOVL R4, 03h
    COMP R3, R4
    BRZ Win1
    MOVL R4, 1Bh
    COMP R3, R4
    BRZ Win2
JMP ret_d2
;---------------------------------------------------------------------------------------------------------------------------------------
print_Win:
    CALL clean_screen
    MOVH R0, BYTEALTO PANTALLA
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R1, 00h
    MOVL R1, 0Fh
    ADD R1, R1, R1; 2 LINEES DE SALT
    ADD R0, R0, R1
    MOVH R1, 000111b
    MOVL R1, 'C'
    MOV [R0], R1
    INC R0
    MOVL R1, 'A'
    MOV [R0], R1
    INC R0
    MOVL R1, 'M'
    MOV [R0], R1
    INC R0
    MOVL R1, 'P'
    MOV [R0], R1
    INC R0
    MOVL R1, 'I'
    MOV [R0], R1
    INC R0
    MOVL R1, 'O'
    MOV [R0], R1
    INC R0
    INC R0
    MOVL R1, 'J'
    MOV [R0], R1
    INC R0
    MOVL R1, 'U'
    MOV [R0], R1
    INC R0
    MOVL R1, 'G'
    MOV [R0], R1
    INC R0
    MOVL R1, 'A'
    MOV [R0], R1
    INC R0
    MOVL R1, 'D'
    MOV [R0], R1
    INC R0
    MOVL R1, 'O'
    MOV [R0], R1
    INC R0
    MOVL R1, 'R'
    MOV [R0], R1
RET

clean_screen:
    MOVH R0, BYTEALTO PANTALLA
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R1, 000111b
    MOVL R1, ' '
    MOVH R2, 00h
    MOVL R2, 78h
    bucle_cs:
    MOV [R0], R1
    INC R0
    DEC R2
BRNZ bucle_cs
RET
Empat:
    CALL clean_screen
    MOVH R0, BYTEALTO PANTALLA
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R1, 00h
    MOVL R1, 0Fh
    ADD R1, R1, R1; 2 LINEES DE SALT
    ADD R0, R0, R1
    MOVH R1, 00h
    MOVL R1, 05h
    ADD R0, R0, R1
    MOVH R1, 000111b
    MOVL R1, 'E'
    MOV [R0], R1
    INC R0
    MOVL R1, 'M'
    MOV [R0], R1
    INC R0
    MOVL R1, 'P'
    MOV [R0], R1
    INC R0
    MOVL R1, 'A'
    MOV [R0], R1
    INC R0
    MOVL R1, 'T'
    MOV [R0], R1
JMP rep
rep:
    MOVH R0, BYTEALTO PANTALLA ;R0 es la posico de origen de la pantalla
    MOVL R0, BYTEBAJO PANTALLA
    MOVH R1, BYTEALTO TECLAT
    MOVL R1, BYTEBAJO TECLAT
    MOVH R2, 00h
    MOVL R2, 0Fh
    ADD R2, R2, R2
    ADD R2, R2, R2
    ADD R0, R2, R0
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, 'R' ; Caracter R
    INC R0
    MOV [R0], R2
    MOVL R2, 'E' ; Caracter E
    INC R0
    MOV [R0], R2
    MOVL R2, 'P' ; Caracter P
    INC R0
    MOV [R0], R2
    MOVL R2, 'E' ; Caracter E
    INC R0
    MOV [R0], R2
    MOVL R2, 'A' ; Caracter A
    INC R0
    MOV [R0], R2
    MOVL R2, 'T' ; Caracter T
    INC R0
    MOV [R0], R2
    MOVL R2, '?' ; Caracter ?
    INC R0
    MOV [R0], R2
    MOVL R2, '(' ; Caracter (
    INC R0
    MOV [R0], R2
    MOVH R2, 000010b ;color de text i fons
    MOVL R2, 'Y' ; Caracter Y
    INC R0
    MOV [R0], R2
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, '/' ; Caracter /
    INC R0
    MOV [R0], R2
    MOVH R2, 000100b ;color de text i fons
    MOVL R2, 'N' ; Caracter N
    INC R0
    MOV [R0], R2
    MOVH R2, 000111b ;color de text i fons
    MOVL R2, ')' ; Caracter )
    INC R0
    MOV [R0], R2
JMP scan_r
;---------------------------------------------------------------------------------------------------------------------------------------
full_board:
    XOR R2, R2, R2
    MOVH R0, BYTEALTO DIRECCION fila1
    MOVL R0, BYTEBAJO DIRECCION fila1
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    INC R0
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    INC R0
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    MOVH R0, BYTEALTO DIRECCION fila2
    MOVL R0, BYTEBAJO DIRECCION fila2
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    INC R0
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    INC R0
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    MOVH R0, BYTEALTO DIRECCION fila3
    MOVL R0, BYTEBAJO DIRECCION fila3
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    INC R0
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    INC R0
    MOV R1, [R0]
    COMP R1, R2
    BRZ ret_fb
    MOVH R0, BYTEALTO DIRECCION Empat
    MOVL R0, BYTEBAJO DIRECCION Empat
    CALL Empat
    ret_fb:
RET
ret_ini:
    MOVH R0, BYTEALTO DIRECCION ini
    MOVL R0, BYTEBAJO DIRECCION ini
CALL R0
scan_r:
    MOVH R1, BYTEALTO TECLAT
    MOVL R1, BYTEBAJO TECLAT
    MOV R4, [R1]
    INC R1
    MOVH R3, 0Fh 
    MOVL R3, 79h ; 'y' en ASCII
    COMP R4, R3 ; if R4 == 'y'
    BRZ ret_ini
    MOVH R3, 24h 
    MOVL R3, 6Eh ; 'n' en ASCII
    COMP R4, R3 ; if R4 == 'n'
    BRZ final
JMP scan_r
;----------------------------------------------------------------------------------------------------------------------------------------
final:
FIN
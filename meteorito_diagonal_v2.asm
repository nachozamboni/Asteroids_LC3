.ORIG x3000
AND R0, R0, #0
LD R2, ANCHO_PANTALLA ;	guarda desplazamientos a aplicarle a ASTEROIDE_1

; R3	 desplazamientos maximos en cada direccion VIEJO
; R3	 carga los recorridos de cada asteroide

CARGAR_ARRAY_AST   ; cargo en R4 las direcciones de todos los ASTEROIDES
	LD R4, ASTEROIDES; ARRAY coordenadas posicion ASTEROIDES
	LD R5, ASTEROIDE_1
	STR R5, R4, #0
	LD R5, ASTEROIDE_2
	ADD R4, R4, #1
	STR R5, R4, #0
	LD R5, ASTEROIDE_3
	ADD R4, R4, #1
	STR R5, R4, #0
	LD R5, ASTEROIDE_4
	ADD R4, R4, #1
	STR R5, R4, #0
	;ADD R4, R4, #-2  ; suma para ir al inicio del ARRAY

LD R5, CANT_ITERACIONES

MAIN_LOOP
	LD R1, CANT_ASTEROIDES
	ST R5, GUARDAR_R5
	ADD R4, R4, #-4
	ASTEROIDE_LOOP
		ADD R4, R4, #1	; cambio de asteroide al que desplazo
		LDR R0, R4, #0
		ST R0, ASTEROIDE_UBI
		LD R0, ASTEROIDE_UBI
		LD R3, UNO
		JSR BORRAR_ASTEROIDE
		SUR_LOOP
			LD R2, ANCHO_PANTALLA
			ADD R0, R0, R2
			ADD R3, R3, #-1
			BRp SUR_LOOP
		LD R3, UNO
		ESTE_LOOP
			LD R2, DESPLAZAMIENTO_ESTE
			ADD R0, R0, R2
			ADD R3, R3, #-1
			BRp ESTE_LOOP
		JSR DIBUJAR_ASTEROIDE
		JSR WAIT
		STR R0, R4, #0
		ADD R1, R1, #-1
		BRp ASTEROIDE_LOOP
	LD R5, GUARDAR_R5
	ADD R5, R5, #-1
	BRp MAIN_LOOP
	HALT


DIBUJAR_ASTEROIDE ; Pinta el asteroide desde la posicion guardada en R0
	ST R0, GUARDAR_R0
	ST R1, GUARDAR_R1
	ST R2, GUARDAR_R2
	LD R1, ROJO
	LD R2, ANCHO_PANTALLA
	STR R1, R0, #3
	STR R1, R0, #4
	STR R1, R0, #5
	STR R1, R0, #6
	STR R1, R0, #7
	STR R1, R0, #8
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #2
	STR R1, R0, #8
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #2
	STR R1, R0, #9
	STR R1, R0, #10
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #1
	STR R1, R0, #2
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #9
	STR R1, R0, #10
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #1
	STR R1, R0, #2
	STR R1, R0, #8
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #3
	STR R1, R0, #4
	STR R1, R0, #5
	STR R1, R0, #6
	STR R1, R0, #7
	ADD R0, R0, R2 ; salto de linea
	LD R0, GUARDAR_R0
	LD R1, GUARDAR_R1
	LD R2, GUARDAR_R2
	RET 

WAIT
    LD R6, DELAY
	WAIT_LOOP
		ADD R6, R6, #-1
		BRp WAIT_LOOP
	RET

BORRAR_ASTEROIDE
	ST R0, GUARDAR_R0
	ST R1, GUARDAR_R1
	ST R2, GUARDAR_R2
	LD R1, BLACK
	LD R2, ANCHO_PANTALLA
	STR R1, R0, #3
	STR R1, R0, #4
	STR R1, R0, #5
	STR R1, R0, #6
	STR R1, R0, #7
	STR R1, R0, #8
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #2
	STR R1, R0, #8
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #2
	STR R1, R0, #9
	STR R1, R0, #10
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #1
	STR R1, R0, #2
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #9
	STR R1, R0, #10
	STR R1, R0, #11
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #0
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #1
	STR R1, R0, #2
	STR R1, R0, #8
	STR R1, R0, #9
	ADD R0, R0, R2 ; salto de linea
	STR R1, R0, #3
	STR R1, R0, #4
	STR R1, R0, #5
	STR R1, R0, #6
	STR R1, R0, #7
	ADD R0, R0, R2 ; salto de linea
	LD R0, GUARDAR_R0
	LD R2, GUARDAR_R2
	LD R1, GUARDAR_R1
	RET




HALT

GUARDAR_R0		.BLKW 1
GUARDAR_R1		.BLKW 1
GUARDAR_R2		.BLKW 1
GUARDAR_R5		.BLKW 1
ASTEROIDES		.BLKW 4
ASTEROIDE_UBI	.BLKW 1

CANT_ITERACIONES .FILL #110
UNO		.FILL #1
DOS 	.FILL #2
ASTEROIDE_1 .FILL xC000
ASTEROIDE_2 .FILL xC680 
ASTEROIDE_3 .FILL xCD00
ASTEROIDE_4 .FILL xD380
ANCHO_PANTALLA .FILL #128 
ANCHO_PANTALLA_N .FILL #-128 
CANT_ASTEROIDES .FILL #4
ROJO .FILL x7C00
BLACK .FILL x0000
DELAY .FILL #10000
MAX_ESTE .FILL #116 ; ASTEROIDE_1 + ANCHO_PANTALLA (xC000 + x80(128))
MAX_SUR .FILL #112			; #-15872
DESPLAZAMIENTO_ESTE .FILL #1
RESULTADO .FILL #0
.END
; xC000 A xFDFF

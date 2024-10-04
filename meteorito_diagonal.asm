.ORIG x3000

LD R0, ASTEROIDE_INI ; coordenadas posicion asteroide
LD R2, ANCHO_PANTALLA ;	guarda desplazamientos a aplicarle a ASTEROIDE_INI
; R3	 desplazamientos maximos en cada direccion

LD R5, cien

ASTEROIDE_LOOP
	AND R3, R3, #0
	ADD R3, R3, #1
	JSR BORRAR_ASTEROIDE
	SUR_LOOP
		LD R2, ANCHO_PANTALLA
		ADD R0, R0, R2	; desplaza la posición de ASTEROIDE_INI un ANCHO_PANTALLA (128)
		ADD R3, R3, #-1
		BRp SUR_LOOP
	AND R3, R3, #0
	ADD R3, R3, #1
	ESTE_LOOP 
		LD R2, DESPLAZAMIENTO_ESTE
		ADD R0, R0, R2
		ADD R3, R3, #-1
		BRp ESTE_LOOP
	JSR DIBUJAR_ASTEROIDE
	JSR WAIT
	ADD R5, R5, #-1
	BRp ASTEROIDE_LOOP
	HALT




DIBUJAR_ASTEROIDE ; Pinta el asteroide desde la posicion guardada en R0
	ST R0, GUARDAR_R0
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
	RET 

WAIT
    LD R6, DELAY
	WAIT_LOOP
		ADD R6, R6, #-1
		BRp WAIT_LOOP
	RET

BORRAR_ASTEROIDE
	ST R0, GUARDAR_R0
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
	RET




HALT

GUARDAR_R0		.BLKW 1
ASTEROIDES		.BLKW 2

cien .FILL #100
ASTEROIDE_INI .FILL xC000
ASTEROIDE_2 .FILL xC080
ANCHO_PANTALLA .FILL #128 
ANCHO_PANTALLA_N .FILL #-128 

ROJO .FILL x7C00
BLACK .FILL x0000
DELAY .FILL #10000
MAX_ESTE .FILL #116 ; ASTEROIDE_INI + ANCHO_PANTALLA (xC000 + x80(128))
MAX_SUR .FILL #112			; #-15872
DESPLAZAMIENTO_ESTE .FILL #1
RESULTADO .FILL #0
.END
; xC000 A xFDFF
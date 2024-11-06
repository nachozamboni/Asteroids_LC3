.ORIG x3000
LD R0, DIRECCION
LD R1, VERDE
LD R2, ANCHO_PANTALLA

DIBUJO_AST_CHICO
STR R1, R0, #2
STR R1, R0, #3
STR R1, R0, #4
STR R1, R0, #5
ADD R0, R0, R2 ; salto de linea
STR R1, R0, #1
STR R1, R0, #6
ADD R0, R0, R2 ; salto de linea
STR R1, R0, #0
STR R1, R0, #7
ADD R0, R0, R2 ; salto de linea
STR R1, R0, #0
STR R1, R0, #7
ADD R0, R0, R2 ; salto de linea
STR R1, R0, #1
STR R1, R0, #7
ADD R0, R0, R2 ; salto de linea
STR R1, R0, #1
STR R1, R0, #2
STR R1, R0, #3
STR R1, R0, #7
ADD R0, R0, R2 ; salto de linea
STR R1, R0, #4
STR R1, R0, #5
STR R1, R0, #6


HALT
DIRECCION           .FILL xC000
ROJO                .FILL x7C00
VERDE               .FILL x03E0
ANCHO_PANTALLA      .FILL #128
.END

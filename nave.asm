.ORIG x3000    

LD R0, COLOR_NEGRO 
LD R1, PANTALLA_INICIO 
LD R2, #0
LD R3, TAMAÑO_PANTALLA  
LD R4, VALUE
LD R5, VALUE2
LD R6, POSICION

FONDO
STR R0, R1, #0       
ADD R1, R1, #1       
ADD R2, R2, #1       
ADD R3, R3, #-1      
BRp FONDO

JSR NAVE_ARRIBA

HALT

NAVE_ARRIBA
    LD R0, COLOR_BLANCO
    LD R1, POSICION
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #2
    STR R0, R1, #3
    STR R0, R1, #-1
    STR R0, R1, #-2
    STR R0, R1, #-3
    ADD R1, R1, R5
    STR R0, R1, #0
    STR R0, R1, #-1
    STR R0, R1, #-2
    STR R0, R1, #1
    STR R0, R1, #2
    ADD R1, R1, R5
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #-1
    ADD R1, R1, R5
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #-1
    ADD R1, R1, R5
    STR R0, R1, #0
    ADD R1, R1, R5
    STR R0, R1, #0
    
    RET

NAVE_ABAJO
    LD R0, COLOR_BLANCO
    LD R1, POSICION
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #2
    STR R0, R1, #3
    STR R0, R1, #-1
    STR R0, R1, #-2
    STR R0, R1, #-3
    ADD R1, R1, R4
    STR R0, R1, #0
    STR R0, R1, #-1
    STR R0, R1, #-2
    STR R0, R1, #1
    STR R0, R1, #2
    ADD R1, R1, R4
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #-1
    ADD R1, R1, R4
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #-1
    ADD R1, R1, R4
    STR R0, R1, #0
    ADD R1, R1, R4
    STR R0, R1, #0
    
    RET

NAVE_DERECHA

    LD R0, COLOR_BLANCO
    LD R1, POSICION
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #2
    STR R0, R1, #3
    STR R0, R1, #4
    STR R0, R1, #5
    ADD R1, R1, R5
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #2
    STR R0, R1, #3
    ADD R1, R1, R5
    STR R0, R1, #0
    STR R0, R1, #1
    ADD R1, R1, R5
    STR R0, R1, #0
    LD R1, POSICION
    ADD R1, R1, R4
    STR R0, R1, #0
    STR R0, R1, #1
    STR R0, R1, #2
    STR R0, R1, #3
    ADD R1, R1, R4
    STR R0, R1, #0
    STR R0, R1, #1
    ADD R1, R1, R4
    STR R0, R1, #0

    RET

NAVE_IZQUIERDA
    LD R0, COLOR_BLANCO
    LD R1, POSICION
    STR R0, R1, #0
    STR R0, R1, #-1
    STR R0, R1, #-2
    STR R0, R1, #-3
    STR R0, R1, #-4
    STR R0, R1, #-5
    ADD R1, R1, R5
    STR R0, R1, #0
    STR R0, R1, #-1
    STR R0, R1, #-2
    STR R0, R1, #-3
    ADD R1, R1, R5
    STR R0, R1, #0
    STR R0, R1, #-1
    ADD R1, R1, R5
    STR R0, R1, #0
    LD R1, POSICION
    ADD R1, R1, R4
    STR R0, R1, #0
    STR R0, R1, #-1
    STR R0, R1, #-2
    STR R0, R1, #-3
    ADD R1, R1, R4
    STR R0, R1, #0
    STR R0, R1, #-1
    ADD R1, R1, R4
    STR R0, R1, #0

    RET


; Constantes
COLOR_NEGRO       .FILL x0000
COLOR_BLANCO      .FILL x7FFF
PANTALLA_INICIO   .FILL xC000
POSICION          .FILL xDF40
TAMAÑO_PANTALLA   .FILL x3E00
VALUE             .FILL #128
VALUE2            .FILL #-128

.END

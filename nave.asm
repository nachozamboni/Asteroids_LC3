.ORIG x3000    

LD R0, COLOR_NEGRO 
LD R1, PANTALLA_INICIO 
LD R2, #0
LD R3, TAMAÑO_PANTALLA  

FONDO
STR R0, R1, #0       
ADD R1, R1, #1       
ADD R2, R2, #1       
ADD R3, R3, #-1      
BRp FONDO

LD R6, POSICION_INICIAL
JSR DRAW_NAVE              ; Dibujar nave en posicion incial

MAIN_LOOP
    JSR READ_INPUT         ; Leer la entrada del teclado
    JSR ANALIZAR_TECLA
    JSR DRAW_NAVE
    ADD R2, R0, #0         ; Guardo el movimiento anterior para saber hacia donde debe salir la bala en caso de disparar
    AND R0, R0, #0         ; Reinicio R0 
    BR MAIN_LOOP           ; Repetir el bucle principal

ANALIZAR_TECLA

    LD R3, up_key          ; Cargar la tecla 'w'
    ADD R3, R3, R0
    BRz MOVE_UP

    LD R3, down_key        ; Cargar la tecla 's'
    ADD R3, R3, R0
    BRz MOVE_DOWN

    LD R3, left_key        ; Cargar la tecla 'a'
    ADD R3, R3, R0
    BRz MOVE_LEFT

    LD R3, right_key       ; Cargar la tecla 'd'
    ADD R3, R3, R0
    BRz MOVE_RIGHT

    LD R3, shoot_key       ; Cargar la tecla 'r'
    ADD R3, R3, R0
    BRz SHOOT              ; EN ESTA VERSION DE NAVE.ASM ESTÁ HECHA LA LÓGICA DE DISPARO PERO NO COMPILA

    RET                    ; Si no es una tecla de movimiento, regresar

SHOOT
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    LD R3, up_key          ; Cargar la tecla 'w'
    ADD R3, R3, R2         ; Cargo movimiento anterior
    BRz SHOOT_UP

    LD R3, down_key        ; Cargar la tecla 's'
    ADD R3, R3, R2         ; Cargo movimiento anterior
    BRz SHOOT_DOWN

    LD R3, left_key        ; Cargar la tecla 'a'
    ADD R3, R3, R2         ; Cargo movimiento anterior
    BRz SHOOT_LEFT

    LD R3, right_key       ; Cargar la tecla 'd'
    ADD R3, R3, R2         
    BRz SHOOT_RIGHT

    ADD R4, R4, #1         ; Restaurar el puntero de pila
    LDR R7, R4, #-1        ; Recuperar el valor de R7 desde la pila
    RET

SHOOT_RIGHT
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    LD R1, COLOR_BLANCO    ; Cargar color blanco en R1
    LD R5, COLOR_NEGRO     ; Cargar color negro en R5
    LD R3, CONTADOR        ; Cargar el contador en R3 (255 disparos)
    ADD R2, R6, #0         ; Copiar la posición inicial desde R6 a R2

LOOP1 
    BRz END_LOOP           ; Si R3 es 0, salir del bucle

    STR R1, R2, #0         ; Pintar el pixel blanco en la posición R2 (bala actual)    
    STR R5, R2, #-1        ; Pintar el pixel anterior de negro (borrar)
    ADD R2, R2, #1         ; Mover la bala hacia la derecha (incrementar posición)

    ADD R3, R3, #-1        ; Decrementar el contador
    BR LOOP1                ; Saltar al inicio del bucle

SHOOT_LEFT
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    LD R1, COLOR_BLANCO    ; Cargar color blanco en R1
    LD R5, COLOR_NEGRO     ; Cargar color negro en R5
    LD R3, CONTADOR        ; Cargar el contador en R3 (255 disparos)
    ADD R2, R6, #0         ; Copiar la posición inicial desde R6 a R2

LOOP2
    BRz END_LOOP           ; Si R3 es 0, salir del bucle

    STR R1, R2, #0         ; Pintar el pixel blanco en la posición R2 (bala actual)    
    STR R5, R2, #1        ; Pintar el pixel anterior de negro (borrar)
    ADD R2, R2, #-1         ; Mover la bala hacia la izquierda (incrementar posición)
    
    ADD R3, R3, #-1        ; Decrementar el contador
    BR LOOP2                ; Saltar al inicio del bucle

SHOOT_UP
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    LD R1, COLOR_BLANCO    ; Cargar color blanco en R1
    LD R5, COLOR_NEGRO     ; Cargar color negro en R5
    LD R3, CONTADOR        ; Cargar el contador en R3
    LD R0, VALUE2
    ADD R2, R6, #0         ; Copiar la posición inicial desde R6 a R2

LOOP3 
    BRz END_LOOP           ; Si R3 es 0, salir del bucle

    STR R5, R0, #0         ; Pintar el pixel anterior de negro (borrar)
    ADD R2, R2, R0         ; Mover la bala hacia arriba (incrementar posición)
    STR R1, R2, #0         ; Pintar el pixel blanco en la posición R2 (bala actual)

    ADD R3, R3, #-1        ; Decrementar el contador
    BR LOOP3                ; Saltar al inicio del bucle

SHOOT_DOWN
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    LD R1, COLOR_BLANCO    ; Cargar color blanco en R1
    LD R5, COLOR_NEGRO     ; Cargar color negro en R5
    LD R3, CONTADOR        ; Cargar el contador en R3
    LD R0, VALUE
    ADD R2, R6, #0         ; Copiar la posición inicial desde R6 a R2

LOOP4 
    BRz END_LOOP           ; Si R3 es 0, salir del bucle

    STR R5, R0, #0         ; Pintar el pixel anterior de negro (borrar)
    ADD R2, R2, R0         ; Mover la bala hacia abajo (incrementar posición)
    STR R1, R2, #0         ; Pintar el pixel blanco en la posición R2 (bala actual)

    ADD R3, R3, #-1        ; Decrementar el contador
    BR LOOP4                ; Saltar al inicio del bucle

END_LOOP
    ADD R4, R4, #1         ; Restaurar el puntero de pila
    LDR R7, R4, #-1        ; Recuperar el valor de R7 desde la pila
    RET

DELAY
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila
    
    LD R1, delay
    
    DELAY_LOOP
    ADD R1, R1, #-1
    BRp DELAY_LOOP

    ADD R4, R4, #1         ; Restaurar el puntero de pila
    LDR R7, R4, #-1        ; Recuperar el valor de R7 desde la pila
    RET

MOVE_UP
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    LD R5, VALUE2
    ;ADD R1, R6, R5
    ADD R6, R6, R5
    JSR BORRAR_NAVE

    ADD R4, R4, #1         ; Restaurar el puntero de pila
    LDR R7, R4, #-1        ; Recuperar el valor de R7 desde la pila
    RET

MOVE_DOWN
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    LD R5, VALUE
    ADD R6, R6, R5
    JSR BORRAR_NAVE

    ADD R4, R4, #1         ; Restaurar el puntero de pila
    LDR R7, R4, #-1        ; Recuperar el valor de R7 desde la pila
    RET

MOVE_LEFT
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    ADD R6, R6, #-1
    JSR BORRAR_NAVE

    ADD R4, R4, #1         ; Restaurar el puntero de pila
    LDR R7, R4, #-1        ; Recuperar el valor de R7 desde la pila
    RET

MOVE_RIGHT
    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1        ; Ajustar el puntero de pila

    ADD R6, R6, #1
    JSR BORRAR_NAVE

    ADD R4, R4, #1         ; Restaurar el puntero de pila
    LDR R7, R4, #-1        ; Recuperar el valor de R7 desde la pila
    RET

READ_INPUT
    LDI R0, KBD_IS_READ
    ADD R0, R0, #0
    BRz EXIT_INPUT
    LDI R0, KBD_BUF       ; Guardar la tecla en el buffer
EXIT_INPUT
    RET                    ; Retornar

DRAW_NAVE
    ADD R1, R6, #0          ; Esto es para no modificar la posicion real de la nave al dibujarla
    LD R2, COLOR_BLANCO     ; (La posicion de la nave siempre está en R1)
    LD R3, COLOR_AZUL
    LD R4, COLOR_ROJO
    LD R5, VALUE2
    STR R4, R1, #0
    STR R3, R1, #1
    STR R3, R1, #-1
    STR R2, R1, #2
    STR R2, R1, #3
    STR R2, R1, #-2
    STR R2, R1, #-3
    ADD R1, R1, R5
    STR R3, R1, #0
    STR R3, R1, #1
    STR R3, R1, #2
    STR R3, R1, #-1
    STR R3, R1, #-2
    ADD R1, R1, R5
    STR R2, R1, #0
    STR R3, R1, #1
    STR R3, R1, #-1
    ADD R1, R1, R5
    STR R2, R1, #0
    LD R5, VALUE
    ADD R1, R1, R5
    ADD R1, R1, R5
    ADD R1, R1, R5
    ADD R1, R1, R5
    STR R3, R1, #0
    STR R3, R1, #1
    STR R3, R1, #2
    STR R3, R1, #-1
    STR R3, R1, #-2
    ADD R1, R1, R5
    STR R2, R1, #0
    STR R3, R1, #1
    STR R3, R1, #-1
    ADD R1, R1, R5
    STR R2, R1, #0
    RET

BORRAR_NAVE

    STR R7, R4, #-1        ; Guardar R7 en la pila (R6 es el puntero de pila)
    ADD R4, R4, #-1

    ADD R1, R6, #0          ; Copiar la posición de la nave en R1 para no modificarla
    LD R2, COLOR_NEGRO      ; Cargar el color negro en R2
    LD R5, VALUE2           ; Cargar el valor para avanzar a la siguiente fila en R5

    LD R3, NUM_FILAS        ; Número de filas de la nave
FILAS_LOOP
    LD R0, NUM_COLUMNAS     ; Número de columnas de la nave
COLUMNAS_LOOP
    STR R2, R1, #0          ; Pintar el píxel actual de negro
    ADD R1, R1, #1          ; Moverse a la siguiente columna (siguiente píxel horizontal)
    ADD R0, R0, #-1         ; Decrementar el contador de columnas
    BRp COLUMNAS_LOOP       ; Si hay más columnas, repetir el bucle de columnas

    ; Fin de la fila actual, volver al inicio de la siguiente fila
    ADD R1, R1, R5          ; Mover R1 a la siguiente fila
    ADD R3, R3, #-1         ; Decrementar el contador de filas
    BRp FILAS_LOOP          ; Si hay más filas, repetir el bucle de filas

    ADD R4, R4, #1         ; Restaurar el puntero de pila
    LDR R7, R4, #-1        ; Recuperar el valor de R7 desde la pila

    RET                      ; Retornar

; Constantes
NUM_FILAS .FILL 10          
NUM_COLUMNAS .FILL 10       
COLOR_NEGRO       .FILL x0000
COLOR_BLANCO      .FILL x7FFF
COLOR_AZUL        .FILL x001F
COLOR_ROJO        .FILL x7C00
PANTALLA_INICIO   .FILL xC000
POSICION_INICIAL  .FILL xDF40
TAMAÑO_PANTALLA   .FILL x3E00
VALUE             .FILL #128
VALUE2            .FILL #-128
shoot_key         .FILL #-114                   ; Tecla 'r' para disparar
up_key            .FILL #-119                   ; Tecla 'w' para subir
down_key          .FILL #-115                   ; Tecla 's' para bajar
left_key          .FILL #-97                    ; Tecla 'a' para mover a la izquierda
right_key         .FILL #-100                   ; Tecla 'd' para mover a la derecha
KBD_BUF           .FILL xFE02                   ; Buffer para almacenar la tecla presionada
KBD_IS_READ       .FILL xFE00
delay             .FILL #5000
CONTADOR          .FILL #254
BACKUP            .FILL x3500
.END

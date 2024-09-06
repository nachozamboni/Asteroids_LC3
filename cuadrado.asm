.ORIG x3000
    LD R0, center_pos      ; Cargar la posición inicial en el centro de la pantalla
    LD R1, white           ; Cargar el color blanco
    LD R2, negro           ; Cargar el color negro (para borrar)
    LD R3, row_width       ; Cargar el ancho de la pantalla (128 píxeles)
    LD R4, square_size     ; Cargar el tamaño del cuadrado (4 píxeles por lado)
    LEA R5, current_pos    ; Apuntar al almacenamiento de la posición actual
    STR R0, R5, #0         ; Guardar la posición inicial del cuadrado

MAIN_LOOP
    LDR R0, R5, #0         ; Cargar la posición actual
    JSR DRAW_SQUARE        ; Dibujar el cuadrado en la posición actual
    JSR READ_INPUT         ; Leer la entrada del teclado
    JSR MOVE_SQUARE        ; Mover el cuadrado basado en la entrada
    BR MAIN_LOOP           ; Repetir el bucle principal

DRAW_SQUARE
    ; Dibujar o borrar el cuadrado (dependiendo del valor en R1: blanco o negro)
    STR R1, R0, #0         ; Dibujar/borrar el primer píxel de la fila
    ADD R0, R0, #1         ; Mover a la derecha
    STR R1, R0, #0         ; Dibujar/borrar el segundo píxel
    ADD R0, R0, #1         ; Mover a la derecha
    STR R1, R0, #0         ; Dibujar/borrar el tercer píxel
    ADD R0, R0, #1         ; Dibujar/borrar el cuarto píxel

    ; Mover una fila hacia abajo (volver 4 píxeles atrás y sumar el ancho de la pantalla)
    ADD R0, R0, #-3        ; Volver a la primera columna de la fila actual
    ADD R0, R0, R3         ; Bajar a la siguiente fila

    ; Dibujar las siguientes filas del cuadrado
    ADD R4, R4, #-1        ; Decrementar el contador de filas
    BRp DRAW_SQUARE        ; Si quedan filas por dibujar, repetir
    RET                    ; Regresar al bucle principal

READ_INPUT
    GETC                   ; Leer una tecla del teclado
    ST R0, KBD_BUF         ; Guardar la tecla en el buffer
    RET                    ; Retornar

MOVE_SQUARE
    LD R0, KBD_BUF         ; Cargar la tecla presionada
    LDR R1, R5, #0         ; Cargar la posición actual del cuadrado

    ; Borrar el cuadrado en la posición actual antes de moverlo
    LD R1, negro
    JSR DRAW_SQUARE

    ; Mover el cuadrado en función de la tecla presionada
    LD R7, up_key          ; Cargar la tecla 'W'
    BRz MOVE_UP
    LD R7, down_key        ; Cargar la tecla 'S'
    BRz MOVE_DOWN
    LD R7, left_key        ; Cargar la tecla 'A'
    BRz MOVE_LEFT
    LD R7, right_key       ; Cargar la tecla 'D'
    BRz MOVE_RIGHT
    RET                    ; Si no es una tecla de movimiento, regresar

MOVE_UP
    LD R7, neg_row_width    ; Cargar el valor negativo del ancho de la pantalla
    ADD R1, R1, R7          ; Mover hacia arriba
    BR MOVE_END

MOVE_DOWN
    LD R7, row_width        ; Cargar el valor positivo del ancho de la pantalla
    ADD R1, R1, R7          ; Mover hacia abajo
    BR MOVE_END

MOVE_LEFT
    ADD R1, R1, #-1         ; Mover a la izquierda
    BR MOVE_END

MOVE_RIGHT
    ADD R1, R1, #1          ; Mover a la derecha
    BR MOVE_END

MOVE_END
    STR R1, R5, #0          ; Guardar la nueva posición del cuadrado
    LD R1, white            ; Cargar el color blanco para dibujar el cuadrado
    JSR DRAW_SQUARE         ; Dibujar el cuadrado en la nueva posición
    RET                     ; Regresar al bucle principal

; Constantes y datos
white .FILL xFFFF           ; Color blanco
negro .FILL x0000           ; Color negro (para borrar)
center_pos .FILL xE03C      ; Posición inicial en el centro de la pantalla
row_width .FILL #128        ; Ancho de la pantalla (128 píxeles)
neg_row_width .FILL #-128   ; Valor negativo del ancho de la pantalla para mover hacia arriba
square_size .FILL #4        ; Tamaño del cuadrado (4 filas)
up_key .FILL x77            ; Tecla 'W' para subir
down_key .FILL x73          ; Tecla 'S' para bajar
left_key .FILL x61          ; Tecla 'A' para mover a la izquierda
right_key .FILL x64         ; Tecla 'D' para mover a la derecha
KBD_BUF .BLKW 1             ; Buffer para almacenar la tecla presionada
current_pos .BLKW 1         ; Posición actual del cuadrado
.END

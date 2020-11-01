;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  file name   : lc4_stdio.asm                          ;
;  author      : Vignesh Valliyur
;  description : LC4 Assembly subroutines that call     ;
;                call the TRAPs in os.asm (the wrappers);
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; WRAPPER SUBROUTINES FOLLOW ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.DATA
.ADDR x2000
.FILL x0001

.CODE
.ADDR x0010    ;; this code should be loaded after line 10
               ;; this is done to preserve "USER_START"
               ;; subroutine that calls "main()"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_PUTC Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_putc

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0       ;; 
    
		
	;; FUNCTION BODY ;;
    LDR R0, R6, #3       ;; Store ASCII char 'A' in R0
	
	TRAP x01        ; R0 must be set before TRAP_PUTC is called
	
	;; EPILOGUE ;; 
    ; TRAP_PUTC has no return value, so nothing to copy back to stack
    ADD R6, R6, #3             ;; decrease stack - now just below RV
    LDR R5, R6, #-3            ;; restore base pointer
    LDR R7, R6, #-2            ;; Restore R7 = PC
RET



;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_PUTS Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_puts

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0       ;; 
    
		
	;; FUNCTION BODY ;;
    LDR R0, R6, #3      ;; fill up RO with address where char0 is on stack
	TRAP x02            ; R0 must be set before TRAP_PUTC is called
	
	;; EPILOGUE ;; 
    ; TRAP_PUTC has no return value, so nothing to copy back to stack
    ADD R6, R6, #3             ;; decrease stack - now just below RV
    LDR R5, R6, #-3            ;; restore base pointer
    LDR R7, R6, #-2            ;; Restore R7 = PC
RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_GETC Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_getc

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0       
    
    
    
		
	;; FUNCTION BODY ;;
		; TODO: TRAP_GETC doesn't require arguments!
		
	TRAP x00        ; Call's TRAP_GETC 
                    ; R0 will contain ascii character from keyboard
                    ; you must copy this back to the stack
	
	;; EPILOGUE ;; 
	ADD R6, R6, #3             ;; decrease stack - now just below RV
    LDR R5, R6, #-3            ;; restore base pointer
    STR R0, R6, #-1
    LDR R7, R6, #-2            ;; Restore R7 = PC

RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_TIMER Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_timer

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0       
    
    LDR R0, R6, #3       ;; R0 with argument 
    
		
	;; FUNCTION BODY ;;
		; TODO: TRAP_GETC doesn't require arguments!
		
	TRAP x03        
	
	;; EPILOGUE ;; 
	ADD R6, R6, #3             ;; decrease stack - now just below RV
    LDR R5, R6, #-3            ;; restore base pointer
    LDR R7, R6, #-2            ;; Restore R7 = PC

RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_GETC_TIMER Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_getc_timer

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0       
    
    LDR R0, R6, #3       ;; R0 with argument 
    
		
	;; FUNCTION BODY ;;

		
	TRAP x04        
	
	;; EPILOGUE ;; 
	ADD R6, R6, #3             ;; decrease stack - now just below RV
    LDR R5, R6, #-3            ;; restore base pointer
    STR R0, R6, #-1            ;; store the ascii value
    LDR R7, R6, #-2            ;; Restore R7 = PC

RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_DRAW_PIXEL Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_draw_pixel

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0       
   
		
	;; FUNCTION BODY ;;
    LDR R0, R6, #3       ;; R0 with argument
    LDR R1, R6, #4       ;; R1 with argument
    LDR R2, R6, #5       ;; R2 with argument

		
	TRAP x05        
	
	;; EPILOGUE ;; 
	ADD R6, R6, #3             ;; decrease stack - now just below RV
    LDR R5, R6, #-3            ;; restore base pointer
    LDR R7, R6, #-2            ;; Restore R7 = PC

RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_DRAW_RECT Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_draw_rect

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0
    
    ;; we use R6 in the trap, so we need to store the value
    CONST R0, x00        ;; address to store R6 in
    HICONST R0, x20      ;; address to store R6 in
    
    STR R6, R0, #00      ;; store R6 for later   
    
		
	;; FUNCTION BODY ;;
    
    LDR R0, R6, #3       ;; R0 arguments
    LDR R1, R6, #4       ;; R1 arguments
    LDR R2, R6, #5       ;; R2 arguments
    LDR R3, R6, #6       ;; R3 arguments
    LDR R4, R6, #7       ;; R4 arguments
    
	TRAP x07        
	
	;; EPILOGUE ;; 
    CONST R0, x00        ;; address to store R6 in
    HICONST R0, x20      ;; address to store R6 in
    LDR R6, R0, #0       ;; retrieve R6 
    
	ADD R6, R6, #3       ;; decrease stack - now just below RV
    LDR R5, R6, #-3      ;; restore base pointer
    LDR R7, R6, #-2      ;; Restore R7 = PC

RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_DRAW_SPRITE Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_draw_sprite

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0
    
    ;; we use R6 in the trap, so we need to store the value
    CONST R0, x00        ;; address to store R6 in
    HICONST R0, x40      ;; address to store R6 in
    
    STR R6, R0, #00      ;; store R6 for later   
    
		
	;; FUNCTION BODY ;;
    
    LDR R0, R6, #3       ;; R0 arguments
    LDR R1, R6, #4       ;; R1 arguments
    LDR R2, R6, #5       ;; R2 arguments
    LDR R3, R6, #6       ;; R3 arguments
    
	TRAP x08       
	
	;; EPILOGUE ;; 
    CONST R0, x00        ;; address to store R6 in
    HICONST R0, x40      ;; address to store R6 in
    LDR R6, R0, #0       ;; retrieve R6 
    
	ADD R6, R6, #3       ;; decrease stack - now just below RV
    LDR R5, R6, #-3      ;; restore base pointer
    LDR R7, R6, #-2      ;; Restore R7 = PC

RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_LFSR_SET_SEED Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_lfsr_set_seed

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0
      
    
		
	;; FUNCTION BODY ;;
    
    LDR R0, R6, #3       ;; R0 arguments

    
	TRAP x0C       
	
	;; EPILOGUE ;; 
    
	ADD R6, R6, #3       ;; decrease stack - now just below RV
    LDR R5, R6, #-3      ;; restore base pointer
    LDR R7, R6, #-2      ;; Restore R7 = PC

RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_LFSR Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_lfsr

	;; PROLOGUE ;;
    STR R7, R6, #-2	     ;; save return address
	STR R5, R6, #-3	     ;; save base pointer
	ADD R6, R6, #-3      ;; update top of stack
	ADD R5, R6, #0
      
    
		
	;; FUNCTION BODY ;;
    
    LDR R0, R6, #3       ;; R0 arguments

    
	TRAP x0B       
	
	;; EPILOGUE ;; 
    
	ADD R6, R6, #3       ;; decrease stack - now just below RV
    LDR R5, R6, #-3      ;; restore base pointer
    STR R0, R6, #-1
    LDR R7, R6, #-2      ;; Restore R7 = PC

RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_RESET_VMEM Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_reset_vmem

    ;; STUDENTS - DON'T edit these wrappers - they must be here to get PennSim to work in double-buffer mode
    ;;          - DON'T use their prologue or epilogue's as models - use the slides!!
  
    ;; prologue
	ADD R6, R6, #-2
	STR R5, R6, #0
	STR R7, R6, #1
	;; no arguments
    
	TRAP x09
	;; epilogue
	LDR R5, R6, #0
	LDR R7, R6, #1
	ADD R6, R6, #2
RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_BLT_VMEM Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_blt_vmem

    ;; STUDENTS - DON'T edit these wrappers - they must be here to get PennSim to work in double-buffer mode
    ;;          - DON'T use their prologue or epilogue's as models - use the slides!!

	;; prologue
	ADD R6, R6, #-2
	STR R5, R6, #0
	STR R7, R6, #1
	;; no arguments
	TRAP x0A
	;; epilogue
	LDR R5, R6, #0
	LDR R7, R6, #1
	ADD R6, R6, #2
RET

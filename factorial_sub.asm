;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  file name   : factorial_sub.asm                      ;
;  author      : Vignesh Valliyur                       ;
;  description : LC4 Assembly subroutine to compute the ;
;                factorial of a number                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;

;; TO-DO:
;; 1) Open up the codio assignment where you created the factorial subroutine (in a separate browswer window)
;; 2) In that window, open up your working factorial_sub.asm file:
;;    -select everything in the file, and "copy" this content (Conrol-C) 
;; 3) Return to the current codio assignment, paste the content into this factorial_sub.asm 
;;    -now you can use the factorial_sub.asm from your last HW in this HW
;; 4) Save the updated factorial_sub.asm file


    
.FALIGN
SUB_FACTORIAL                  ; your subroutine goes here

;; prologue 
    STR R7, R6, #-2	           ;; save return address
	STR R5, R6, #-3	           ;; save base pointer
	ADD R6, R6, #-3            ;; update R6 to point to top of stack
	ADD R5, R6, #0             ;; update R5 to point to base pointer
     
    LDR R0, R6, #3             ;; R0 = 5, this calculates the fact & loop
    
    
;; function body    

    CMPI R0, #0                ; sets NZP (A - 0)
    BRn EDGE_CASE_LABEL
    CMPI R0, #7                ; sets NZP (A - 7)
    BRp EDGE_CASE_LABEL
    ADD R1, R0, #0             ; B = A
    
LOOP
    CMPI R0, #1                ; sets NZP (A - 1)
    BRnz END_SUB_FACTORIAL_NEW ; test NZP (was z or n - jump to label)    
    ADD R0, R0, #-1            ; A = A - 1
    MUL R1, R1, R0             ; B = B * A
    BRnzp LOOP                 ; always go to loop 
END_SUB_FACTORIAL_NEW          ; end subroutine

;; epilogue

    ADD R7, R1, #0             ;; store return value in R7
    ADD R6, R6, #3             ;; decrease stack - now just below RV
    STR R7, R6 , #-1           ;; store value in RV spot
    LDR R5, R6, #-3            ;; restore base pointer
    LDR R7, R6, #-2            ;; Restore R7 = PC
    RET                        ; return program counter
    
EDGE_CASE_LABEL

;; this is also the part of the epilogue
    CONST R7, #-1
    ADD R6, R6, #3             ;; decrease stack - now just below RV
    STR R7, R6 , #-1           ;; store value in RV spot
    LDR R5, R6, #-3            ;; restore base pointer
    LDR R7, R6, #-2            ;; Restore R7 = PC
    RET                        ; return program counter

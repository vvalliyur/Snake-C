/*********************************************************
 * file name   : problem3.c                              *
 * author      : Vignsh Valliyur
 * description : C program to call LC4-Assembly TRAP_PUTS
 *               TRAP_GETC, TRAP_PUTC, to read chars
 *               from the keyboard & output them         *
 *********************************************************
*
*/

int main() {
    
    int x = 20;
    int y = 40;
    int width = 20;
    int height = 30;
    int color = 255;
    
    lc4_draw_rect (x, y, width, height, color);

	/*  TODO:
		create a loop that will:
			read a character from the keyboard (using lc4_getc)
			echo that character to the ASCII display (using lc4_putc)
		end loop - once the "enter" key is pressed
	*/
    


	return (0) ;
}

/********************************************************
 * file name   : lc4_stdio.h                            *
 * author      : Vignesh Valliyur
 * description : C header file to allow compiler        *
 *               to link to files in lc4_stdio.obj      *
 ********************************************************
*
*/

typedef int lc4int;
typedef unsigned int lc4uint;
typedef char lc4char;

#define TRUE  1
#define FALSE 0

#define NULL (void*)0

#define BLACK  0x0000U
#define WHITE  0xFFFFU
#define GRAY8  0x2108U
#define YELLOW 0x7FF0U
#define RED    0x7C00U
#define ORANGE 0xF600U
#define BLUE   0x0033U
#define GREEN  0x3300U
#define CYAN   0x0770U

lc4int lc4_getc_timer(lc4int duration);
void lc4_puts(lc4uint *str);

void lc4_draw_rect(lc4int x, lc4int y, lc4int width, lc4int height, lc4uint color);
void lc4_draw_sprite(lc4int x, lc4int y, lc4uint color, lc4uint *sprite);

/* void lc4_halt(); */
void lc4_reset_vmem();
void lc4_blt_vmem();

lc4uint lc4_lfsr();

#include <stdio.h>

// asmhead.nas
struct BOOTINFO {
	char cyls, leds, vmode, reserve;
	short scrnx, scrny;
	char* vram;
};
#define ADR_BOOTINFO	0x00000FF0

// naskfunc.nas
void io_hlt();
void io_cli();
void io_sti();
void io_stihlt();
int io_in8(int port);
void io_out8(int port, int data);
int io_load_eflags();
void io_store_eflags(int eflags);
void load_gdtr(int limit, int addr);
void load_idtr(int limit, int addr);
void asm_inthandler21();
void asm_inthandler2c();
int load_cr0();
void store_cr0(int cr0);
unsigned int memtest_sub(unsigned int start, unsigned int end);

// bootpack.c
unsigned int memtest(unsigned int start, unsigned int end);

// graphic.c
void init_screen8(char* vram, int xsize, int ysize);
void init_palette();
void putfont8(char* vram, int xsize, int x, int y, char c, char* font);
void putfonts8_asc(char* vram, int xsize, int x, int y, char c, unsigned char* s);
void init_mouse_cursor8(char* mouse, char bc);
void putblock8_8(char* vram, int vxsize, int pxsize, int pysize, int px0, int py0, char* buf, int bxsize);
void boxfill8(unsigned char* vram, int xsize, unsigned char c, int x0, int y0, int x1, int y1);
void set_palette(int start, int end, unsigned char *rgb);

#define COL8_BLACK			0
#define	COL8_LIGHT_RED		1
#define	COL8_LIGHT_GREEN	2
#define	COL8_LIGHT_YELLOW	3
#define	COL8_LIGHT_BLUE		4
#define	COL8_LIGHT_PURPLE	5
#define	COL8_LIGHT_SKYBLUE	6
#define	COL8_WHITE			7
#define	COL8_LIGHT_GRAY		8
#define	COL8_DARK_RED		9
#define	COL8_DARK_GREEN		10
#define	COL8_DARK_YELLOW	11
#define	COL8_DARK_BLUE		12
#define	COL8_DARK_PURPLE	13
#define	COL8_DARK_SKYBLUE	14
#define	COL8_DARK_GRAY		15

// dsctbl.c
struct SEGMENT_DESCRIPTOR {
	short limit_low, base_low;
	char base_mid, access_right;
	char limit_high, base_high;
};

struct GATE_DESCRIPTOR {
	short offset_low, selector;
	char dw_count, access_right;
	short offset_high;
};

void init_gdtidt();
void set_segmdesc(struct SEGMENT_DESCRIPTOR* sd, unsigned int limit, int base, int ar);
void set_gatedesc(struct GATE_DESCRIPTOR* gd, int offset, int selector, int ar);

#define ADR_IDT			0x0026F800
#define LIMIT_IDT		0x000007FF
#define ADR_GDT			0x00270000
#define LIMIT_GDT		0x0000FFFF
#define ADR_BOTPAK		0x00280000
#define LIMIT_BOTPAK	0x0007FFFF
#define AR_DATA32_RW	0x4092
#define AR_CODE32_ER	0x409A
#define AR_INTGATE32	0x008E

// int.c
void init_pic();

#define PIC0_ICW1	0x0020
#define PIC0_OCW2	0x0020
#define PIC0_IMR	0x0021
#define PIC0_ICW2	0x0021
#define PIC0_ICW3	0x0021
#define PIC0_ICW4	0x0021
#define PIC1_ICW1	0x00A0
#define PIC1_OCW2	0x00A0
#define PIC1_IMR	0x00A1
#define PIC1_ICW2	0x00A1
#define PIC1_ICW3	0x00A1
#define PIC1_ICW4	0x00A1

// fifo.c
struct FIFO8 {
	unsigned char* buf;
	int p, q, size, free, flags;
};

void fifo8_init(struct FIFO8* fifo, int size, unsigned char* buf);
int fifo8_put(struct FIFO8* fifo, unsigned char data);
int fifo8_get(struct FIFO8* fifo);
int fifo8_status(struct FIFO8* fifo);

// keyboard.c
#define PORT_KEYDAT				0x0060
#define PORT_KEYCMD				0x0064

extern struct FIFO8 keyfifo;

void inthandler21(int* esp);
void wait_KBC_sendready();
void init_keyboard();

// mouse.c
struct MOUSE_DEC {
	unsigned char buf[3], phrase;
	int x, y, btn;
};

extern struct FIFO8 mousefifo;

void inthandler2c(int* esp);
void enable_mouse(struct MOUSE_DEC* mdec);
int mouse_decode(struct MOUSE_DEC* mdec, unsigned char dat);

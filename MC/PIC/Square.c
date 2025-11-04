#include <p18f4550.h>
#include "vector_relocate.h"

void timer_isr(void);
extern void _startup(void);

#pragma code RESET_INTERRUPT_VECTOR = 0x1000
void reset(void) {
    _asm
        goto _startup
    _endasm
}

#pragma code
#pragma code HIGH_INTERRUPT_VECTOR = 0x1008
void high_ISR(void) {
    _asm
        goto timer_isr
    _endasm
}

#pragma code

#pragma interrupt timer_isr
void timer_isr(void) {
    TMR0H = 0X6D;
    TMR0L = 0X82;
    PORTDbits.RD0 = ~PORTDbits.RD0;
    INTCONbits.TMR0IF = 0;
}

void main() {
    INTCON2bits.RBPU = 0;
    ADCON1 = 0x0F;
    TRISD = 0;
    PORTD = 0;
    T0CON = 0x03;
    TMR0H = 0x00;
    TMR0L = 0x00;
    INTCONbits.GIE = 1;
    T0CONbits.TMR0ON = 1;
    while (1);
}

void delay_ms(unsigned int time) {
    unsigned int i, j;
    for (i = 0; i < time; i++)
        for (j = 0; j < 710; j++);
}
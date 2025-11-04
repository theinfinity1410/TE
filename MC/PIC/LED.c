#include <p18f4550.h>
#include "vector_relocate.h"

#define lrbit PORTBbits.RB1
#define rlbit PORTBbits.RB0
#define buzzer PORTCbits.RC2
#define relay PORTDbits.RD7

void msdelay(unsigned int time);

void main() {
    unsigned char i, val = 0;
    INTCON2bits.RBPU = 0;
    ADCON1 = 0x0F;
    TRISBbits.RB0 = 1;
    TRISBbits.RB1 = 1;
    TRISDbits.TRISD7 = 0;
    TRISCbits.TRISC2 = 0;
    TRISA = 0x00;
    PORTA = 0x00;
    buzzer = 0;
    relay = 0;
    while (1){
        if (lrbit == 0) {
            val = 1;
        }
        if (rlbit == 0) {
            val = 2;
        }
        if (val == 1) {
            buzzer = 1;
            relay = 1;
            PORTA = 0x20;
            msdelay(50);
            for (i = 0; i < 8; i++) {
                PORTA = PORTA >> 1;
                msdelay(50);
            }
        }
        if (val == 2) {
            buzzer = 0;
            relay = 0;
            PORTA = 0x01;
            msdelay(50);
            for (i = 0; i < 8; i++) {
                PORTA = PORTA << 1;
                msdelay(50);
            }
        }
    }
}

void msdelay(unsigned int time) {
    unsigned int i, j;
    for (i = 0; i < time; i++)
        for (j = 0; j < 710; j++);
}
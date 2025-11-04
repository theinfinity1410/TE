#include <p18f4550.h>
#include "vector_relocate.h"
void myMsDelay (unsigned int time) // Definition of delay subroutine
{
    unsigned int i, j;
    for (i = 0; i < time; i++) // Loop for itime
        for (j = 0; j < 710; j++); // Calibrated for a 1 ms delay in MPLAB
}
void main()
{
    TRISCbits.TRISC2 = 0 ;
    TRISD=0;
    PR2=0xBA;
    CCP1CON = 0x0C;
    T2CON = 0x07;
    PORTDbits.RD5 = 1 ;
    PORTDbits.RD6 = 0 ;
    while(1) // Endless Loop
    {
    // ----------Duty Cycle 80%-----------
        CCP1CONbits.DC1B0 = 0;
        CCP1CONbits.DC1B1 = 0;
        CCPR1L = 0x96;
        myMsDelay(2000);
        // -----------------------------------
        // ----------Duty Cycle 60%-----------
        CCP1CONbits.DC1B0 = 0;
        CCP1CONbits.DC1B1 = 1;
        CCPR1L = 0x70;
        myMsDelay(2000);
        // -----------------------------------
        // ----------Duty Cycle 40%-----------
        //CCP1CONbits.DC1B0 = 0;
        //CCP1CONbits.DC1B1 = 0;
        //CCPR1L = 0x4B;
        //myMsDelay(2000);
        // -----------------------------------
        // ----------Duty Cycle 20%-----------
        //CCP1CONbits.DC1B0 = 0;
        //CCP1CONbits.DC1B1 = 1;
        //CCPR1L = 0x25;
        //myMsDelay(2000);
        // -----------------------------------
    }
}
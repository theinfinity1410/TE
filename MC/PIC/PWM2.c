#include <p18f4550.h>
#include "vector_relocate.h"

#define lsb1 CCP1CONbits.DC1B0
#define lsb2 CCP1CONbits.DC1B1
#define pwm CCPR1L
#define cw PORTDbits.RD5
#define acw PORTDbits.RD6

void msdelay(unsigned int time){
	unsigned int i,j;
	for(i=0;i<time;i++){for(j=0;j<710;j++){}}
}

void setPWM(unsigned int per){
	lsb1 = 0;
	lsb2 = 0;
	if(per == 20) pwm = 0x25;
	if(per == 40) pwm = 0x4B;
	if(per == 60) pwm = 0x70;
	if(per == 80) pwm = 0x96;
	msdelay(2000);
}

void main(){
	TRISCbits.TRISC2 = 0;
	TRISD = 0;
	PR2 = 0xBA;
	CCP1CON = 0x0C;
	T2CON = 0x07;
	cw = 1;
	acw = 0;
	while(1){
		setPWM(20);
		setPWM(40);
		setPWM(60);
		setPWM(80);
	}
}

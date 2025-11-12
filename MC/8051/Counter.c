#include <reg51.h>

void msdelay(unsigned int time);
void a2z(void);
void hex(void);
void bcd(void);
void led(void);

void msdelay(unsigned int time){
	unsigned int i,j;
	for(i=0;i<time;i++){for(j=0;j<1275;j++){}}
}

void main(){
	int x = 1;
	switch(x){
		case 1:
			a2z();
			break;
		case 2:
			hex();
			break;
		case 3:
			bcd();
			break;
		case 4:
			led();
			break;
	}
}

void a2z(void){
	unsigned char i;
	P1 = 0x00;
	while(1){
		for(i=0x41;i<=0x5A;i++){
			P1 = i;
			msdelay(1000);
		}
	}
}

void hex(void){
	unsigned char i;
	P1 = 0x00;
	while(1){
		for(i=0x00;i<=0xFF;i++){
			P1 = i;
			msdelay(1000);
		}
	}
}

void bcd(void){
	unsigned char bcd = 0x00;
	while(1){
		P1 = bcd;
		msdelay(1000);
		bcd++;
		if((bcd & 0x0F) > 0x09) bcd += 0x06;
		if(bcd > 0x99) bcd = 0x00;
	}
}

void led(void){
	P1 = 0x00;
	while(1){
		P1 = 0x00;
		msdelay(1000);
		P1 = 0xFF;
		msdelay(1000);
	}
}
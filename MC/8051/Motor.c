#include <reg51.h>

void msdelay(unsigned int time);
void cw(void);
void acw(void);
void angle(unsigned int k);

void msdelay(unsigned int time){
	unsigned int i,j;
	for(i=0;i<time;i++){for(j=0;j<1275;j++){}}
}

void main(){
	int x = 1;
	switch(x){
		case 1:
			cw();
			break;
		case 2:
			acw();
			break;
		case 3:
			angle(3);
			break;
	}
}

void cw(void){
	while(1){
		P1 = 0x03;
		msdelay(50);
		P1 = 0x09;
		msdelay(50);
		P1 = 0x0C;
		msdelay(50);
		P1 = 0x06;
		msdelay(50);
	}
}

void acw(void){
	while(1){
		P1 = 0x06;
		msdelay(50);
		P1 = 0x0C;
		msdelay(50);
		P1 = 0x09;
		msdelay(50);
		P1 = 0x03;
		msdelay(50);
	}
}

void angle(unsigned int k){
	unsigned int i;
	for(i=0;i<k;i++){
		P1 = 0x03;
		msdelay(50);
		P1 = 0x09;
		msdelay(50);
		P1 = 0x0C;
		msdelay(50);
		P1 = 0x06;
		msdelay(50);
	}
}
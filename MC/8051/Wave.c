#include <reg51.h>

void msdelay(unsigned int time);
void square(void);
void triangle(void);
void sine(void);

void msdelay(unsigned int time){
	unsigned int i,j;
	for(i=0;i<time;i++){for(j=0;j<1275;j++){}}
}

void main(){
	int x = 1;
	switch(x){
		case 1:
			square();
			break;
		case 2:
			triangle();
			break;
		case 3:
			sine();
			break;
	}
}

void square(){
	while(1){
		P1 = 0x00;
		msdelay(50);
		P1 = 0xFF;
		msdelay(50);
	}
}

void triangle(){
	unsigned int k;
	while(1){
		for(k=0x00;k<=0xFF;k++){
			P1 = k;
			msdelay(10);
		}
		for(k=0xFF;k>=0x00;k--){
			P1 = k;
			msdelay(10);
		}
	}
}

void sine(){
	unsigned char samps[12] = {128,192,238,255,238,192,128,64,17,0,17,64};
	unsigned char i;
	while(1){
		for(i=0;i<12;i++){
			P1 = samps[i];
			msdelay(20);
		}
	}
}
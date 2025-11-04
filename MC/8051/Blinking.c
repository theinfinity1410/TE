#include <reg51.h>
void msdelay(unsigned int);
void main (void){
    while(1){
        P1 = 0x55;
        msdelay(50000);
        P1=0xAA;
        msdelay(50000);
    }
}
void msdelay(unsigned int itime){
    unsigned int i,j;
    for(i=0;i<itime;i++){
        for(j=0;j<1275;j++){
        }
    }
}
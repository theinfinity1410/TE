#include <reg51.h>
void msdelay(unsigned int);
void main (void){
    unsigned int z;
    while(1){
        P1=0x80;
        for(z=0;z<9;z++){
            msdelay(50000);
            P1=P1>>1;
        }
    }
}
void msdelay(unsigned int itime){
    unsigned int i,j;
    for(i=0;i<itime;i++){
        for(j=0;j<1275;j++){
        }
    }
}
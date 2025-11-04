#include <reg51.h>
void msdelay(unsigned int);
void main (void){
    unsigned int z;
    for(z=0;z<=255;z++){
        msdelay(100);
        P1=z;
    }
}
void msdelay ( unsigned int itime) {
    unsigned int i,j;
    for(i = 0 ;i < itime ; i++){
        for(j = 0 ; j<1275 ; j++){
        }
    }
}
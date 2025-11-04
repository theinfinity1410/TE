#include <reg51.h>
void msdelay(unsigned int);
void main (void){
    unsigned int x,y;
    for(x=0;x<=9;x++){
        for(y=0;y<=9;y++){
            msdelay(5000);
            P1=(x<<4)|ys;
        }
    }
}
void msdelay(unsigned int itime) {
    unsigned int i,j;
    for(i = 0 ;i < itime ; i++){
        for(j = 0 ; j<1275 ; j++){
        }
    }
}
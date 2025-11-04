#include <reg51.h>
void main (void){
    unsigned int k,l;
    while(1){
        for(k=0;k<=255;k++){
            P1=k;
        }
        for(l=255;l>0;l--){
            P1=l;
        }
    }
}
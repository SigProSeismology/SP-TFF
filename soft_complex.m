function x = soft_complex(z,T) 
az = abs(z) ;
x = max(az-T,0)./(max(az-T,0)+T).*z;
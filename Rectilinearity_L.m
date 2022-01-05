function F_A = Rectilinearity_L(SEMI,alpha,beta)
A= zeros(size(SEMI,2),size(SEMI,3)); 
F_A=0*A;
for i = 1 : size(A,1)
    for j = 1 : size(A,2)
        A(i,j)=1-(SEMI(11,i,j)+SEMI(12,i,j))/SEMI(10,i,j);
        if isnan(A(i,j)), A(i,j)=0; end
        if  A(i,j)>=-1 && A(i,j) < alpha
          F_A(i,j)=1;
        elseif A(i,j) >= alpha && A(i,j)<=beta
            F_A(i,j)=cos(pi*(A(i,j)-alpha)/(2*(beta-alpha)));
        else
           F_A(i,j)=0  ;
        end
    end
end


b=1;

function F_A = Directivity_R(majo,base1,base2,alpha,beta,ind)
A= zeros(size(majo,2),size(majo,3));  F_A=0*A;
for i = 1 : size(A,1)
    for j = 1 : size(A,2)
        A(i,j)=sqrt((base1*majo(:,i,j))^2+(base2*majo(:,i,j))^2);%(SEMI(11,i,j)+SEMI(12,i,j))/SEMI(10,i,j);
    end
end
A=A/max(max(A));
for i = 1 : size(A,1)
    for j = 1 : size(A,2)
       % A(i,j)=abs(base*majo(:,i,j));%(SEMI(11,i,j)+SEMI(12,i,j))/SEMI(10,i,j);
        if  A(i,j) < alpha
          F_A(i,j)=1;
        elseif A(i,j) >= alpha && A(i,j)<=beta
            F_A(i,j)=cos(pi*(A(i,j)-alpha)/(2*(beta-alpha)));
        else
           F_A(i,j)=0  ;
        end
    end
end

F_A(:,1:ind)=1;
b=1;

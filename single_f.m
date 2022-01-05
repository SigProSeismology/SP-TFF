function [corr] = single_f(x1,x2)
% Compute cross correlation 
X1=fft(x1);
X2=fft(x2);
len=length(X1); 
corr2=ifft(X1.*conj(X2));
temp1=0*X1;  temp2=0*X2; corr=zeros(ceil(len/2),1);
for i=1:ceil(len/2)
    if i==1
        temp1(i)=X1(i);  temp2(i)=X2(i);
    else
        temp1(i)=X1(i);  temp2(i)=X2(i);  temp1(len-i+2)=X1(len-i+2);    temp2(len-i+2)=X2(len-i+2);
    end
    cor=ifft(temp1.*conj(temp2));
    corr(i)=real(cor(1));
    temp1=0*X1; temp2=0*X2;
end
% % 
% l=ceil(len/2);
% aaa=abs(X1.*conj(X2)); 
% %sum(aaa(1:l));
% W=abs(aaa(1:l))/sum(abs(aaa(1:l)));
% corr22=W*corr2(1);
% % 
%  
%  close all
%  subplot 411;  plot(corr(1:l))
%  subplot 412;  plot(abs(X1(1:l)))
%  subplot 413;  plot(abs(X2(1:l)))
%  subplot 414;    plot(aaa(1:l));
%   figure
%   plot(corr22-corr)
% 
% plot(max(aaa(1:l))*corr(1:l)/max(corr(1:l))-aaa(1:l))



a=1;

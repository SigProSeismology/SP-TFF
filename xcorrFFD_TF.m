function [C_cor_tf] = xcorrFFD_TF(X1,X2)
s=100;
[TFR1]=STFT(X1,s);[TFR2]=STFT(X2,s);
TFR1=fft(X1).'; TFR2=fft(X2).';
C_cor_tf=zeros(ceil(length(TFR1)/2),length(TFR1));
for i=1:1% 1:length(TFR1)
    i
    temp=xcorrFFD_single(TFR1(:,i),TFR2(:,i));
    C_cor_tf(:,i)=temp;
end    
imagesc(abs(TFR1))
figure
imagesc(abs(C_cor_tf))
a=1;

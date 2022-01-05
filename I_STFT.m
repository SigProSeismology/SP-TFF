function [recx,recy,recz]=I_STFT(tfx,tfy,tfz,s)
% N = length(tfx) ;  G = forw(N,s) ;
% A = @(e1) G*reshape( real(ifft(reshape(e1,N,N))) ,N^2,1)  ;
% At =@(e1)  reshape(fft(reshape(G'*e1(:),N,N)),N^2,1) ;
% recx=real(A(tfx)); recy=real(A(tfy)); recz=real(A(tfz));
% 


% 
% 
% temp1=abs(2*pi*At(d1));
% temp11=2*pi*A(temp1);

window ='Gaussian';
window_half_length = s/2;
G=Gabor(window,window_half_length,length(tfx));

A = @(e1)  G*e1; % G*reshape( real(ifft(reshape(e1,N,N))) ,N^2,1)  ;
At =@(e1)  G'*e1; %reshape(fft(reshape(G'*e1(:),N,N)),N^2,1) ;
recx=real(2*pi*A(tfx)); recy=real(2*pi*A(tfy)); recz=real(2*pi*A(tfz));
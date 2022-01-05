function [tfx]=STFT(x,s)
N = length(x) ;  G = forw(N,s) ;
% GG=full(G);
% save gg.mat GG
% save g.mat G


A = @(e1) G*reshape( real(ifft(reshape(e1,N,N))) ,N^2,1)  ;
At =@(e1) reshape(fft(reshape(G'*e1(:),N,N)),N^2,1) ;
tfx = zeros(N^2,1) ; 
tfx=At(x);
tfx=reshape(tfx,N,N); 
recx=real(A(tfx)); 
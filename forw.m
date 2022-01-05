function A = forw(N,s)
id =1:N;
W = zeros(N,N) ;

if length(s)==1
    sj = s*ones(N,1) ;
elseif length(s)~=N
    error('length of "s" should be one or the same as length of data ')
end

for j=1:N
    W(:,j) = exp(-2*pi^2*(id-j).^2/sj(j)^2);
end

A=spdiags(W,0:N:N^2-N,N,N^2) ;

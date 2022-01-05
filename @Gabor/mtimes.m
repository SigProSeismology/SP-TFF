function res = mtimes(a,b)
%
% Ali Gholami, Azar 86
if isa(a,'Gabor') == 0
    error('In  A.*B only A can be Gabor operator');
end
if a.adjoint
%     Wtx = a.W'.*repmat(b(:),1,a.n);
%     W is a symmetric matrix, so
    Wtx = a.W.*repmat(b(:),1,a.n);
    FWtx = fft(Wtx);
    res = FWtx(:);
else
    Ftx = ifft(reshape(b,a.n,a.n));
    WFtx = a.W.*Ftx;
    res = sum(WFtx,2);
end


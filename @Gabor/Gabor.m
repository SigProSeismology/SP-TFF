function [res,W] = Gabor(wname,w,n)
% implements a Gabor operator
%    w          window half-length used to construct specgm
%    wname     string: 'Rectangle', 'Hanning', 'Hamming',
%             'Gaussian', 'Blackman' 
%              name of window used to construct specgm
%    n         the length of the signal to be decomposed
% % Ali Gholami, day 87
res.adjoint = 0;
W = scalewindow(wname,w,n);
res.W = W;
res.n = n;
res = class(res,'Gabor');

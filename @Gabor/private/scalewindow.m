function s = scalewindow(wname,w,n)
% window
win    = MakeWindow(wname,w);
window = [win(w+1:end) zeros(1,n+2*w) win(1:w)];
s = toeplitz(window);
s = s(1:n,1:n)/norm(win);
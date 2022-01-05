function [TFR,rec,s_l,A]=satst(x,r,dt,method);
%--method: Stokwell(1996)/defualt-> Sattari(2016)--
if nargin<4, method='Sattari'; end
x=x(:);
n=length(x);
h=fix(n/2)+1;     sym=0;
if rem(n,2)==0;sym=1;end         % to suit symmetry
t=0:dt:(n-1)*dt;
x_hat = fft(x);
%-------------------Windowing ---------------------
 strcmp(method,'Stockwell'),s_l=1:h;
A=zeros(h);
for i=1:h;
    w=(g(h,s_l(i)));
    cc=w(h+2-i:end);                        % shift
    cc(h+1:end)=[];                    % truncation      
    A(i,:)=cc;  
end;    A(n,n)=0;
A(h+1:end,h+1:end)=rot90(A(2:h-sym,2:h-sym),2);
if strcmp(method,'Stockwell'),A=A';end;    % Switch
A=A./repmat(sum(A,2),1,n);     % partition of unity
%-----------------Computing TFR--------------------
TFR=ifft(A.*repmat(x_hat,1,n));           % (Eq.16)
rec=real(sum(TFR,2));        % Invertiblity (Eq.12) 
%--------------------Plotting----------------------
% subplot 211;plot(t,rec,'b.',t,x,'k'); 
% legend('Rec','Inp'); axis tight;
% subplot 212;imagesc(t,linspace(0, ...
% 1/2/dt,h),abs(TFR(:,1:h).')); xlabel('Time (s)')
% title(['method: ',method]);ylabel('Frequency (Hz)')
%------- Function to compute Voice Gaussians ------ 
function gauss=g(m,s)
v=(-m:m-1).^2; 
gauss=exp(v*(-1*2*pi^2/s^2));
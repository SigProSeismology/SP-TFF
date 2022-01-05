function [tfx,tfy,tfz,recx,recy,recz]=STFT_S_IST(x,y,z,s,tt,fff);

% STFT_S_IST: A code to generate sparsity-promoting Time-Frequency Representation of 3-components of seismogram by applying a sparsity-based inversion%
% [tfx,tfy,tfz,recx,recy,recz]=STFT_S_IST(x,y,z,s,tt,fff);
%
%
% x, y, z ... 3 components of the seismic data the TFR to be calculated
% s ... the window length for computing STFT
%      **********************
% tfx ... TFR of the x-component
%      **********************
% tfy ... TFR of the y-component
%      **********************
% tfz ... TFR of the z-component

% recx ... Reconstructed x-component by tfx
%      **********************
% recy ... Reconstructed y-component by tfy
%      **********************
% recz ... Reconstructed z-component by tfz

% 
% Hamzeh Mohammadigheymasi, Sparsity-promoting approach to polarization analysis of seismic signals in the time-frequency domain, July 2020
%
% NOTE: This SOFTWARE may be used by any individual or corporation for any purpose
% with the exception of re-selling or re-distributing the SOFTWARE.
% By using this software, you are agreeing to the terms detailed in this software's
% Matlab source file.

% BEGIN TERMS OF USE LICENSE
%
% This SOFTWARE is maintained by the SP-TFF Project.
% The copyright and ownership is jointly held by
% the first author of the "Sparsity-promoting approach to polarization analysis of seismic signals in the time-frequency domain" 
% published in the IEEE transaction on Geoscience and remote sensing journal. 
% project may be contacted via email at:  hamzeh@ubi.pt
%
% The term 'SOFTWARE' refers to the Matlab source code, translations to
% any other computer language, or object code
%
% Terms of use of this SOFTWARE
%
% 1) This SOFTWARE may be used by any individual or corporation for any purpose
%    with the exception of re-selling or re-distributing the SOFTWARE.
%
% 2) The AUTHOR and SP-TFF must be acknowledged in any resulting publications or
%    presentations
%
% 3) This SOFTWARE is provided "as is" with no warranty of any kind
%    either expressed or implied. SP-TFF makes no warranties or representation
%    as to its accuracy, completeness, or fitness for any purpose. SP-TFF
%    is under no obligation to provide support of any kind for this SOFTWARE.
%
% 4) SP-TFF project periodically adds, changes, improves or updates this SOFTWARE without
%    notice. New versions will be made available at ble at https://github.com/SigProSeismology/SP-TFF.
%
% 5) Use this SOFTWARE at your own risk.
%
% END TERMS OF USE LICENSE



N = length(x) ;  d1=x; d2=y; d3=z; 
window ='Gaussian'; window_half_length = s/2; G=Gabor(window,window_half_length,length(x));
A = @(e1)  G*e1;  At =@(e1)  G'*e1; 

dh1 = d1 ; dh2 = d2 ; dh3 = d3 ;
n_it = 400 ; mu = 2e-3; lambda = mu*max(abs(2*pi*At(d1)))*1.2 ;
 tfx = zeros(N^2,1) ; tfy = zeros(N^2,1) ; tfz = zeros(N^2,1) ;  col = hot; figure(100)
for j=1:n_it
    U1j = tfx + mu*2*pi*At( d1-2*pi*A(tfx) ) ;     U2j = tfy + mu*2*pi*At( d2-2*pi*A(tfy) ) ;     U3j = tfz + mu*2*pi*At( d3-2*pi*A(tfz) ) ;
    tfx = soft_complex(U1j,lambda) ;    tfy = soft_complex(U2j,lambda) ;    tfz = soft_complex(U3j,lambda) ;    
    d1 = d1 + (dh1 -real(2*pi*A(tfx))) ;     d2 = d2+ (dh2 -real(2*pi*A(tfy))) ;     d3 = d3 + (dh3 -real(2*pi*A(tfz))) ;    
temp=abs(reshape(tfx,N,N)); cax=max(max(temp));
subplot 321; imagesc(tt,fff, temp(1:floor(N/2)+1,:)),colormap(col) ,grid on;  title('SP-TFR (T)', 'FontSize', 10); caxis([0,0.65*cax]);
ylabel('Frequency(Hz)');axis tight; axis xy

temp=abs(reshape(tfy,N,N)); cax=max(max(temp));
subplot 323; imagesc(tt,fff, temp(1:floor(N/2)+1,:)),colormap(col) ,grid on;  title('SP-TFR (R)', 'FontSize', 10); caxis([0,0.65*cax]);
 ylabel('Frequency(Hz)');axis tight; axis xy
 
 temp=abs(reshape(tfz,N,N)); cax=max(max(temp));
subplot 325; imagesc(tt,fff, temp(1:floor(N/2)+1,:)),colormap(col) ,grid on;  title('SP-TFR (Z)', 'FontSize', 10); caxis([0,0.65*cax]);
 ylabel('Frequency(Hz)');  xlabel('Time(S)');axis tight; axis xy
    
   
   subplot 322, plot(dh1), hold on, plot( 2*pi*A(tfx),'-.r'), hold off ,xlim([1 N]); title('Transverse')
    subplot 324, plot(dh2), hold on, plot( 2*pi*A(tfy),'-.r'), hold off ,xlim([1 N]); title('Radial')
    subplot 326, plot(dh3), hold on, plot( 2*pi*A(tfz),'-.r'), hold off ,xlim([1 N]); title('Vertical') ; xlabel('Time(S)')   
    drawnow
    sgtitle('Sparsity- Promoting TFR') ;
    pri = sprintf('Computing SP-TFR: Iteration (%d/%d)',j,n_it);    disp(pri)
end
tfx=reshape(tfx,N,N); tfy=reshape(tfy,N,N); tfz=reshape(tfz,N,N); recx=real(2*pi*A(tfx)); recy=real(2*pi*A(tfy)); recz=real(2*pi*A(tfz));
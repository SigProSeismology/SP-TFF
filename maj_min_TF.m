function [majnorm, minnorm,majo,mino,SEMI]= maj_min_TF(TFT1, TFR1, TFZ1)
% maj_min_TF: A code to generate TF-based semi-major and -minor axis of the seismic wavefield provided by the TFR of 3-components%
% [majnorm, minnorm,majo,mino,SEMI]= maj_min_TF(TFT1, TFR1, TFZ1)
%
%
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


N=length(TFT1);
NF=ceil(N/2); SEMI=zeros(12,NF,N); majo=zeros(3,NF,N);mino=zeros(3,NF,N);minnn=zeros(3,NF,N); majon=zeros(3,NF,N);minon=zeros(3,NF,N);
for i=1:N
    pri = sprintf('Computing polarization parameter for time sample (%d/%d)',i,N);
    disp(pri)
[SEMI(:,:,i),majo(:,:,i),mino(:,:,i),minnn(:,:,i),majon(:,:,i),minon(:,:,i)] =Semi_maj_min_3(TFT1(:,i),TFR1(:,i),TFZ1(:,i));
 end 
majnorm=zeros(NF,N); minnorm=zeros(NF,N); minn3orm=zeros(NF,N);
for i=1:NF
    for j=1:N    
    majnorm(i,j)=norm(majo(:,i,j));   minnorm(i,j)=norm(mino(:,i,j));  
    end
end




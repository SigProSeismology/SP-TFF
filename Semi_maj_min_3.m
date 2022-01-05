function [SEMI,majo,mino,minnn,majon,minon] =Semi_maj_min_3(t,r,z)
% maj_min_TF: A code to generate TF-based semi-major and -minor axis of the seismic wavefield provided by the TFR of 3-components%
% [SEMI,majo,mino,minnn,majon,minon] =Semi_maj_min_3(t,r,z)
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


len=length(t); half=ceil(len/2);
SEMI=zeros(12,half);
majo=zeros(3,half);
mino=zeros(3,half);
minnn=zeros(3,half);
tt= xcorrF_single(t,t); rr= xcorrF_single(r,r);  zz= xcorrF_single(z,z); tr= xcorrF_single(t,r); tz= xcorrF_single(t,z);  rz= xcorrF_single(r,z);
for i=1:half
    COVF=[tt(i),tr(i),tz(i);tr(i),rr(i),rz(i);tz(i),rz(i),zz(i)];
    [V,D]= eig(COVF);      [d,ind] = sort(diag(D)); D = D(ind,ind); V = V(:,ind);
    SEMI(1:3,i)=V(:,3);     SEMI(4:6,i)=V(:,2);     SEMI(7:9,i)=V(:,1);     SEMI(10:12,i)=[D(3,3);D(2,2);D(1,1)];    
    majo(:,i)=sqrt(2)*sqrt(D(3,3))*V(:,3)';     mino(:,i)=sqrt(2)*sqrt(D(2,2))*V(:,2)';       minnn(:,i)=sqrt(2)*sqrt(D(1,1))*V(:,1)';      
end
majon=majo/max(max(abs(majo))); minon=mino/max(max(abs(mino)));
function F_A = Directivity_L(majo,base,alpha,beta,ind)
% Directivity_L: A code to apply directivity filtering to extract Love
% waves
% F_A = Directivity_L(majo,base,alpha,beta,ind)
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


A= zeros(size(majo,2),size(majo,3));  F_A=0*A;
for i = 1 : size(A,1)
    for j = 1 : size(A,2)
        A(i,j)=abs(base*majo(:,i,j));%(SEMI(11,i,j)+SEMI(12,i,j))/SEMI(10,i,j);
    end
end
A=A/max(max(A));
for i = 1 : size(A,1)
    for j = 1 : size(A,2)
       % A(i,j)=abs(base*majo(:,i,j));%(SEMI(11,i,j)+SEMI(12,i,j))/SEMI(10,i,j);
        if  A(i,j) < alpha 
          F_A(i,j)=1;
        elseif A(i,j) >= alpha && A(i,j)<=beta 
            F_A(i,j)=cos(pi*(A(i,j)-alpha)/(2*(beta-alpha)));
        else
           F_A(i,j)=0  ;
        end
    end
end

F_A(:,1:ind)=1;
b=1;

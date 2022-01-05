function [corr_f] = xcorrF_single(X1,X2)
% [corr_f] =xcorrF_single(X1,X2)
% Required Parameters:
%
% X1
%      A column vector of the Fourirer coefficients of the first component.
%       in the current directory.
% X2
%      A column vector of the Fourirer coefficients of the second component.
%
% Output:
% corr_f
%      The frequency dependent correlation coefficents of two signals x1
%      and x2

% The function computes the Eq. (14) of "Sparsity-promoting approach to
% polarization analysisof seismic signals in the time-frequency domain",
%  IEEE TRANSACTIONS ON GEOSCIENCE AND REMOTE SENSING
%
%  https://github.com/SigProSeismology/SP-TFF
 
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

%
% Written by Hamzeh Mohammadigheymasi, 2020
% Last Modified: 11/Nov/2021
% Version 1.0
% Since 0.0.1
%

X=X1.*conj(X2);
len=length(X1);
half=ceil(len/2);
corr_f=[X(1);X(2:half)+flipud(X(half+1:end))]/(len*len);

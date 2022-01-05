% The code computes the outputs of the synthetic simulation of "Sparsity-promoting approach to
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



clc; close all; clear;
%%%%% Synthetic data
load COLA.mat; fs = 1; freq=0.05; f=linspace(-fs/2, fs/2,length(t) ); sigma=0.0004;


temp=abs(fft(z(1:length(t))));     temp2=temp(1:floor(length(temp)/2)+1); fp=f(floor(length(temp)/2)+1:end);
r=r+sigma*randn(size(z));  t=t+sigma*randn(size(z));  z=z+sigma*randn(size(z));
fff=linspace(0, fs/2,length(t) );  mi=min([min(t),min(r),min(z)]);     ma= max([max(t),max(r),max(z)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Plot traces Figure 1 of Manuscript
plot_traces(t,r,z); figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Time-frequency Representation %%%%%%%%%%%%%%
N=length(r);   s=150;   [TFR2]=STFT(r,s); [TFT2]=STFT(t,s); [TFZ2]=STFT(z,s);  dt=0.5;  tt = (0:1/fs:length(r)/fs-1/fs)';  col = hot;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SP-TFR %%%%%%%%%%%%%%%%%%%%%%%%%%%%
[ TFT1,TFR1, TFZ1,rect,recr,recz]= STFT_S_IST(t,r,z,s,tt,fff);
[TFR2]=satst(r,10,1,'Stockwell');TFR2=TFR2.'; [TFT2]=satst(t,10,1,'Stockwell');TFT2=TFT2.'; [TFZ2]=satst(z,10,1,'Stockwell');TFZ2=TFZ2.';
image_TFR2(TFT2,TFR2,TFZ2,TFT1,TFR1,TFZ1,tt,fff);
[majnorm2, minnorm2,majo2,mino2]= maj_min_TF(TFT2, TFR2, TFZ2);
[majnorm, minnorm,majo,mino,SEMI]= maj_min_TF(TFT1, TFR1, TFZ1);
image_Maj_Min(majnorm,minnorm,majnorm2,minnorm2,tt,fff); indexx=565;



%%%% Filter Rayleigh and Love
F_D = Directivity_L(majo,[1,0,0],0.13,0.16,indexx); F_A = Amplitude(majnorm,0.19,0.22,indexx);
F_A=[F_A;flipud(F_A(2:end,:))]; F_A=F_A/max(max(F_A)); F_D=[F_D;flipud(F_D(2:end,:))]; F_D=F_D/max(max(F_D)); F_L=(1-F_D).*(1-F_A);
TFT1_FL=TFT1.*(1-F_L); TFR1_FL=TFR1.*(1-F_L); TFZ1_FL=TFZ1.*(1-F_L);
[rect_L,recr_L,recz_L]=I_STFT(TFT1_FL,TFR1_FL,TFZ1_FL,s);
F_R = Rectilinearity(SEMI,0.08,0.1,indexx); F_D = Directivity_R(majo,[0,1,0],[0,0,1],0.2,0.25,indexx); F_RA=1-(1-F_R).*(1-F_D);
F_RA=[F_RA;flipud(F_RA(2:end,:))]; F_RA=F_RA/max(max(F_RA));
temp1=abs(reshape(TFZ1,N,N)); cax=max(max(temp1));
TFT1_FR=TFT1.*(F_RA); TFR1_FR=TFR1.*(F_RA); TFZ1_FR=TFZ1.*(F_RA);
[rect_R,recr_R,recz_R]=I_STFT(TFT1_FR,TFR1_FR,TFZ1_FR,s);
plot_traces2(t,r,z,rect_L,recr_L,recz_L,rect_R,recr_R,recz_R);
image_TFR(TFT1_FL,TFR1_FL,TFZ1_FL,TFT1_FR,TFR1_FR,TFZ1_FR,tt,fff);


% %%%% Extract Rayleigh and Love
F_D = Directivity_L(majo,[1,0,0],0.13,0.16,indexx); F_A = Amplitude(majnorm,0.19,0.22,indexx);
F_A=[F_A;flipud(F_A(2:end,:))]; F_A=F_A/max(max(F_A)); F_D=[F_D;flipud(F_D(2:end,:))]; F_D=F_D/max(max(F_D)); F_L=1- (1-F_D).*(1-F_A);
TFT1_FL=TFT1.*(1-F_L); TFR1_FL=TFR1.*(1-F_L); TFZ1_FL=TFZ1.*(1-F_L);
[rect_KL,recr_KL,recz_KL]=I_STFT(TFT1_FL,TFR1_FL,TFZ1_FL,s);
F_R = Rectilinearity(SEMI,0.08,0.1,indexx); F_D = Directivity_R(majo,[0,1,0],[0,0,1],0.2,0.25,indexx); F_RA=(1-F_R).*(1-F_D);
F_RA=[F_RA;flipud(F_RA(2:end,:))]; F_RA=F_RA/max(max(F_RA));
TFT1_FR=TFT1.*(F_RA); TFR1_FR=TFR1.*(F_RA); TFZ1_FR=TFZ1.*(F_RA);
[rect_KR,recr_KR,recz_KR]=I_STFT(TFT1_FR,TFR1_FR,TFZ1_FR,s);
plot_traces_keep(t,r,z,rect_KL,recr_KL,recz_KL,rect_KR,recr_KR,recz_KR);





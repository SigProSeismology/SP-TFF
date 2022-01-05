function image_Maj_Min(majnorm,minnorm,majnorm2,minnorm2,tt,fff)
col = hot;
N=length(majnorm);
figure
cax=max(max(max(majnorm2)),max(max(minnorm2)));
subplot 221; imagesc(tt,fff, majnorm2),colormap(col), colorbar ,grid on;  title('(a)', 'FontSize', 16); caxis([0,0.9*cax]);
%set(gca,'xticklabel',{[]});
%ylabel('Frequency(Hz)', 'FontSize', 16); 
set(gca,'FontSize',15); axis tight; axis xy
% temp=abs(reshape(TFZ1,N,N));
subplot 223; imagesc(tt,fff, minnorm2),colormap(col), colorbar ,grid on;  title('(c)', 'FontSize', 16); caxis([0,0.9*cax]);
%ylabel('Frequency(Hz)', 'FontSize', 16); 
set(gca,'FontSize',15);
%xlabel('Time(s)', 'FontSize', 16); 
axis tight; axis xy


cax=max(max(max(majnorm)),max(max(minnorm)));
subplot 222; imagesc(tt,fff, majnorm),colormap(col), colorbar ,grid on;  title('(b)', 'FontSize', 16); caxis([0,0.65*cax]);
%set(gca,'xticklabel',{[]}); 
set(gca,'yticklabel',{[]}); set(gca,'FontSize',15); axis tight; axis xy
subplot 224; imagesc(tt,fff, minnorm),colormap(col), colorbar ,grid on;  title('(d)', 'FontSize', 16); caxis([0,0.65*cax]);
set(gca,'FontSize',15);set(gca,'yticklabel',{[]}); 
%xlabel('Time(s)', 'FontSize', 16); 
axis tight; axis xy
% figure
%  imagesc(tt,fff, minn3orm),colormap(col), colorbar ,grid on;  title('RS-TFR \lambda_3', 'FontSize', 16); caxis([0,0.8*cax]);
set(gca,'FontSize',15);set(gca,'yticklabel',{[]}); 
%xlabel('Time(s)', 'FontSize', 16); 
axis tight; axis xy

[ax2,h2]=suplabel('Frequency(Hz)','y');
[ax1,h1]=suplabel('Time (s)');

set(h2,'FontSize',25)
set(h1,'FontSize',25)
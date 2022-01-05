function image_TFR2(TFT2,TFR2,TFZ2,TFT1,TFR1,TFZ1,tt,fff)
col = hot;
N=length(TFT2);
figure
temp=abs(reshape(TFT2,N,N)); cax=max(max(temp));
subplot 321; imagesc(tt,fff, temp(1:floor(N/2)+1,:)),colormap(col), colorbar ,grid on;  title('(a)', 'FontSize', 16); caxis([0,cax]);
%set(gca,'xticklabel',{[]});
%ylabel('Frequency(Hz)', 'FontSize', 16); 
set(gca,'FontSize',16); axis tight; axis xy
temp=abs(reshape(TFR2,N,N)); cax=max(max(temp));

temp1=abs(reshape(TFT1,N,N)); cax=max(max(temp1));
subplot 322; imagesc(tt,fff, temp1(1:floor(N/2)+1,:)),colormap(col), colorbar ,grid on;  title('(b)', 'FontSize', 16); caxis([0,0.65*cax]);
%set(gca,'yticklabel',{[]});
%set(gca,'xticklabel',{[]}); 
set(gca,'FontSize',15); axis tight; axis xy

temp=abs(reshape(TFR2,N,N)); cax=max(max(temp));
subplot 323; imagesc(tt,fff, temp(1:floor(N/2)+1,:)),colormap(col), colorbar ,grid on;  title('(c)', 'FontSize', 16); caxis([0,cax]);
%set(gca,'xticklabel',{[]});
%ylabel('Frequency(Hz)', 'FontSize', 16);
set(gca,'FontSize',16); axis tight; axis xy
temp=abs(reshape(TFR2,N,N)); cax=max(max(temp));

temp1=abs(reshape(TFR1,N,N)); cax=max(max(temp1));
subplot 324; imagesc(tt,fff, temp1(1:floor(N/2)+1,:)),colormap(col), colorbar ,grid on;  title('(d)', 'FontSize', 16); caxis([0,0.65*cax]);
%set(gca,'yticklabel',{[]});
%set(gca,'xticklabel',{[]});
set(gca,'FontSize',15); axis tight; axis xy

temp=abs(reshape(TFZ2,N,N)); cax=max(max(temp));
subplot 325; imagesc(tt,fff, temp(1:floor(N/2)+1,:)),colormap(col), colorbar ,grid on;  title('(e)', 'FontSize', 16); caxis([0,cax]);
%xlabel('Time(s)', 'FontSize', 16); 
%ylabel('Frequency(Hz)', 'FontSize', 16);
set(gca,'FontSize',16); axis tight; axis xy
temp=abs(reshape(TFR2,N,N)); cax=max(max(temp));

temp1=abs(reshape(TFZ1,N,N)); cax=max(max(temp1));
subplot 326; imagesc(tt,fff, temp1(1:floor(N/2)+1,:)),colormap(col), colorbar ,grid on;  title('(f)', 'FontSize', 16); caxis([0,0.65*cax]);
set(gca,'yticklabel',{[]}); 
%xlabel('Time(s)', 'FontSize', 16); 
set(gca,'FontSize',15); axis tight; axis xy


[ax2,h2]=suplabel('Frequency(Hz)','y');
[ax1,h1]=suplabel('Time (s)');

set(h2,'FontSize',25)
set(h1,'FontSize',25)
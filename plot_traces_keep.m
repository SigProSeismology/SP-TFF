function plot_traces_keep(t,r,z,rect_L,recr_L,recz_L,rect_R,recr_R,recz_R)
mi=min([min(t),min(r),min(z)]);     ma= max([max(t),max(r),max(z)]);
figure


subplot 311; plot(t, 'Color', [150 150 150]/255,'LineWidth',1); axis tight; grid on;  title('(a)');set(gca,'xticklabel',{[]});set(gca,'FontSize',15);
ylim([mi ma]); hold on ; plot(rect_L, 'Color', [0 0 0]/255,'LineWidth',1); hold off
 
% subplot 323; plot(r, 'Color', [150 150 150]/255,'LineWidth',1); axis tight; grid on;  title('(c)'); set(gca,'xticklabel',{[]});set(gca,'FontSize',15);
% ylim([mi ma]) ;  hold on ; plot(recr_L, 'Color', [0 0 0]/255,'LineWidth',1); hold off
% 
% subplot 325; plot(z, 'Color', [150 150 150]/255,'LineWidth',1); axis tight; grid on;  title('(e)');set(gca,'FontSize',15);
% ylim([mi ma]) ;   hold on ; plot(recz_L, 'Color', [0 0 0]/255,'LineWidth',1); hold off
% [ax2,h2]=suplabel('Velocity (m/s)','y');
% set(h2,'FontSize',25); %set(h1,'FontSize',25); figure;
% 
% subplot 322; plot(t, 'Color', [150 150 150]/255,'LineWidth',1); axis tight; grid on;  title('(b)');set(gca,'xticklabel',{[]});set(gca,'FontSize',15);
% ylim([mi ma]); hold on ; plot(rect_R, 'Color', [0 0 0]/255,'LineWidth',1); hold off
subplot 312; plot(r, 'Color', [150 150 150]/255,'LineWidth',1); axis tight; grid on;  title('(d)'); set(gca,'xticklabel',{[]});set(gca,'FontSize',15);
ylim([mi ma]) ;  hold on ; plot(recr_R, 'Color', [0 0 0]/255,'LineWidth',1); hold off
subplot 313; plot(z, 'Color', [150 150 150]/255,'LineWidth',1); axis tight; grid on;  title('(f)');set(gca,'FontSize',15);
ylim([mi ma]) ;   hold on ; plot(recz_R, 'Color', [0 0 0]/255,'LineWidth',1); hold off
[ax2,h2]=suplabel('Velocity (m/s)','y');
[ax1,h1]=suplabel('Time (s)'); 
set(h2,'FontSize',25);
set(h1,'FontSize',25)

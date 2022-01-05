function plot_traces(t,r,z)
mi=min([min(t),min(r),min(z)]);     ma= max([max(t),max(r),max(z)]);
figure
subplot 311; plot(t,'bla','LineWidth',1); axis tight; grid on;  title('(a)');
set(gca,'xticklabel',{[]});
set(gca,'FontSize',15);
ylim([mi ma]); 
 
subplot 312; plot(r,'bla','LineWidth',1); axis tight; grid on;  title('(b)'); 
set(gca,'xticklabel',{[]});
set(gca,'FontSize',15);
ylim([mi ma]) ; 

subplot 313; plot(z,'bla','LineWidth',1); axis tight; grid on;  title('(c)');set(gca,'FontSize',15);
ylim([mi ma]) ; 
[ax2,h2]=suplabel('Velocity (m/s)','y');
[ax1,h1]=suplabel('Time (s)');

set(h2,'FontSize',25)
set(h1,'FontSize',25)
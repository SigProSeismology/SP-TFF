function [SEMI,majo,mino,majon,minon] =Semi_maj_min(t,r,z)
len=length(t); half=ceil(len/2);
SEMI=zeros(12,half);
majo=zeros(3,half);
mino=zeros(3,half);
tt= xcorrF_single(t,t);
rr= xcorrF_single(r,r); 
zz= xcorrF_single(z,z);
tr= xcorrF_single(t,r); 
tz= xcorrF_single(t,z); 
rz= xcorrF_single(r,z);

for i=1:half
    COVF=[tt(i),tr(i),tz(i);tr(i),rr(i),rz(i);tz(i),rz(i),zz(i)];
    [V,D]= eig(COVF);     SEMI(1:3,i)=V(:,3);     SEMI(4:6,i)=V(:,2);     SEMI(7:9,i)=V(:,1);     SEMI(10:12,i)=[D(3,3);D(2,2);D(1,1)];    
    facc=sqrt(len)\sqrt(2);    
    majo(:,i)=facc*sqrt(D(3,3))*V(:,3)';     mino(:,i)=facc*sqrt(D(2,2))*V(:,2)';    
end
majon=majo/max(max(abs(majo)));
minon=mino/max(max(abs(mino)));




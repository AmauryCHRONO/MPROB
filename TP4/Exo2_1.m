close all;
clear variables;

n=50000;
a=-2;
b=3;
c=1/log(6);

Y=rand(1,n);
Xemp=exp(Y./c)-4;

Eemp=mean(Xemp);
Semp=std(Xemp);
Vemp=Semp^2;

x=-3:1/n:2;
y=c./(x+4);

E=(5*c)-4;
V=((32*log(6)-45)*c/2)-((5*c)-4)^2;
S=sqrt(V);

t={
    sprintf('Experiences : %d',n)
    sprintf('Eth(X) = %f',E)
    sprintf('Eemp(X) = %f',Eemp)
    sprintf('S(X) = %f',S)
    sprintf('Semp(X) = %f',Semp)
    };

figure(1);hold on
histogram(Xemp,'Normalization','pdf');
plot(x,y,'b');
text(0,0.3,t);
ylim([0,0.6]);
close all;
clear variables;

n=50000;
a=-6;
b=14;

Xemp=a+(b-a)*rand(n,1);

Eemp=mean(Xemp);
Semp=std(Xemp);
Vemp=Semp^2;


X=1/(b-a);

E=(a+b)/2;
V=((b-a)^2)/12;
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
plot(a:1:b,X*ones(b-a+1),'b');
text(0,0.25,t);
ylim([0,0.3]);








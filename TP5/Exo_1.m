close all;
clear variables;

%Variable
N=50000;
U1=rand(1,N);
U2=rand(1,N);

X=sqrt(-2*log(U1)).*cos(2*pi.*U2);
Y=sqrt(-2*log(U1)).*sin(2*pi.*U2);

a=min(X);
b=min(Y);
c=max(X);
d=max(Y);

x=min(a,b):0.01:max(c,d);
y=(1/sqrt(2*pi))*exp(-(x.^2)/2);

sig=3;
mu=4;
Z=X*sig+mu;
h=-15+mu:0.01:15+mu;
i=(1/(sig*sqrt(2*pi)))*exp((-1/2)*((h-mu)/sig).^2);

figure(1);
subplot(121),hold on,histogram(X,'Normalization','pdf'),plot(x,y);
subplot(122),hold on,histogram(Y,'Normalization','pdf'),plot(x,y);

figure(2);
hold on,histogram(Z,'Normalization','pdf'),plot(h,i);

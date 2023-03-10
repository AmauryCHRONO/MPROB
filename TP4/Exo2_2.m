clear variables; close all;

n=100000;% nombre d’expériences

Y1=(1/2)*rand(1,n);% VA uniforme sur [0,1/2]
Y2=0.5+(1-0.5)*rand(1,n);% VA uniforme sur [1/2,1]

X1=sqrt(8*Y1);% simulation de la VA X sur [0,2[
X2=4-2*sqrt(2-2*Y2);% simulation de la VA X sur [2,4[

X=[X1 X2];% concaténation des VA X1 et X2

x1=0:1/n:2;
x2=2:1/n:4;
x=[x1 x2];
y1=x1./4;
y2=(4-x2)./4;
y=[y1 y2];

figure(1);hold on
histogram(X,'Normalization','pdf');% histogramme de X
plot(x,y);

mu_emp=mean(X);% moyenne empirique
sigma_emp=std(X);% écart type empirique
mu_th=mean(x);% moyenne théorique
sigma_th=sqrt(2/3);% écart type théorique
fprintf('Moyenne empirique : %f,\t Moyenne théorique : %f\n',mu_emp,mu_th);
fprintf('Ecart type empirique : %f,\t Ecart type théorique :%f\n',sigma_emp,sigma_th);
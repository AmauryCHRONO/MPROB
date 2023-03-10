clear variables;
close all;

%Variables
N=100000; %nb d'exp 
n=10; %nb de boules
X=zeros(1,N); %resultat

for k=1:N
    boules=randi(n,1,2);
    while boules(1)==boules(2)
        boules=randi(n,1,2);
    end
    X(k)=min(boules);
end
h=histogram(X,'Normalization','probability');hold on
Eemp=mean(X);
Sigmemp=std(X);
Vemp=(Sigmemp)^2;


k=1:1:n-1;
Pk=2*(n-k)/(n*(n-1));
bar(k,Pk);hold on
E=(n+1)/3;
V=((n^2)-n-2)/18;
Sigm=sqrt(V);

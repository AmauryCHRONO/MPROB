close all;
clear variables;

n=1;
m=1;

switch n
    case 1
        a=3;
        b=8;
        x1=a:1:b;
        y1=[4,1,3,7,2,3]./20;

    case 2
        a=-5;
        b=4;
        x1=a:1:b;
        y1=ones(1,10)./10;
        
    case 3
        a=1;
        b=100;
        p=1/3;
        x1=a:1:b;
        y1=p*(1-p).^(x1-1);
        
end

%1
m1=x1*y1';
sig1=sqrt((x1.^2)*y1'-m1.^2);

%2
x2=2*a:1:2*b;
y2=conv(y1,y1);


%3
n=10;
x3=n*a:1:n*b;
y3=y1;
for i=1:n-1
    y3=conv(y3,y1);
end
switch m
    case 1
        m3=x3*y3';
        sig3=sqrt((x3.^2)*y3'-m3.^2);
        X=m3-5*sig3:0.01:m3+5*sig3;
        Y=(1/(sig3*sqrt(2*pi)))*exp((-1/2)*((X-m3)/sig3).^2); 
        figure(1);
        subplot(311);bar(x1,y1);
        subplot(312);bar(x2,y2);
        subplot(313);hold on,bar(x3,y3);plot(X,Y);
        
    case 3
        m3=1/p;
        sig3=sqrt((1-p)/p^2);
        X=m3-5*sig3:0.01:m3+5*sig3;
        Y=(1/(sig3*sqrt(2*pi)))*exp((-1/2)*((X-m3)/sig3).^2);
        figure(1);
        subplot(311);bar(x1,y1);
        subplot(312);bar(x2,y2);
        subplot(313);hold on,bar(x3,y3);plot(X,Y);
end




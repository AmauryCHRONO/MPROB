clear variables;
close all;

n=10000;
X=1+(3-1).*rand(1,n);
Y=2+(4-2).*rand(1,n);
Z=0.06.*rand(1,n);
Inx=[];
Iny=[];
Inz=[];
Outx=[];
Outy=[];
Outz=[];
x=1:0.001:3;
y=2:0.001:4;
z=1./((x+y).^3);
Compt=0;

for i=1:n
    if (Z(i)<=1/((X(i)+Y(i))^3)) && (X(i)+Y(i)<=5)
        Compt=Compt+1;
        Inx=[Inx,X(i)];
        Iny=[Iny,Y(i)];
        Inz=[Inz,Z(i)];
    else
        Outx=[Outx,X(i)];
        Outy=[Outy,Y(i)];
        Outz=[Outz,Z(i)];
    end
end
vol=(Compt/n)*(2*2*0.06);



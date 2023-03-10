clear variables;
close all;

%Variables

n=10000;
Compt=0;
Compt2=0;
Inx1=[];
Iny1=[];
Outx1=[];
Outy1=[];
Inx2=[];
Iny2=[];
Outx2=[];
Outy2=[];
x1=0:0.001:1;
x2=1:0.001:exp(1);
y1=sqrt(1.-x1.^2);
y2=log(x2)./(x2.^2);
X1=rand(n);
Y1=rand(n);
X2=1+(exp(1)-1).*rand(n);
Y2=0.5.*rand(n);
%Progarmmes

for i=1:n
    if (X1(i)^2)+(Y1(i)^2) <= 1
        Compt=Compt+1;
        Inx1=[Inx1,X1(i)];
        Iny1=[Iny1,Y1(i)];
    else
        Outx1=[Outx1,X1(i)];
        Outy1=[Outy1,Y1(i)];
    end
end
PI=(Compt/n)*4;

for i=1:n
    if Y2(i) <= log(X2(i))/(X2(i)^2)
        Compt2=Compt2+1;
        Inx2=[Inx2,X2(i)];
        Iny2=[Iny2,Y2(i)];
    else
        Outx2=[Outx2,X2(i)];
        Outy2=[Outy2,Y2(i)];
    end
end
Air=(Compt2/n)*(0.5*(exp(1)-1));

%Affichage

figure(1);hold on;
plot(Inx1,Iny1,'g*');
plot(Outx1,Outy1,'r*');
plot(x1,y1,'b');

fprintf('APPROXIMATION DE PI (METHODE DE MONTE-CARLO)\n');
disp(['Nombre total de fléchettes : ',num2str(n)]);  
disp(['Nombre de fléchettes dans le quadrant : ',num2str(Compt)]);   
disp(['Valeur approximative de pi : ',num2str(PI)]); 
fprintf('\n');

figure(2);hold on
plot(Inx2,Iny2,'g*');
plot(Outx2,Outy2,'r*');
plot(x2,y2,'b');

fprintf("APPROXIMATION DE L'AIR (METHODE DE MONTE-CARLO)\n");
disp(['Nombre total de fléchettes : ',num2str(n)]);  
disp(['Nombre de fléchettes dans le quadrant : ',num2str(Compt2)]);   
disp(["Valeur approximative de l'air : ",num2str(Air)]); 

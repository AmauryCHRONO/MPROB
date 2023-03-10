clear variables;
close all;

%Variables
n=100000;
n1=4;
n2=24;
Comp1_6=0;
Comp2_6=0;

%Programme

X=LancerDeSixFaces(n);

    %Jeu 1
    for i=1:n
        X1=LancerDeSixFaces(n1);
        if max(X1)==6
            Comp1_6=1+Comp1_6;  
        end
    end
    PJ1=Comp1_6/n
    
    %Jeu 2
    for i=1:n
        X2=LancerDeSixFaces(n2);
        X3=LancerDeSixFaces(n2);
        if (max(X2+X3)==12)
            Comp2_6=1+Comp2_6;  
        end
    end
    PJ2=Comp2_6/n
    
    

%Affichage

figure(1);
hX=histogram(X); 
disp(['nombre de classes : ',num2str(hX.NumBins)]);  
disp(['les effectifs : ',num2str(hX.Values)]);      
fprintf('\n');

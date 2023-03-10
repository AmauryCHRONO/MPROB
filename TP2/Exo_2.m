clear variables;
close all;

L=input("Veuiller dire la loi choisi (Uniforme=1,Bernoulli=2,Binomiale=3,Geometrique=4) : ");
N=input("Veuiller donner le nombres d'exprience a realiser : ");

if L==1
    nb=input("Veuiller rantrer la range de la loi uniforme : ");
elseif L==2
    p=input("Veuiller rantrer la probabilite de la loi de Bernoulli : ");

elseif L==3
    p=input("Veuiller rantrer la probabilite de la loi binomiale : ");
    n=input("Veuiller rantrer le nombre d'epreuve de la loi binomiale : ");

elseif L==4
    p=input("Veuiller rantrer la probabilite de la loi geometrique : ");
end

switch L

    case 1 %%Loi uniforme
        Uniemp=zeros(1,N);
        for k=1:N
            Uniemp(k)=LoiUniforme(nb);
        end
        figure(1);hold on;
        histogram(Uniemp,'Normalization','probability');
        EUniemp=mean(Uniemp);
        SUniemp=std(Uniemp);
        VUniemp=(SUniemp)^2;
        kuni=1:1:nb;
        Pkuni=1/nb*ones(1,nb);
        bar(kuni,Pkuni);
        EUni=(nb+1)/2;
        VUni=((nb^2)-1)/2;
        SUni=sqrt(VUni);

        fprintf('Loi Uniforme\n');
        disp(['Espérance empirique : ',num2str(EUniemp)]);  
        disp(['Espérance théorique : ',num2str(EUni)]);   
        disp(['Variance empirique : ',num2str(VUniemp)]);  
        disp(['Variance théorique : ',num2str(VUni)]);
        disp(['Equart-type empirique : ',num2str(SUniemp)]);  
        disp(['Equart-type théorique : ',num2str(SUni)]);   
        fprintf('\n');

    case 2 %%Loi de Bernoulli
        Bernemp=zeros(1,N);
        for k=1:N
            Bernemp(k)=LoiBernoulli(p);
        end
        figure(2);hold on;
        histogram(Bernemp,'Normalization','probability');
        EBernemp=mean(Bernemp);
        SBernemp=std(Bernemp);
        VBernemp=(SBernemp)^2;

        kBern=[0 1];
        PkBern=[1-p p];
        bar(kBern,PkBern);
        EBern=p;
        VBern=p*(1-p);
        SBern=sqrt(VBern);

        fprintf('Loi de Bernoulli\n');
        disp(['Espérance empirique : ',num2str(EBernemp)]);  
        disp(['Espérance théorique : ',num2str(EBern)]);   
        disp(['Variance empirique : ',num2str(VBernemp)]);  
        disp(['Variance théorique : ',num2str(VBern)]);
        disp(['Equart-type empirique : ',num2str(SBernemp)]);  
        disp(['Equart-type théorique : ',num2str(SBern)]);   
        fprintf('\n');

    case 3 %%Loi binomiale
        Binemp=zeros(1,N);
        for k=1:N
            Binemp(k)=LoiBinomiale(n,p);
        end
        figure(3);hold on;
        histogram(Binemp,'Normalization','probability');
        EBinemp=mean(Binemp);
        SBinemp=std(Binemp);
        VBinemp=(SBinemp)^2;

        kBin=0:1:n;
        PkBin=zeros(1,n+1);
        for i=0:n
            PkBin(i+1)=nchoosek(n,i)*(p^i)*(1-p)^(n-i);
        end
        bar(kBin,PkBin);
        EBin=n*p;
        VBin=n*p*(1-p);
        SBin=sqrt(VBin);

        fprintf('Loi de Binomiale\n');
        disp(['Espérance empirique : ',num2str(EBinemp)]);  
        disp(['Espérance théorique : ',num2str(EBin)]);   
        disp(['Variance empirique : ',num2str(VBinemp)]);  
        disp(['Variance théorique : ',num2str(VBin)]);
        disp(['Equart-type empirique : ',num2str(SBinemp)]);  
        disp(['Equart-type théorique : ',num2str(SBin)]);   
        fprintf('\n');
        
    case 4 %%Loi Geometrique
        Geoemp=zeros(1,N);
        for k=1:N
            Geoemp(k)=LoiGeometrique(p);
        end
        figure(4);hold on;
        histogram(Geoemp,'Normalization','probability');
        EGeoemp=mean(Geoemp);
        SGeoemp=std(Geoemp);
        VGeoemp=(SGeoemp)^2;

        kGeo=1:1:max(Geoemp);
        PkGeo=((1-p).^(kGeo-1))*p;
        bar(kGeo,PkGeo);
        EGeo=1/p;
        VGeo=(1-p)/(p^2);
        SGeo=sqrt(VGeo);

        fprintf('Loi de Geometrique\n');
        disp(['Espérance empirique : ',num2str(EGeoemp)]);  
        disp(['Espérance théorique : ',num2str(EGeo)]);   
        disp(['Variance empirique : ',num2str(VGeoemp)]);  
        disp(['Variance théorique : ',num2str(VGeo)]);
        disp(['Equart-type empirique : ',num2str(SGeoemp)]);  
        disp(['Equart-type théorique : ',num2str(SGeo)]);   
        fprintf('\n');
end

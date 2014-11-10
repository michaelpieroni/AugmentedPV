function [ m] = spvmain( im,type_map,ch,h,k,box_margins,rim,cim )
% il main prende in ingresso un immagine gia in scala di grigi, il tipo di
% mappa , una stringa ovvero ampiezza o intensità o ibrida, nel caso di mappa
% uniforme varargin conterrà fr,fc,r,c rispettivamente numero di fosfeni
% per colonna , numero di fosfeni per riga, numero di righe per ogni
% fosfene e numero di colonne per ogni fosfene
switch (type_map)
    case{'Uniform'}
         fr = box_margins{1}; %numero righe fosfeni
         fc = box_margins{2}; %numero colonne fosfeni
         r = box_margins{3};  %distanza lungo le righe
         c = box_margins{4};  %distanza lungo le colonne
         [ map,r,c,rm,cm ] = spvfosfmap( type_map,fr,fc,r,c );  %richiama la mappa i fosfeni
         dim_phos{1}=fr;
         dim_phos{2}=fc;
         dim_phos{3}=rm;
         dim_phos{4}=cm;
%          [ amp,inte ] = spvfosfprocessor( map,im,ch,type_map,h,k,rim,cim,dim_phos); %richiama la funzione che campionala matrice
         [ amp,inte ] = spvfosfprocessor2( im,ch,type_map,h,k,dim_phos); %richiama la funzione che campionala matrice
        

         [ m ] = spvfosfrender( map,type_map,inte,amp,r,c ); % richiama la funzione che renderizza l'imagine
    case{'Not Uniform'}
         % bisogna apportare delle modifiche
         n=varargin{1}; %numero di fosfeni
         r=varargin{2}; %riche della mappa di fosfeni
         c=varargin{3}; %colonne della mappa di fosfeni
         [ map,dr,dc,d ] = spvfosfmap(type_map,n,r,c );
         [ amp,inte ] = spvfosfprocessor( map,im,ch,type_map,h,k,dr,dc,d );
         [ m ] = spvfosfrender( map,type_map,inte,amp,dr,dc );
end
end


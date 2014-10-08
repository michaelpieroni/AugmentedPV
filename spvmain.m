function [ m] = spvmain( im,type_map,ch,h,k,box_margins )
% il main prende in ingresso un immagine gia in scala di grigi, il tipo di
% mappa , una stringa ovvero ampiezza o intensit� o ibrida, nel caso di mappa
% uniforme varargin conterr� fr,fc,r,c rispettivamente numero di fosfeni
% per colonna , numero di fosfeni per riga, numero di righe per ogni
% fosfene e numero di colonne per ogni fosfene
switch (type_map)
    case{'uniform'}
         fr=box_margins{1}; %numero righe fosfeni
         fc=box_margins{2}; %numero colonne fosfeni
         r=box_margins{3};  %distanza lungo le righe
         c=box_margins{4};  %distanza lungo le colonne
         % in questo caso la dimensione della mappa di fosfeni sar�
         % (fr*(2r+1),fc*(2c+1))
         [ map,r,c ] = spvfosfmap( type_map,fr,fc,r,c );  %richiama la mappa i fosfeni
         [ amp,inte ] = spvfosfprocessor( map,im,ch,type_map,h,k,r,c ); %richiama l afunzione che campionala matrice
         [ m ] = spvfosfrender( map,type_map,inte,amp,r,c ); % richiama la funzione che renderizza l'imagine
    case{'notuniform'}
         n=varargin{1}; %numero di fosfeni
         r=varargin{2}; %riche della mappa di fosfeni
         c=varargin{3}; %colonne della mappa di fosfeni
         [ map,dr,dc,d ] = spvfosfmap(type_map,n,r,c );
         [ amp,inte ] = spvfosfprocessor( map,im,ch,type_map,h,k,dr,dc,d );
         [ m ] = spvfosfrender( map,type_map,inte,amp,dr,dc );
end
end


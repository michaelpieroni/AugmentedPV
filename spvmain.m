function [ m ] = spvmain( im,type_map,mod_phos,h,k,box_margins,rim,cim )

%%INPUT:
%   Im: matrice che contiene i dati dell'immagine
%   type_map: mappa dei fosfeni utilizzata uniforme oppure no 
%   mod_phos: indica se la modulazione dell'immagine avviene in base 
%             all'intensità, all'ampiezza oppure in entrambi i casi 
%   h,k: sono dei parametri che mi indicano il rapporto tra il pixel 
%   dell'immagine e la dimensione effettiva dell'elettrodo 
%   box_margin: array che contiene il numero di fosfeni per riga(fr) e per 
%               colonna(fc) ed il numero di pixel per righe (r_ph) e di 
%               colonne (c_ph) che contiene ogni fosfene; 
%   rim,cim: rapprensentano invece le dimensioni dell'immagine che deve 
%            essere modificata (es:1280x720) 
% 
%%OUTPUT:
%   m: matrice contenente i dati dell'immagine che è stata fosfenizzata


switch (type_map)
    case{'Uniform'}
        
         fc = box_margins{1};      
         fr = box_margins{2};       
         c_ph = box_margins{3};        
         r_ph = box_margins{4};
         
         % spvfosfmap crea la mappa di fosfeni
%          [ map,rmap,cmap ] = spvfosfmap( type_map,fr,fc,r_ph,c_ph );  
%          [ map_int,map_std ] = spvfosfmap2( type_map,fr,fc);  
         dim_phos{1} = fr;
         dim_phos{2} = fc;
         rmap = fr*r_ph;
         cmap = fc*c_ph;
         dim_phos{3} = rmap;
         dim_phos{4} = cmap;
         
         % spvfosfprocessor provvede a campionare la matrice
         [ inte,spread ] = spvfosfprocessor2( im,type_map,mod_phos,dim_phos);
         
         % spvfosfrender renderizza l'immagine fosfenizzata
         
         % TODO: include also h,k in the analysis for physical world
         % dimension
         [ m ] = spvfosfrender( inte,spread,type_map); 
         
    case{'Not Uniform'}
        error ('Not uniform is not already implemented')
        
         %% bisogna apportare delle modifiche
%          n=varargin{1}; %numero di fosfeni
%          r_ph=varargin{2}; %riche della mappa di fosfeni
%          c_ph=varargin{3}; %colonne della mappa di fosfeni
%          [ map,dr,dc,d ] = spvfosfmap(type_map,n,r_ph,c_ph );
%          [ amp,inte ] = spvfosfprocessor( map,im,mod_phos,type_map,h,k,dr,dc,d );
%          [ m ] = spvfosfrender( map,type_map,inte,amp,dr,dc );
end
end


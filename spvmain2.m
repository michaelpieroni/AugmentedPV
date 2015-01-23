function [ m ] = spvmain2( im,type_map,mod_phos,box_margins,dist_elec,render_type,varargin)

%%INPUT:
%   Im: matrice che contiene i dati dell'immagine
%   type_map: mappa dei fosfeni utilizzata uniforme oppure no 
%   mod_phos: indica se la modulazione dell'immagine avviene in base 
%             all'intensità, all'ampiezza oppure in entrambi i casi    
%   box_margin: array che contiene il numero di fosfeni per riga(fr) e per 
%               colonna(fc) ed il numero di pixel per righe (r_ph) e di 
%               colonne (c_ph) che contiene ogni fosfene; 
%   dist_elec: electrode distance [um]
%   render_type: default/ newDesign
%%OUTPUT:
%   m: matrice contenente i dati dell'immagine che è stata fosfenizzata

%CHECK INPUT

    switch render_type
           case ('Default')
                 dxP = dist_elec; 
                 dyP = dist_elec;
                 nRow_rend = size(im,1);
                 nCol_rend = size(im,2);
           case ('Design Not Uniform')
                 dyP = varargin{1};
                 dxP = varargin{2}; 
                 warning('To check if valid for non-uniform pixel distribution')
                 if nargin>6
                     nRow_rend = varargin{1}; %number of row for rendering
                     if nargin>7
                         nCol_rend = varargin{2}; %number of row for rendering
                     else
                         nCol_rend = nRow_rend;
                     end
                 else
                     error ('Specify number of row and column for rendering or select Defaul!')
                 end
     end

switch (type_map)
    case{'Uniform'}
         phos_r = box_margins{1};
         phos_c = box_margins{2};    
         pixph_r = box_margins{3};        
         pixph_c = box_margins{4};
         rmap = phos_r * pixph_r;
         cmap = phos_c * pixph_c;
         
         dim_phos{1} = phos_r;     
         dim_phos{2} = phos_c;
         dim_phos{3} = rmap;
         dim_phos{4} = cmap;
         
         % spvfosfprocessor sample the matrix
         [ inte,spread ] = spvfosfprocessor2( im,type_map,mod_phos,dim_phos);
          
         % verify the content of render_type 
         
         [ m ] = spvfosfrender2( inte,spread, nRow_rend,nCol_rend, mod_phos); 
      
         %% graphic of deviation standard and intensity   
         Mint = inte;
         Mstd = spread;
         figure;
         subplot(2,1,1); imagesc(Mint)
         xlabel('Matrice Intensità');
         subplot(2,1,2); imagesc(Mstd)
         xlabel('Matrice Deviazione Standard');
%          
%          
         
       %% a cosa servivano?
       
%          dx=dxP*size(m,2)/fc;         
%          dy=dyP*size(m,1)/fr;         
%          vX=[1:size(m,2)]*dx;
%          vY=[1:size(m,2)]*dy;

    case{'Not Uniform'}
        error ('Not uniform is not already implemented')
        

end
end
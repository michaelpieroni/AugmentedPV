function [ map,rmap,cmap ] = spvfosfmap( type_map,fr,fc,r_ph,c_ph )

%%INPUT:
%   r_ph,c_ph numero pixel per riga e per colonna di ogni fosfene
%   type_map tipo di mappa utilizzata: uniforme o non uniforme
%   fr e fc sono il numero di fosfeni per riga e per colonna

%%OUTPUT:
%   map: restituisce una mappa sparsa in cui sono presenti degli uni in
%        corrispondenza del centro di ogni fosfene
%   cmap,rmap: dimensioni della mappa


switch (type_map)
    case('Uniform')
        % creo una mappa (matrice sparsa) di dimensioni rmap x cmap
       
        
        rmap = fr * r_ph;    
        cmap = fc * c_ph;    
        map = sparse(rmap,cmap);  

       % vado a settare il valore della mappa ad uno in corrispondenza del
       % punto centrale del fosfene
       
       vett_r = ((r_ph/2) : r_ph : rmap - (r_ph/2));
       vett_c = ((c_ph/2) : c_ph : cmap - (c_ph/2));
       
%        vett_r = ((r_ph-1)/2 : r_ph : rmap-(r_ph-1)/2);
%        vett_c = ((c_ph-1)/2 : c_ph : cmap-(c_ph-1)/2);

       map(vett_r,vett_c) = 1;      
                     
        
    case ('Not Uniform')

end
end


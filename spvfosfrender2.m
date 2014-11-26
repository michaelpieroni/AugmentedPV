function [ m ] = spvfosfrender2( inte,spread, nRow_rend,nCol_rend)

%%INPUT:
%   inte: matrice contenente i valori delle intensità;
%   spread: matrice contenente i valori delle ampiezze;
%   nRow_rend,nCol_rend: numero di righe e di colonne di pixel per ogni
%                        elettrodo;

%%OUTPUT:
%   m: matrice contenente i dati dell'immagine che è stata fosfenizzata

    r_ph = floor(nRow_rend/size(inte,1));
    c_ph = floor(nCol_rend/size(inte,2));
    fr = size(inte,1);
    fc = size(inte,2);
    
    % verify if r_ph and c_ph are pair or not pair
    if mod(r_ph,2) ~= 0 
       r_ph = r_ph-1;
    end
    if mod(c_ph,2) ~= 0
       c_ph = c_ph-1;
    end
      
    [ map ] = spvfosfmap( 'Uniform',fr,fc,r_ph,c_ph );
    
    % restituisce gli indici degli elementi non nulli presenti all'interno della mappa  
    [x,y] = find(map); 

    % creo una matrice di zeri che possiede la stessa dimensione della mappa
    m = zeros(size(map));
    
    lx = (-(r_ph)/2):((r_ph)/2); 
    ly = (-(c_ph)/2):((c_ph)/2);  
    
    [lX,lY] = meshgrid(lx,ly);
    for i = 1 : length(x)
        px = x(i);
        py = y(i);
        arg = ((lX.^2+lY.^2)./(spread(i).^2)); 
        frqfilt = inte(i).*exp(-arg);  
        frqfilt = frqfilt';
        
        mapr = (px-(r_ph)/2)+1 : (px+(r_ph)/2)+1;
        mapc = (py-(c_ph)/2)+1 : (py+(c_ph)/2)+1;
        
%         mapr = (px-(r_ph-1)/2)+1 : (px+(r_ph-1)/2)+1;
%         mapc = (py-(c_ph-1)/2)+1 : (py+(c_ph-1)/2)+1;
        m( mapr , mapc ) = frqfilt; 
    end  
            
                

end

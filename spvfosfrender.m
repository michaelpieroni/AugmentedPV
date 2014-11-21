function [ m ] = spvfosfrender( map,type_map,intensity,amplitude,r_ph,c_ph)

%%INPUT:
%   map: restituisce una mappa sparsa in cui sono presenti degli uni in
%        corrispondenza del centro di ogni fosfene
%   type_map: mappa dei fosfeni utilizzata uniforme oppure no 
%   amplitude: matrice che contiene i valori delle ampiezze dei fosfeni 
%   intensity: matrice che contiene i valori delle intensità dei fosfeni
%   r_h,c_ph: il numero di pixel per righe e per colonna di ogni fosfene; 


%%OUTPUT:
%   m: matrice contenente i dati dell'immagine che è stata fosfenizzata

% restituisce gli indici degli elementi non nulli presenti all'interno della mappa  
[x,y] = find(map); 

% creo una matrice di zeri che possiede la stessa dimensione della mappa
m = zeros(size(map));
switch(type_map)
    case{'Uniform'}
  
%             lx = (-r):(r); 
%             ly = (-c):(c); 
%% faccio una prova
       lx = (-(r_ph-1)/2):((r_ph-1)/2); 
       ly = (-(c_ph-1)/2):((c_ph-1)/2);
%%
            
       [lX,lY] = meshgrid(lx,ly);
       for i = 1 : length(x)
           px = x(i);
           py = y(i);
           arg = ((lX.^2+lY.^2)./(amplitude(i).^2)); 
           frqfilt = intensity(i).*exp(-arg);  
           frqfilt = frqfilt';
           mapr = (px-(r_ph-1)/2)+1 : (px+(r_ph-1)/2)+1;
           mapc = (py-(c_ph-1)/2)+1 : (py+(c_ph-1)/2)+1;
           m( mapr , mapc ) = frqfilt; 
       end  
                %% errore in questo passaggio 
%               m(px-r:px+r,py-c:py+c)=frqfilt;
%               mapr = px-(r-1)/2 : px+(r-1)/2;
%               mapc = py-(c-1)/2 : py+(c-1)/2;
                
           
      
    case {'Not Uniform'}
        error ('Not uniform is not already implemented')
%         [r_ph,c_ph]=size(map);
%         [x,y]=find(map);
%         m(1:2*r_ph,1:2*c_ph,length(x))=zeros(2*r_ph,2*c_ph);
%         lx=[-r_ph/2:r_ph/2-1];
%         ly=[-c_ph/2:c_ph/2-1];
%         [lX,lY]=meshgrid(lx,ly);
%         for i=1:length(x)
%             px=x(i)+r_ph/2;
%             py=y(i)+r_ph/2;
%             arg=((lX.^2+lY.^2)./(amplitude(i).^2)); frqfilt=intensity(i).*exp(-arg);  
%             frqfilt=frqfilt';
%             m(px-r_ph/2:px+r_ph/2-1,py-c_ph/2:py+c_ph/2-1,i)=frqfilt;
%            
%         end
%        m=cumsum(m,3);
%        m=m(:,:,length(x));
%        m=m(r_ph/2:r_ph+r_ph/2-1,c_ph/2:c_ph+c_ph/2-1);
end
                
            

end


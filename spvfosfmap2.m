function [ map_int,map_std] = spvfosfmap( type_map,fr,fc )

%%INPUT:
%   type_map tipo di mappa utilizzata: uniforme o non uniforme
%   fr e fc sono il numero di fosfeni er riga e per colonna

%%OUTPUT:
%   map_int: phosphene map intensity
%   map_std: phosphene map standard deviation

switch (type_map)
    case('Uniform')
        % by default intensity and std are equal to one
        map_int = ones(fr,fc);
        map_std = ones(fr,fc);
 
         
%         
%        % vado a settare il valore della mappa ad uno in corrispondenza del
%        % punto centrale del fosfene
%        vett_r = ((r_ph-1)/2 : r_ph : rmap-(r_ph-1)/2);
%        vett_c = ((c_ph-1)/2 : c_ph : cmap-(c_ph-1)/2);
%        map(vett_r,vett_c) = 1;  

                     
        
    case ('Not Uniform')
%         n=varargin{1}; %numero di fosfeni
%         r_ph=varargin{2}; %numero di righe della mappa di fosfeni
%         c_ph=varargin{3}; %numero di colonne della mappa di fosfeni
%         axis([1 r_ph 1 c_ph]) % setta gli assi
%         map=sparse(r_ph,c_ph); % crea una mappa di fosfeni sparsa
%         figure(1),grid minor; %genera il grafico con un griglia fine
%         [x,y]=ginput(n); % comando che permette di selezionare i punti dal mouse
%         close(1); %chiude la finestra 1
%         x=round(x); 
%         y=round(y);
%         for i=1:n
%            map(c_ph-y(i),x(i))=1; % viene posto a 1 la posizione del fosfene
%         end
%         dr=min(min(x,r_ph-x)); %rppresenta il minimo del vettore delle ascisse 
%         dc=min(min(y,c_ph-y)); %rappresenta il minimo del vettore delle ordinate
%         d=min(dr,dc); %rappresenta la distanza minima
%         varargout{1}=dr;
%         varargout{2}=dc;
%         varargout{3}=d;
end


end


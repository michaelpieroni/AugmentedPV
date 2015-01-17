function [ m ] = spvfosfrender2( inte,spread, nRow_rend,nCol_rend,mod_phos, varargin)

%%INPUT:
%   inte: matrice contenente i valori delle intensità;
%   spread: matrice contenente i valori delle ampiezze;
%   nRow_rend,nCol_rend: numero di righe e di colonne di pixel per ogni
%                        elettrodo;
% mod_phos:  specify how the intensity and amplitude maps have been computed
% varargin: to include dependency from 'Spatial response'

%%OUTPUT:
%   m: matrice contenente i dati dell'immagine che è stata fosfenizzata

    r_ph = floor(nRow_rend/size(inte,1));
    c_ph = floor(nCol_rend/size(inte,2));
    fr = size(inte,1);
    fc = size(inte,2);
    
    % verify if r_ph and c_ph are pair or not pair
    if mod(r_ph,2) ~= 0 
        if r_ph==1
            r_ph=2;
        else
            r_ph = r_ph-1;
        end
    end
    if mod(c_ph,2) ~= 0
        if c_ph==1
            c_ph=2;
        else
            c_ph = c_ph-1;
        end       
    end
      
    [ map ] = spvfosfmap( 'Uniform',fr,fc,r_ph,c_ph );
    
    % restituisce gli indici degli elementi non nulli presenti all'interno della mappa  
    [x,y] = find(map); 

    % creo una matrice di zeri che possiede la stessa dimensione della mappa
    m = zeros(size(map));
    
    
%     %CASE 1: limited window
%     
%     lx = (-(r_ph)/2):((r_ph)/2); 
%     ly = (-(c_ph)/2):((c_ph)/2);  
%     
%     [lX,lY] = meshgrid(lx,ly);
%     for i = 1 : length(x)
%         px = x(i);
%         py = y(i);
%         
%         switch mod_phos
%             case{'Intensity'}
%                 % TODO
%                 % This is valid if no 'spatial response' has been
%                 % considered'!!!!! TO INCLUDE IN THE FUTURE
%                 % Get the min window witdh
%                 std_v = min([r_ph,c_ph])/5; % considering 99.99% of the signal energy
%             case{'Amplitude'; 'Amplitude & Intensity'}
%                 std_v = spread(i);
%             otherwise
%                 error ('Not valid method of computation for the intensity and amplitude map!!')
%         end
%         arg = ((lX.^2+lY.^2)./(2*pi* std_v.^2)); 
%         frqfilt = inte(i).*exp(-arg);  
%         frqfilt = frqfilt';
%         
%         mapr = (px-(r_ph)/2)+1 : (px+(r_ph)/2)+1;
%         mapc = (py-(c_ph)/2)+1 : (py+(c_ph)/2)+1;
%         m( mapr , mapc ) = frqfilt; 
%     end  
%  


% è possibile andare ad analizzare più campioni utilizzando tipo correlazione o 
% devizione standard. Bisognerebbe quindi selezionare una sottomatrice, 
% analizzare solamente un elemento della matrice intera (definita in base 
% alla risoluzione che si vuole) e se tale valore non si discosta molto dagli
% altri allora si può assegnare ai restanti lo stesso valore in modo da
% evitare conti superflui
    
    %CASE 1: limited window
    
    lx = 1:size(map,2); 
    ly = 1:size(map,1); 
    
    % Phosphene coord
     xc = c_ph/2 : c_ph : size(map,2) - c_ph/2;
     yc = r_ph/2 : r_ph : size(map,1) - r_ph/2;
  
    [lX,lY] = meshgrid(lx,ly);
    switch mod_phos
        case{'Intensity'}
             
            % TODO
            % This is valid if no 'spatial response' has been
            % considered'!!!!! TO INCLUDE IN THE FUTURE
            % Get the min window witdh
            
            for i = 1 : length(yc) 
                for j = 1 :length(xc)
                    std_v = min([r_ph,c_ph])/5; % considering 99.99% of the signal energy
                    arg = ((lX - xc(i)).^2 + (lY - yc(j)).^2)./(2*pi* std_v.^2); 
<<<<<<< HEAD
                    frqfilt = inte(i,j).*exp(-arg);  
=======
                    frqfilt = inte(j,i).*exp(-arg);  
>>>>>>> origin/master
%                     frqfilt = frqfilt';
                    m = m + frqfilt;
                end
            end    
          
        case{'Amplitude'; 'Amplitude & Intensity'}
            for i = 1 : length(xc)
                for j = 1 :length(yc)
                    std_v = spread(j,i);
                    arg = ((lX - xc(i)).^2 + (lY - yc(j)).^2)./(2*pi* std_v.^2); 
                    frqfilt = inte(j,i).*exp(-arg);  
%                     frqfilt = frqfilt';
                    m = m + frqfilt;
                end
            end    
             
        otherwise
                error ('Not valid method of computation for the intensity and amplitude map!!')
    end
       
     
end

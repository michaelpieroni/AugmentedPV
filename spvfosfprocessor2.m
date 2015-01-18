function [ intensity,spread ] = spvfosfprocessor2( Im,type_map,mod_phos,dim_phos, varargin )

%%INPUT:
%   Im: matrice che contiene i dati dell'immagine
%   type_map: mappa dei fosfeni utilizzata uniforme oppure no 
%   mod_phos: indica se la modulazione dell'immagine avviene in base 
%             all'intensità, all'ampiezza oppure in entrambi i casi   
%   dim_phos: array che contiene il numero di fosfeni per riga(fr) e per 
%             colonna(fc) ed il numero di pixel per righe (r_ph) e di colonne
%             (c_ph) che contiene ogni fosfene; 

%%OUTPUT:
%   spread: matrice che contiene i valori delle ampiezze dei fosfeni 
%   intensity: matrice che contiene i valori delle intensità dei fosfeni

    phos_r = dim_phos{1};
    phos_c = dim_phos{2};
    rmap = dim_phos{3};   
    cmap = dim_phos{4};

%% Initialize output matrices
spread = ones(phos_r,phos_c);
intensity = zeros(phos_r,phos_c);

switch(type_map)
    case{'Uniform'}
        r_imPh = size(Im,1); % num row in the image ROI(region of interest)
        c_imPh= size(Im,2);  % num row in the image ROI(region of interest)
        
        % For row
        D_r = r_imPh/phos_r;
        sD_r = D_r/2;
        coord_r = sD_r:D_r:r_imPh;
        
        % For colunm
        D_c = c_imPh/phos_c;
        sD_c = D_c/2;
        coord_c = sD_c:D_c:c_imPh;
        
        %CHECK about phosphene coordinate dimension
        if not(length(coord_c) == length(coord_r))
            error('phosphene coordinate do not match in row and column')
        end

      
        vett_r = linspace(1,r_imPh,phos_r+1); % vector for row
        vett_c = linspace(1,c_imPh,phos_c+1); % vector for column
        
        % Floor the indices
        vettMIN_r = floor(vett_r); % vector for row
        vettMIN_c = floor(vett_c); % vector for column
        
        %Error in vett
        Dv_r = vett_r - vettMIN_r; 
        Dv_c = vett_c - vettMIN_c; 
        
         for ic = 2 : length(vett_c)
             for ir = 2:length(vett_r)
                %% DEFINITION of USEFUL INDICEs
                 indR = vettMIN_r(ir-1) : vettMIN_r(ir);
                 indC = vettMIN_c(ic-1) : vettMIN_c(ic);
                 indR_sup = min([vettMIN_r(ir)+1,r_imPh]);
                 indC_sup = min([vettMIN_c(ic)+1,c_imPh]);
                 
                %% GET IMAGE REGIONs
                 A0 = Im(indR, indC); %within lower bounders                 
                 A1 = Im(indR, indC_sup)*Dv_c(ic); %within higher column bounder                 
                 A2 = Im(indR_sup, indC)* Dv_r(ir); %within higher row bounder                 
                 A3 = Im(indR_sup, indC_sup)* Dv_c(ic)*Dv_r(ir); %within higher column & row bounders
                
                 %% Reshape Image Regions
                 B0 = reshape(A0,1,[]); 
                 B1 = reshape(A1,1,[]);
                 B2 = reshape(A2,1,[]);
                 B3 = reshape(A3,1,[]);
                 Btot = [B0,B1,B2,B3];
                
                 switch (mod_phos)
                      case('Amplitude')
                          spread(ir-1,ic-1) = std(Btot);
                          intensity(ir-1,ic-1) = 1; %normalized                         
                      case('Intensity')
                         spread(ir-1,ic-1) = 1; %normalized
                         intensity(ir-1,ic-1) = mean(Btot);
                     case('Amplitude & Intensity')
                         intensity(ir-1,ic-1) = mean(Btot);
                         spread(ir-1,ic-1) = std(Btot);
                 
                 end
             end
         end        
    case('Not Uniform')
        error ('Not uniform is not already implemented')
        
end


















%     case('Not Uniform')
%         dr=varargin{1};
%         dc=varargin{2};
%         d=varargin{3};
%         lr=round((d-1)*rim/rm);
%         lc=round((d-1)*cim/cm);
%         switch(ch)
%             case('Amplitude')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rm);
%                     yp=round(y(i)*cim/cm);
%                     amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 intensity=k*ones(length(x),1);
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%            case('Intensity')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rm);
%                     yp=round(y(i)*cim/cm);
%                     intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 amplitude=h*ones(length(x),1);
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%            case('& Amplitude-Intensity')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rm);
%                     yp=round(y(i)*cim/cm);
%                     amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                     intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%         end
%         
% end
% end

